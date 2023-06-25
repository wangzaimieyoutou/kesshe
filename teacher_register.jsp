<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	  //单词字符，长度3到20位
		function checkUsername() {
	        //1.获取用户名值
			var username = $("#username").val();
			//2.定义正则
			var reg_username = /^\w{3,20}$/;
			
			//3.判断，给出提示信息
		    var flag = reg_username.test(username);
		    if(flag){
		        //用户名合法
	            $("#username").css("border","");
			}else{
		        //用户名非法,加一个红色边框
				$("#username").css("border","1px solid red");
			}
		    
	        return flag;
	    }
	
	    //校验密码
	    function checkPassword() {
	        //1.获取密码值
	        var password = $("#password").val();
	        //2.定义正则
	        var reg_password = /^\w{6,20}$/;
	
	        //3.判断，给出提示信息
	        var flag = reg_password.test(password);
	        if(flag){
	            //密码合法
	            $("#password").css("border","");
	        }else{
	            //密码非法,加一个红色边框
	            $("#password").css("border","1px solid red");
	        }
	
	        return flag;
	    }
	
	    //校验电话
		function checkPhone(){
		    //1.获取电话
			var phone = $("#phone").val();
			//2.定义正则
			var reg_phone =/^1\d{10}$/;
			//3.判断
			var flag = reg_phone.test(phone);
			if(flag){
	            $("#phone").css("border","");
			}else{
	            $("#phone").css("border","1px solid red");
	     	}
	
			return flag;
		}
	    
		
	    
	    $(function () {
	    
			//当某一个组件失去焦点是，调用对应的校验方法
	    	$("#username").blur(checkUsername);
		    $("#password").blur(checkPassword);
		    $("#phone").blur(checkPhone);

	    	//给登录按钮绑定单击事件
			$("#btn_sub").click(function () {
				if(checkUsername() && checkPassword() && checkPhone()){
					return true; 
				}
				return false;
			});

	    });
	    
    </script>
    
</head>
<body style="background: url('img/register.jpg') no-repeat 100%/cover;">
 
    <div class="container-fluid">
  		<div class="row" style="margin-top: 50px;">
			<div class="col-sm-6 col-sm-offset-3">
				<h1 class="text-center">
					用户注册<small>学生综合管理平台</small>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
		        
		        <form action="${pageContext.request.contextPath}/teacher?method=registTeacher" method="post">
			      
			      <div class="form-group">
					  <label for="username">用户名：</label>
					  <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
				  </div>
				  <div class="form-group">
					  <label for="password">密码：</label>
					  <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
				  </div>
			      <div class="form-group">
			          <label for="phone">电话：</label>
			          <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号码"/>
			      </div>
			      
			      <button type="submit" id="btn_sub" class="btn btn-default" style="float: left; width: 40%;">注册</button>
				  <button type="reset" class="btn btn-default" style="float: right; width: 40%;">清空</button><br><br>
				  <div class="form-group" style="float: left;">
				      <a href="teacher_login.jsp">直接登录</a>
			      </div>
				
			  	</form>
				
			</div>
			
		</div>

  	</div>
  	
</body>
</html>