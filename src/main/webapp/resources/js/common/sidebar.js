$(document).ready(function() {
    // 사이드바 토글 기능
    $('#sidebar-trigger').on('click', function() {
        $('#sidebar').toggleClass('show');
    });

    // 현재 페이지 메뉴 활성화
    const currentPath = window.location.pathname;
    $('.nav-link').each(function() {
        if (currentPath.includes($(this).attr('href'))) {
            $(this).addClass('active');
        }
    });
}); 