/* ============ CRM main.js — shared helpers ============ */

function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
const CSRF_TOKEN = getCookie('csrftoken');

function csrfSafeMethod(method) {
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

$.ajaxSetup({
    crossDomain: false,
    beforeSend: function (xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", CSRF_TOKEN);
        }
    }
});

/* Loading overlay */
function showLoading() { $('#loadingOverlay').removeClass('d-none'); }
function hideLoading() { $('#loadingOverlay').addClass('d-none'); }

$(document).ajaxStart(function () { showLoading(); })
           .ajaxStop(function () { hideLoading(); });

/* Toast notifications */
function toast(title, icon = 'success') {
    const Toast = Swal.mixin({
        toast: true, position: 'top-end', showConfirmButton: false,
        timer: 3200, timerProgressBar: true
    });
    Toast.fire({ icon: icon, title: title });
}

/* SweetAlert2 confirm delete */
function confirmDelete(url, callback, text = 'This action cannot be undone!') {
    Swal.fire({
        title: 'Are you sure?',
        text: text,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#dc3545',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post(url).done(function (res) {
                if (res.success) {
                    toast(res.message || 'Deleted!');
                    if (callback) callback(res);
                } else {
                    Swal.fire('Error', res.message || 'Operation failed', 'error');
                }
            }).fail(function (xhr) {
                const res = xhr.responseJSON || {};
                Swal.fire('Error', res.message || 'Server error', 'error');
            });
        }
    });
}

function handleAjaxError(xhr) {
    const res = xhr.responseJSON || {};
    Swal.fire('Error', res.message || ('Request failed (' + xhr.status + ')'), 'error');
}

/* Serialize form into object (handles arrays) */
function formToObject($form) {
    const data = {};
    $form.serializeArray().forEach(item => {
        if (item.name.endsWith('[]')) {
            const key = item.name.slice(0, -2);
            (data[key] = data[key] || []).push(item.value);
        } else {
            data[item.name] = item.value;
        }
    });
    return data;
}

/* Standard DataTables config with export buttons */
function initDataTable(selector, url, columns, opts = {}) {
    const exportOpts = { columns: ':visible:not(.no-export)' };
    const base = {
        processing: true,
        pageLength: opts.pageLength ?? 10,
        lengthMenu: [10, 25, 50, 100],
        order: [[opts.orderCol ?? 0, opts.order ?? 'desc']],
        dom: "<'row mb-2'<'col-md-8'B l><'col-md-4'f>>rt<'row mt-2'<'col-md-5'i><'col-md-7'p>>",
        buttons: [
            { extend: 'copy', className: 'btn-sm', exportOptions: exportOpts },
            { extend: 'csv', className: 'btn-sm', exportOptions: exportOpts },
            { extend: 'excel', className: 'btn-sm', exportOptions: exportOpts },
            { extend: 'pdf', className: 'btn-sm', exportOptions: exportOpts },
            { extend: 'print', className: 'btn-sm', exportOptions: exportOpts }
        ],
        language: {
            processing: '<div class="spinner-border spinner-border-sm text-primary me-2"></div>Loading...',
            emptyTable: 'No records found'
        },
        ...opts.extra
    };
    if (url) {
        base.serverSide = opts.serverSide !== false;
        base.ajax = {
            url: url,
            data: d => { if (opts.filters) opts.filters(d); },
            error: function (xhr) {
                hideLoading();
                Swal.fire('Error', 'Could not load data (' + xhr.status + '). ' +
                          (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : ''),
                          'error');
            }
        };
        base.columns = columns;
    } else {
        base.serverSide = false;
    }
    return $(selector).DataTable(base);
}

