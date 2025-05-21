$(document).ready(function() {
    const link = $('a[href="/stores"]');
    if (link.length > 0) link.addClass('active');

    const contextPath = $('meta[name="context-path"]').attr('content');
    $('.store-row').on('click', function() {
        const id = $(this).data('id');
        window.location.href = contextPath + '/stores/' + id;
    });

    let map = null;
    let marker = null;

    $('.show-map').on('click', function(e) {
        e.stopPropagation(); // 이벤트 버블링 방지
        const $this = $(this);
        const lat = $this.data('lat');
        const lon = $this.data('lon');
        const name = $this.data('name');
        
        const $modal = $('#mapModal');
        $modal.modal('show');
        
        // 모달이 표시된 후 지도 생성
        $modal.on('shown.bs.modal', function () {
            const position = new kakao.maps.LatLng(lat, lon);
            
            if (!map) {
                map = new kakao.maps.Map(document.getElementById('map'), {
                    center: position,
                    level: 3
                });
            } else {
                map.setCenter(position);
            }
            
            if (marker) {
                marker.setMap(null);
            }
            
            marker = new kakao.maps.Marker({
                position: position,
                map: map
            });
            
            const infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;font-size:12px;">' + name + '</div>'
            });
            infowindow.open(map, marker);
        });
    });
}); 