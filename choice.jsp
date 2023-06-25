<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>身份选择</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background: url('img/m_login.jpg') no-repeat 100%/cover;">
<div class="container-fluid">
    <div class="row" style="margin-top: 50px;">
        <div class="col-sm-6 col-sm-offset-3">
            <h1 class="text-center">
                身份选择<small>学生综合管理平台</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3" style="margin-top: 200px">
            <div class="form-group" style="float: left;">
                <a class="btn btn-default btn-sm" href="teacher_login.jsp" style="color: #0f0f0f"><h1>我是老师</h1></a>
            </div>
            <div class="form-group" style="float: right;">
                <a class="btn btn-default btn-sm" href="student_index.jsp" style="color: #0f0f0f"><h1>我是学生</h1></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

