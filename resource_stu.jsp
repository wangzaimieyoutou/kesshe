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
<body>
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

                <form class="form-inline" action="${pageContext.request.contextPath}/resourceStu?method=findAll" method="post">

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
            <li><a href="${pageContext.request.contextPath}/resourceStu?method=findAll"  class="collapse" data-toggle="collapse">分享资源<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
        </ul>
    </div>
</nav>

<!-- 主区域 -->
<div class="page_main" style="background: rgba(92,88,116,0.34)">
    <ol class="breadcrumb">
        <li><a href="#">资源查询</a></li>
    </ol>

    <div class="row">
        <div class="col-md-12 col-sm-3">
            <div class="panel panel-default">

                <div class="panel-body table-responsive">

                    <form id="form" method="post">
                        <table class="table table-striped table-hover" style="margin: 10px;">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>资源主题</th>
                                <th>发送人</th>
                                <th>资源地址</th>
                            </tr>
                            </thead>

                            <c:forEach items="${pb.list}" var="resource" varStatus="s">
                                <tr>
                                    <td>${resource.id}</td>
                                    <td>${resource.theme}</td>
                                    <td>${resource.sender}</td>
                                    <td><a href="${resource.fPath}">${resource.fPath}</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </form>

                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination" style="margin-top: 10px;">

                            <c:if test="${pb.currentPage == 1}">
                            <li class="disabled">
                                </c:if>

                                <c:if test="${pb.currentPage != 1}">
                            <li>
                                </c:if>
                                <%--当前页--%>
                                <a href="${pageContext.request.contextPath}/resourceStu?method=findAll&currentPage=${pb.currentPage - 1}&rows=5" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${pb.totalPage}" var="i" >

                                <c:if test="${pb.currentPage == i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/resourceStu?method=findAll&currentPage=${i}&rows=5">${i}</a></li>
                                </c:if>
                                <c:if test="${pb.currentPage != i}">
                                    <li><a href="${pageContext.request.contextPath}/resourceStu?method=findAll&currentPage=${i}&rows=5">${i}</a></li>
                                </c:if>

                            </c:forEach>
                            <%--下一页--%>
                            <li>
                                <a href="${pageContext.request.contextPath}/resourceStu?method=findAll&currentPage=${pb.currentPage + 1}&rows=5" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <span style="font-size: 25px;margin-left: 5px;">
				                    	共${pb.totalCount}条记录，共${pb.totalPage}页
				                </span>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>