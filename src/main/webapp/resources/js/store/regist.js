document.addEventListener('DOMContentLoaded', function () {
  // 우편번호 검색 버튼 / 주소 입력창 이벤트 바인딩
  const btnPostcode  = document.getElementById('btnPostcode');
  const addrInput    = document.getElementById('storeAddress');
  btnPostcode.addEventListener('click', openPostcode);
  addrInput.addEventListener('click', openPostcode);

  // 우편번호 API 호출
  function openPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        addrInput.value = data.address;
        document.getElementById('storeZipCode').value = data.zonecode;

        const geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(
          data.roadAddress,
          function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
              document.getElementById('storeLat').value = result[0].y;
              document.getElementById('storeLon').value = result[0].x;
            }
          }
        );
      }
    }).open();
  }
});