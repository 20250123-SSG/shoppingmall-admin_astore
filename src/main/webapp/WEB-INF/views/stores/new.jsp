<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
    <h2 class="mb-4">매장 등록</h2>
    <div class="card">
        <div class="card-body">
            <form id="storeForm" method="post" action="${pageContext.request.contextPath}/stores">
                <div class="mb-3">
                    <label for="storeName" class="form-label">매장명</label>
                    <input type="text" class="form-control" id="storeName" name="storeName" required>
                </div>
                <div class="mb-3">
                    <label for="storeNumber" class="form-label">매장번호</label>
                    <input type="text" class="form-control" id="storeNumber" name="storeNumber" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">주소 찾기</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="storeAddress" name="storeAddress" placeholder="주소" readonly required>
                        <button type="button" class="btn btn-outline-secondary" id="btnPostcode">주소 검색</button>
                    </div>
                </div>
                <input type="hidden" id="storeZip" name="storeZip">
                <input type="hidden" id="storeLat" name="storeLat">
                <input type="hidden" id="storeLon" name="storeLon">

                <button type="submit" class="btn btn-success">등록</button>
                <a href="${pageContext.request.contextPath}/stores" class="btn btn-secondary">취소</a>
            </form>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01f42a2f5518af601feb0078ce5c94b4&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('btnPostcode').addEventListener('click', function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('storeAddress').value = data.address;
                    document.getElementById('storeZip').value     = data.zonecode;
                    /*
                    console.log('도로명주소 : ' + data.roadAddress);
                    console.log('지번주소   : ' + data.jibunAddress);
                    console.log('우편번호   : ' + data.zonecode);
                     */

                    const geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch(data.roadAddress, (result, status) => {
                        if (status === kakao.maps.services.Status.OK) {
                            /*
                            console.log('위도 : ' + result[0].y);
                            console.log('경도 : ' + result[0].x);
                             */
                            document.getElementById('storeLat').value = result[0].y;
                            document.getElementById('storeLon').value = result[0].x;
                        }
                    });
                }
            }).open();
        });
    });
</script>