/* Dark mode toggle */
$(document).ready(function () {
    if (localStorage.getItem('theme') === 'dark') {
        document.documentElement.setAttribute('data-bs-theme', 'dark');
        $('body').addClass('dark-mode');
        $('#darkModeToggle i').attr('class', 'fa-solid fa-sun');
    }

    $(document).on('click', '#darkModeToggle', function () {
        const dark = localStorage.getItem('theme') === 'dark';
        if (dark) {
            localStorage.setItem('theme', 'light');
            document.documentElement.setAttribute('data-bs-theme', 'light');
            $('body').removeClass('dark-mode');
            $(this).find('i').attr('class', 'fa-solid fa-moon');
        } else {
            localStorage.setItem('theme', 'dark');
            document.documentElement.setAttribute('data-bs-theme', 'dark');
            $('body').addClass('dark-mode');
            $(this).find('i').attr('class', 'fa-solid fa-sun');
        }
        setTimeout(() => window.location.reload(), 250);
    });

    // Sidebar
    $(document).on('click', '#sidebarToggle', function () {
        if ($(window).width() < 992) {
            $('body').toggleClass('sidebar-open');
        } else {
            $('body').toggleClass('collapsed');
        }
    });
    $(document).on('click', '#sidebarClose', function () {
        $('body').removeClass('sidebar-open');
    });

    // Global customer search (AJAX)
    let searchTimer = null;
    $('#globalSearch').on('keyup', function () {
        const q = $(this).val();
        clearTimeout(searchTimer);
        if (!q || q.length < 2) { $('#searchResults').addClass('d-none'); return; }
        searchTimer = setTimeout(function () {
            $.get('/customers/data/', { 'search[value]': q, draw: 1, start: 0, length: 6,
                'columns[0][data]': 'company_name' })
                .done(function (res) {
                    const $box = $('#searchResults');
                    if (!res.data || !res.data.length) {
                        $box.html('<a href="javascript:void(0)">No customers found</a>').removeClass('d-none');
                        return;
                    }
                    $box.html(res.data.map(c =>
                        `<a href="/customers/${c.id}/"><i class="fa-solid fa-building-user me-2 text-primary"></i>${c.company_name} <small class="text-muted">(${c.customer_code})</small></a>`
                    ).join('')).removeClass('d-none');
                });
        }, 300);
    });
    $(document).on('click', function (e) {
        if (!$(e.target).closest('.topbar-search').length) {
            $('#searchResults').addClass('d-none');
        }
    });

    // Notifications polling + bell dropdown
    function refreshNotifications(openToastForNew = false) {
        $.ajax({ url: '/notifications/poll/', global: false }).done(function (res) {
            const $count = $('#notifCount');
            $count.text(res.unread);
            $count.toggleClass('d-none', res.unread === 0);
            if (res.notifications.length) {
                $('#notifList').html(res.notifications.map(n => `
                    <div class="notif-item ${n.is_read ? '' : 'unread'}" onclick="markRead(${n.id})">
                        <div class="fw-semibold"><i class="fa-solid fa-circle-${n.type === 'success' ? 'check text-success' : n.type === 'warning' ? 'exclamation text-warning' : n.type === 'danger' ? 'xmark text-danger' : 'info text-primary'}"></i> ${n.title}</div>
                        <div class="small text-muted">${n.message}</div>
                        <div class="small text-muted">${n.when}</div>
                    </div>`).join(''));
            } else {
                $('#notifList').html('<div class="p-3 text-muted small">No notifications yet.</div>');
            }
        });
    }
    refreshNotifications();
    setInterval(refreshNotifications, 20000);
    window.refreshNotifications = refreshNotifications;

    $(document).on('show.bs.dropdown', '#notifBell', refreshNotifications);
});

window.markRead = function (id) {
    $.ajax({ url: `/notifications/${id}/mark-read/`, method: 'POST', global: false }).done(refreshNotifications);
};
window.markAllRead = function () {
    $.ajax({ url: '/notifications/mark-read/', method: 'POST', global: false }).done(function () { toast('All marked as read'); refreshNotifications(); });
};

/* Currency formatting helper */
function fmtMoney(n) {
    return parseFloat(n || 0).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}
