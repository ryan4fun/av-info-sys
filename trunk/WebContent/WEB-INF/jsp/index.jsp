<%@page import="com.demo.bo.User"%>
<%@page import="com.demo.action.SessionContainer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	SessionContainer se=(SessionContainer)session.getAttribute("sessionContainer");
	User user;
	String title="Hey boddy!不来一发么?";
	if(se!=null && se.getUser()!=null){
		user=se.getUser();
		title="Let's do it! Dear "+user.getNickname();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title %></title>
<link rel="stylesheet" type="text/css" href="/css/toastr.min.css"/>

<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/bootstrap-responsive.min.css" rel="stylesheet" />

<link href="/css/fonts.css" rel="stylesheet" />
<link href="/css/font-awesome.css" rel="stylesheet" />

<script src="/jquery/jquery-1.8.3.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<script>
	function register(){
		$.post("index.do?action=RegisterAction",{
			username:$("#username").val(),
			password:$("#password").val(),
			nickname:$("#nickname").val(),
			email:$("#email").val()
		}).done(function(data){
			toastr.success("恭喜您注册成！","提示信息");
			$("#register").modal("hide");
			setTimeout(window.location.href="/index.do?action=IndexAction",1000);
		}).fail(function(data){
			toastr.error(data.responseText,"sdfsdfsdf");
		});
	}
	
	//初始化
	$(function(){
		$("#login_btn").click(function(){
			$("#login_btn").button('loading');
			$.post("index.do?action=LoginAction",{
				name:$("#account").val(),
				password:$("#pass").val(),
				authCode:$("#auth").val()
			}).done(function(data){
				console.log("data",data);
				//window.location.href="/index.do?action=IndexAction";
			}).fail(function(data){
				$("#login_btn").button('reset');
				toastr.warning(data.responseText,"再想想");
			});			
		});
		$("#register_btn").click(function(){
			$(this).button("loading");
			$.post("index.do?action=RegisterAction",{
				username:$("#username").val(),
				password:$("#password").val(),
				nickname:$("#nickname").val(),
				email:$("#email").val(),
				authCode:$("#reg_auth").val()
			}).done(function(data){
				toastr.success("恭喜您注册成！","提示信息");
				$("#register").modal("hide");
				setTimeout(window.location.href="/index.do?action=IndexAction",2000);
			}).fail(function(data){
				$(this).button("reset");
				toastr.error(data.responseText,"注册失败了");
			});			
		});
	});
</script>
<style>
.band-banner{
	padding:40px 0 0 0;
	margin:0px;
	border-radius:0px;
}
.band-banner{
	height:75px;
}
.logo{
	background-image: url("/images/logo.png");
	height:70px;
	width:280px;
}
.content{
	padding:20px 0 0 0;
}
.clear{
	clear:both;
}

</style>

<body>
	<!-- fixed header -->
    <div class="navbar navbar-fixed-top">
	    <div class="navbar-inner">
		    <div class="container" style="width:100%;">
		    	<div class="nav-collapse">
		          <ul class="nav">
		            <li class="active"><a href="#">主页<i class="icon-star"></i></a></li>
		            <li><a href="#">影片<i class="icon-facetime-video"></i></a></li>
		            <li><a href="#">演员<i class="icon-camera"></i></a></li>
		            <li><a href="#">片商<i class="icon-bar-chart"></i></a></li>
		            <li class="dropdown">
		              <a data-toggle="dropdown" class="dropdown-toggle" href="#">更多 <b class="caret"></b></a>
		              <ul class="dropdown-menu">
		                <li><a href="#">动作</a></li>
		                <li><a href="#">另一个动作</a></li>
		                <li><a href="#">其他动作</a></li>
		                <li class="divider"></li>
		                <li class="nav-header">导航头</li>
		                <li><a href="#">被间隔的链接</a></li>
		                <li><a href="#">另一个链接</a></li>
		              </ul>
		            </li>
		          </ul>
		          <ul class="nav pull-right">
				 <%if(se!=null && se.getUser()!=null){%>
		            <li class="dropdown">
		              <a data-toggle="dropdown" class="dropdown-toggle" href="#"><%=se.getUser().getNickname() %><b class="caret"></b></a>
		              <ul class="dropdown-menu">
						<li><a href="#">动作</a></li>
		                <li><a href="#">另一个动作</a></li>
		                <li><a href="#">其他动作</a></li>
		                <li class="divider"></li>
		                <li class="nav-header">导航头</li>
		                <li><a href="#">被间隔的链接</a></li>
		                <li><a href="#">另一个链接</a></li>
		              </ul>
		            </li>


		            <li class="divider-vertical"></li>
		         <%}%>   
		            
		            <li>
		            	<%if(se!=null && se.getUser()!=null){%>
				    		<a href="#" onclick="logout()">注销</a>
				    	<%}else{%>
				    		<li><a data-toggle="modal" href="#register"  data-keyboard="true" data-backdrop="true">注册</a></li>
				    	<%}%>
		            </li>
		            
		            

		          </ul>  
		        </div>
		    </div>
	    </div>
    </div>



	<!-- 注册用户对话框 -->
    <div class="modal hide fade" id="register">
	    <div class="modal-header">
	    	<a class="close" data-dismiss="modal">×</a>
	    	<h3>立刻加入我们！</h3>
	    </div>
	    <div class="modal-body">
	    	<p>
	    		<form class="form-horizontal">
	    			<fieldset>
						<div class="control-group">
							<label class="control-label">账户</label>
							<div class="controls">
								<input type="text" id="username">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">昵称</label>
							<div class="controls">
								<input type="text" id="nickname">
							</div>
						</div>						
						<div class="control-group">
							<label class="control-label">密码</label>
							<div class="controls">
								<input type="password" id="password">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">重复密码</label>
							<div class="controls">
								<input type="password" id="password2">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">电子邮件</label>
							<div class="controls">
								<input type="text" id="email">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><a href="#"  onclick="$('#reg_img').attr('src','/auth?'+Math.random())">给爷换一个验证码</a></label>
							<div class="controls">
								<input type="text" id="reg_auth" style="width:80px;"><img id="reg_img" alt="" src="/auth">
							</div>
						</div>										    				
	    			</fieldset>
	    		</form>
	    	</p>
	    </div>
	    <div class="modal-footer">

	    	  <label class="checkbox pull-left" style="width:130px;">
                <input type="checkbox" checked="true">本人已经阅读<a href="#">站点条款</a>
              </label>
			  <input id="register_btn" type="button" class="btn btn-primary" data-loading-text="数据验证中..." value="注册">
	    </div>
    </div>






	<!-- banner header -->
	<div class="band-banner alert alert-info">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="logo"></div>
				</div>
				<div class="span4">
					<div style="padding-top:23px;">
						  <ul class="nav nav-pills">
					        <li class="active"><a href="#">主页</a></li>
					        <li><a href="#">演员动态</a></li>
					        <li><a href="#">最新上映</a></li>
					        <li><a href="#">永恒经典</a></li>
					      </ul>					
					</div>

				</div>
				<div class="span4">
					<div style="padding-top:23px;">
					  <div class="input-append">
		                <input class="search-query" placeholder="输入搜索内容关键词..." type="text" size="16" id="appendedPrependedInput" style="margin-bottom:0px;"><button type="button" class="btn btn-warning"><i class="icon-search"></i>搜索</button>
		              </div>
		              	热门关键词：你懂的
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- body content -->
	<div class="content">
		<div class="container">
		<%if(se==null || se.getUser()==null){ %>
			<div class="row">
					<div class="alert alert-warning">
						<a class="close" data-dismiss="alert">×</a>
						<h4>快让我进去！</h4>
						<div class="row">
							<div class="span4">
								<form class="form-horizontal" style="margin: 0 0 0 0;">
									<fieldset>
										<div class="control-group">
											<div class="controls" style="margin-left:0px;">
												<input type="text" placeholder="那你输入账号呗" id="account" value="">
											</div>
										</div>
										<div class="control-group">
											<div class="controls" style="margin-left:0px;">
												<input type="password" placeholder="还有密码..." id="pass" value="">
											</div>
										</div>
										<div class="control-group">
											<div class="controls" style="margin-left:0px;">
												<img alt="" style="cursor:pointer;" src="/auth">
												<a href="#" onclick="$(this).prev().attr('src','/auth?'+Math.random())">给爷换一个</a>
												<input style="width:75px;" type="text" placeholder="验证码哟亲" id="auth" value="">
												
											</div>
										</div>
										<input type="button" class="btn btn-success" data-loading-text="正在登录..." style="width:100px;margin-left:120px;" id="login_btn" value="登录">
									</fieldset>
								</form>							
							</div>
							<div class="span7">
								zasdasd
							</div>
						</div>
					</div>
			</div>
		<%}%>
			<h3>趁热赶快看了吧...</h3>
		</div>
		
			
			
			
	</div>
	
	


	<!-- footer -->
	
	<!-- js here for loading fast -->
	<script src="/js/toastr.min.js"></script>
	<script src="/js/bootstrap.js"></script>
</body>
</html>