<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    //게시판 리스트 처리-페이징
//1. 전체 게시물 수 처리 (bdcnt:641)
//2. 페이지당 보여줄 게시물 수 지정 (perPage=10)
//3. 총 페이지 수 계산 (=> 64+1)
//4. 현재 페이지 번호 (cp, )
//ex) list.do?cp=1 : 641 ~ 632
//ex) list.do?cp=2 : 631 ~ 622
//ex) list.do?cp=3 : 621 ~ 612
//...
//ex) list.do?cp=n : X ~ X - 9
%>

    <c:set var="cp" value="${param.cp}" />

    <%--만약 cp 값이 null 이면 1로 설정--%>
    <c:if test="${cp eq null}">
        <c:set var="cp" value="1" />
    </c:if>

    <fmt:parseNumber var="cp" value="${param.cp}" />
    <fmt:parseNumber var="perPage" value="10" />
    <fmt:parseNumber var="bdcnt" value="${bdcnt}" />

    <c:set var="totalPage" value="${bdcnt / perPage}" />

    <c:if test="${ (bdcnt % perPage) > 0 }" >
        <c:set var="totalPage" value="${totalPage + 1}" />
    </c:if> <%-- 무조건 올림 처리--%>

    <fmt:parseNumber var="totalPage" value="${totalPage}" integerOnly="true" />

    <fmt:parseNumber var="startPage" integerOnly="true" value="${((cp -1)/ perPage)}" />  <%-- integer only 를 쓴이유는 실수부라 계산이 안되서 정수부로 나오기 위해--%>
    <fmt:parseNumber var="startPage" value="${startPage* 10 + 1 }" />
    <c:set var="endPage" value="${startPage + 10 - 1}" />

    <%-- 글번호 계산하기 --%>
    <c:set var="sbno" value="${bdcnt - (cp-1) * perPage}" />

    <!-- 메인영역 시작 -->
    <div id="main">
        <div class="margin30">
            <i class="fa fa-comments fa-2x"> 자유게시판 ${bdcnt} ${totalPage} ${endPage} </i>
            <hr>
        </div> <!-- 타이틀 -->

        <div class="row margin1050">
            <div class="col-12 text-right">
                <c:if test="${not empty UID}">
                <button type="button" id="newbd"
                        class="btn btn-light">
                    <i class="fa fa-plus-circle"> </i>
                    새글쓰기
                    </c:if>
                    <c:if test="${empty UID}">
                    <button type="button"
                            class="btn btn-light" disabled>
                        <i class="fa fa-plus-circle"> </i>
                        로그인 후 시도해 주세요
                    </c:if>
                </button>
            </div>
        </div><!-- 버튼들 -->

        <div class="row margin1050">
            <div class="col-12">
                <table class="table table-striped"
                    style="border-bottom: 3px solid black;
                           border-top: 3px solid black">
                    <thead style="background: #dff0d8">
                        <tr><th style="width: 7%">번호</th>
                            <th>제목</th>
                            <th style="width: 12%">작성자</th>
                            <th style="width: 10%">작성일</th>
                            <th style="width: 7%">추천</th>
                            <th style="width: 7%">조회</th></tr>
                    </thead>
                    <tbody>
                        <tr><th>공지</th>
                            <th><span class="badge badge-danger">Hot</span>
                            '다크나이트 라이지즈' 예매권 증정이벤트 실시!!</th>
                            <th>운영자</th>
                            <th>2012.07.15</th>
                            <th>10</th>
                            <th>128</th></tr>

                        <c:forEach var="b" items="${bdlist}">
                            <tr><td>${sbno}</td>
                            <td><a href="board/view.do?bno=${b.bno}">
                                                ${b.title}</a></td>
                            <td>${b.userid}</td>
                            <td>${ fn:substring(b.regdate,0,10) }</td>
                            <td>${b.thumbup}</td>
                            <td>${b.views}</td></tr>
                            <c:set var="sbno" value="${sbno -1}" />
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div><!-- 게시판 목록 -->

        <div class="row margin1050">
            <div class="col-12">
                <nav>
                    <ul class="pagination justify-content-center">

                        <c:if test="${cp > 10}" >
                        <li class="page-item">
                            <a href="/board/list.do?cp=${cp-10}" class="page-link">이전</a></li>
                        </c:if>

                        <c:set var="break" value="false"/>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">

                            <%--현재 페이지가 총 페이지수 보다 같거나 작으면 출력 계속--%>
                            <c:if test="${i le totalPage}">

                            <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="/board/list.do?cp=${i}" class="page-link">${i}</a></li>
                            </c:if>
                            <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="/board/list.do?cp=${i}" class="page-link">${i}</a></li>
                            </c:if>

                            </c:if>
                        </c:forEach>

                        <c:if test="${endPage < totalPage}">
                        <li class="page-item">
                            <a href="/board/list.do?cp=${cp+10}" class="page-link">다음</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div><!-- 페이지 네비게이션 -->

    </div>
    <!-- 메인영역 끝 -->

