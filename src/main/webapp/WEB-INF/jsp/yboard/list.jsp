<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
            <i class="fa fa-comments fa-2x"> 맛집게시판</i>
            <hr>
        </div> <!-- 타이틀 -->

        <div class="row margin1050">
            <div class="col-12 text-right">
                <button type="button" id="newybd"
                        class="btn btn-light">
                    <i class="fa fa-plus-circle"> </i>
                    새글쓰기
                </button>
            </div>
        </div><!-- 버튼들 -->

        <div class="row margin1050">
            <div class="col-12">
                <table class="table table-striped"
                    style="border-bottom: 3px solid black;
                           border-top: 3px solid black">
                    <thead style="background: #dff0d8">

                    </thead>
                    <tbody>

                    <c:forEach var="y" items="${ybdlist}" >

                            <div class="row text-center text-lg-left">
                            <div class="col-lg-5 col-md-4 col-6" style="align:middle;">
                                <a href="/yboard/view.do?yno=${y.yno}" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
                                 ${y.yno}
                                </a>
                            </div>

                                <div class="row margin1050">
                                    <div class="col-12">
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a href="/gallery/view?gno=1">
                                                    <img src="/resources/img/cat01.png" class="img-thumbnail"></a></li>

                                        </ul>
                                    </div>
                                </div>
                        </div>

                            </c:forEach>

                        </tr>

                        <th>
                            <div class="row text-center text-lg-left">
                            <div class="col-lg-3 col-md-4 col-6">
                                <img class="img-fluid img-thumbnail" src="\c:Java/psdupload/test.jpg" alt="\c:Java/psdupload/test.jpg">
                            </div>
                        </div>
                        </th>


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
                                <a href="/yboard/list.do?cp=${cp-10}" class="page-link">이전</a></li>
                        </c:if>

                        <c:set var="break" value="false"/>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">

                            <%--현재 페이지가 총 페이지수 보다 같거나 작으면 출력 계속--%>
                            <c:if test="${i le totalPage}">

                                <c:if test="${i eq cp}">
                                    <li class="page-item active">
                                        <a href="/yboard/list.do?cp=${i}" class="page-link">${i}</a></li>
                                </c:if>
                                <c:if test="${i ne cp}">
                                    <li class="page-item">
                                        <a href="/yboard/list.do?cp=${i}" class="page-link">${i}</a></li>
                                </c:if>

                            </c:if>
                        </c:forEach>

                        <c:if test="${endPage < totalPage}">
                            <li class="page-item">
                                <a href="/yboard/list.do?cp=${cp+10}" class="page-link">다음</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div><!-- 페이지 네비게이션 -->

    </div>
    <!-- 메인영역 끝 -->

