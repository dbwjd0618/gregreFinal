<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

 <style>
 .board-cancel{
 	border-style:none;
 	background-color:white;
 }
 
 </style>
 
<script>
$(document).ready(function(){
	let boardCodeNum = 0;
	
	/* '+'버튼을 누르면 계속 추가됨 */
    $("#add").click(function(){
      var div = $("<div style='margin: 20px 0; text-align:center;' id='boardCodeCreate-"+ ++boardCodeNum +"' ></div>");
      var form = $("<form action='' method='POST' class='form-inline'></form>");
      form.append("<button type='button' class='board-cancel' value='boardCodeCreate-"+ boardCodeNum +"'><i class='far fa-times-circle fa-lg'></i></button>");
      form.append("<div class='form-group'><label for='boardCode'>게시판 코드</label><input type='text' class='form-control' style='margin: 0 10px;'  id='boardCode' placeholder='게시판 코드'></div>");
      form.append("<div class='form-group'><label for='boardName'>게시판 이름</label><input type='text' class='form-control' style='margin: 0 10px;'  id='boardName' placeholder='게시판 이름'></div>");
      form.append("<button type='submit' class='btn btn-default'>생성</button>");
      div.html(form);

      div.insertAfter($(this).slideDown(5000));
      
      /* 'x'아이콘을 누르면 한줄씩 삭제됨 */
	    $(".board-cancel").click(function(){
	    	let thisNum = $(this).val();
	    	/* console.log(thisNum) */
	    	$("div#"+thisNum).remove();
			    	
	    })
    });
}); 

</script>
 
<!-- Right side column. Contains the navbar and content of the page -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <h1>
                게시판
                <small>게시판 목록</small>
              </h1>
              <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">게시판 관리</a></li>
                <li class="active">게시판 목록</li>
              </ol>
            </section>
    
            <!-- Main content -->
            <section class="content">
              <div class="row">
                <div class="col-xs-12">
                  <div class="box">
                    <div class="box-header">
                      <h3 class="box-title">게시판 목록</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='./notice.html'">공지사항</button>
                        <button type="button" class="btn btn-primary btn-lg btn-block">자료실</button>
                        <button type="button" class="btn btn-primary btn-lg btn-block" id="add"><i class="fa fa-plus"></i></button>
                    </div><!-- /.box-body -->
                  </div><!-- /.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </section><!-- /.content -->
          </div><!-- /.content-wrapper -->





<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>

