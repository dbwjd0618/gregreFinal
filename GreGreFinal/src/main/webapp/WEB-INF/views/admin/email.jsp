<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin header 선언 -->
<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

<!-- Right side column. Contains the navbar and content of the page -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        단체 이메일
        <small>단체 이메일</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">단체 이메일</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
            <div class="col-md-3">
                    <div class="box box-solid">
                      <div class="box-header with-border">
                        <h3 class="box-title">회원 목록</h3>
                      </div>
                      <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                          <li><a href="mailbox.html"><i class="fa fa-users"></i> 일반회원 </a></li>
                          <li><a href="#"><i class="fa fa-heart"></i>상담사</a></li>
                          <li><a href="#"><i class="fa fa-user-secret"></i> 관리자</a></li>
                        </ul>
                      </div><!-- /.box-body -->
                    </div><!-- /. box -->
                  </div><!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">단체 메일 발송</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <input class="form-control" placeholder="받는 사람:"/>
              </div>
              <div class="form-group">
                <input class="form-control" placeholder="제목:"/>
              </div>
              <div class="form-group">
                <textarea id="compose-textarea" class="form-control" style="height: 300px">
                  <h1><u>회원 여러분</u></h1>
                  <h4>Subheading</h4>
                  <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee</p>
                  <ul>
                    <li>List item one</li>
                    <li>List item two</li>
                    <li>List item three</li>
                    <li>List item four</li>
                  </ul>
                  <p>Thank you,</p>
                  <p>John Doe</p>
                </textarea>
              </div>
              <div class="form-group">
                <div class="btn btn-default btn-file">
                  <i class="fa fa-paperclip"></i> 첨부파일
                  <input type="file" name="attachment"/>
                </div>
                <p class="help-block">Max. 32MB</p>
              </div>
            </div><!-- /.box-body -->
            <div class="box-footer">
              <div class="pull-right">
                <button class="btn btn-default"><i class="fa fa-pencil"></i> 수정하기</button>
                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 전송</button>
              </div>
              <button class="btn btn-default"><i class="fa fa-times"></i> 취소</button>
            </div><!-- /.box-footer -->
          </div><!-- /. box -->
        </div><!-- /.col -->
      </div><!-- /.row -->
    </section><!-- /.content -->
  </div><!-- /.content-wrapper -->


<!-- admin footer 선언 -->
<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>