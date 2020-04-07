<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- taglib는 매 jsp 마다 필요함 -->

<!-- 한글깨질때. -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/shop/admin/common/header.jsp"/>
<!-- contents begin-->
        <div class="container">
          <div class="row">
             <div class="col-lg-9">
               <!-- contents begin-->
                <div class="site-section" style="padding-top: 10px;">
                    <div class="container" style="padding:0px;">
                        <div class="row">
                            <div class="col-md-6"><span style="font-size:x-large">게시글 작성</span></div>
                        </div>
                        <table id="content" style="width:100%;">
                            <tr>
                                <td><input type="text" name="postTitle" placeholder="제목을 입력하세요." style="width:100%;"/></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="postContent" style="width:100%; min-height:300px;" placeholder="내용을 입력하세요."/></td>
                            </tr>
                            <tr style="border-bottom : unset;">
                                <td><button>글쓰기</button>&nbsp;<button onclick="location.href='notice.do'">취소</button></td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                <!-- contents end-->