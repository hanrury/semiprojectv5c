<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <%--<tr><th style="width: 7%">번호</th>--%>
                            <%--<th>제목</th>--%>
                            <th style="width: 12%">이미지</th>
                            <th style="width: 10%">작성일</th>
                            <th style="width: 7%">추천</th>
                            <th style="width: 7%">조회</th></tr>
                    </thead>
                    <tbody>
                        <%--<tr><th>공지</th>--%>
                            <%--<th><span class="badge badge-danger">Hot</span>--%>
                            <%--'다크나이트 라이지즈' 예매권 증정이벤트 실시!!</th>--%>
                            <%--<th>운영자</th>--%>
                            <%--<th>2012.07.15</th>--%>
                            <%--<th>10</th>--%>
                            <%--<th>128</th></tr>--%>


                        <%--testing for images--%>

                            <%--<th>--%>
                                <%--<div img="../../img/cat01.png"></div>--%>

                            <%--</th>--%>


                        <tr><th>
                            <div class="row text-center text-lg-left">
                            <div class="col-lg-5 col-md-4 col-6" style="align:middle;">
                                <a href="yboard/view.do?yno=1" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
                                </a>
                            </div>
                        </div>
                        </th>
                        <th>2020.05.31</th>
                        <th>1</th>
                        <th>1</th>

                        </tr>

                        <th>
                            <div class="row text-center text-lg-left">
                            <div class="col-lg-3 col-md-4 col-6">
                                <img class="img-fluid img-thumbnail" src="\c:Java/psdupload/test.jpg" alt="\c:Java/psdupload/test.jpg">
                            </div>
                        </div>
                        </th>

                        <th>
                            <div>
                                <c:forEach var="p" items="${plist}">
                                    <tr>
                                        <td>${p.fname}</td>
                                        <td>${p.fsize}</td>
                                    </tr>
                                </c:forEach>
                            </div>
                        </th>
                        <%--testing for the images end --%>



                        <%--<c:forEach var="y" items="${ybdlist}">--%>
                            <%--<tr><td>${y.yno}</td>--%>
                            <%--<td><a href="yboard/view.do?yno=${y.yno}">--%>
                                                <%--${y.title}</a></td>--%>
                            <%--&lt;%&ndash;<td>${b.userid}</td>&ndash;%&gt;--%>
                            <%--<td>${ fn:substring(b.regdate,0,10) }</td>--%>
                           <%--&lt;%&ndash; <td>${b.thumbup}</td>&ndash;%&gt;--%>
                            <%--<td>${b.views}</td></tr>--%>
                        <%--</c:forEach>--%>

                    </tbody>
                </table>
            </div>
        </div><!-- 게시판 목록 -->

        <div class="row margin1050">
            <div class="col-12">
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a href="#" class="page-link">이전</a></li>
                        <li class="page-item active">
                            <a href="#" class="page-link">1</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">2</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">3</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">4</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">5</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">6</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">7</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">8</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">9</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">10</a></li>
                        <li class="page-item ">
                            <a href="#" class="page-link">다음</a></li>
                    </ul>
                </nav>
            </div>
        </div><!-- 페이지 네비게이션 -->

    </div>
    <!-- 메인영역 끝 -->

