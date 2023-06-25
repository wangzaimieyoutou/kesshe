<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生资源查询平台</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- jQuery  -->
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。 -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        @media (min-width: 768px) {
            #slider_sub{
                width: 200px;
                margin-top: 51px;
                position: absolute;
                z-index: 1;
                height: 600px;
            }
            .mysearch{
                margin: 10px 0;
            }
            .page_main{
                margin-left: 205px;
            }
        }
    </style>

</head>
<body style="background: rgba(84,190,255,0.34)">
<%request.setCharacterEncoding("UTF-8");%>
<nav class="navbar navbar-default navbar-static-top">
    <div class="navbar-header">
        <!--缩放 -->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#slider_sub">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand">资源查询</a>
    </div>

    <!-- 侧边栏  -->
    <div class="navbar-default navbar-collapse" id="slider_sub">
        <ul class="nav">
            <li>

                <form class="form-inline" action="${pageContext.request.contextPath}/student?method=findAll" method="post">

                    <!--搜索 -->
                    <div class="input-group mysearch">
                        <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2" >
                        <span class="input-group-btn">
	                            <button type="submit" class="btn btn-default">
	                                <span class="glyphicon glyphicon-search"></span>
	                            </button>
	                        </span>

                    </div>
                </form>


            </li>

            <li><a href="${pageContext.request.contextPath}/student_index.jsp" class="collapse" data-toggle="collapse">首页<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
            <li><a href="${pageContext.request.contextPath}/resourceStu?method=findAll"  class="collapse" data-toggle="collapse">资源分享<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
        </ul>
    </div>
</nav>

<!-- 主区域 -->
<div class="page_main" style="background-size:100% 100%;">
    <div class="row" style="margin-top: 50px;">
        <div class="col-sm-6 col-sm-offset-3">
            <h1 class="text-center">
                <small>欢迎你，同学</small>
                <h2>查询GPA</h2>
                <form action="${pageContext.request.contextPath}/resourceStu?method=findGPA" method="post">
                    <div class="form-group">
                        <label for="name">姓名：</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名：">
                    </div>

                    <div class="form-group">
                        <label for="phone">电话号：</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话号">
                    </div>

                    <div class="form-group" style="text-align: center">
                        <input class="btn btn-primary" type="submit" value="提交" style="float: left"/>
                        <input class="btn btn-default" type="reset" value="重置" style="float: right"/>
                    </div>
                </form>
            </h1>
        </div>
    </div>
</div>
</body>
</html>