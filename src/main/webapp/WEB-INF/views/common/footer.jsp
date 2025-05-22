<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>
    footer{
        height: 200px;
        border-top: 1px solid lightgray;
    }
    footer a{color:black}
    .footer-info{
        list-style: "-  ";
        padding-left:30px;
    }
    .footer-copyright{text-align:center}
</style>

<footer class="m-3">
    <ul class="nav footer-link">
        <li class="nav-item">
            <a class="nav-link" href="#">이용약관</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">개인정보취급방침</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">인재채용</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">고객센터</a>
        </li>
    </ul>
    <ul class="footer-info">
        <li>상호명 : SSG I&C Academy</li>
        <li>대표자 : 신세계</li>
        <li>전화 : 02-123-4567</li>
        <li>개인정보책임자 : 아이앤씨 / test@ssgiandc.co.kr</li>
        <li>본관 : (08123) 서울특별시 강남구 삼성동</li>
    </ul>
    <div class="footer-copyright">
        Copyright ⓒ SSG I&C Academy. All rights reserved.
    </div>
</footer>