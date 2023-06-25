<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生综合管理平台</title>

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
    <script>
        function deleteResource(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/resource?method=delResource&id="+id;
            }
        }

        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelectedResource").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){

                    var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("id");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }

                    if(flag){//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }

            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("id");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;

                }

            }

        }

    </script>
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
        <a href="#" class="navbar-brand">资源分享管理</a>
    </div>
    <ul class="nav navbar-nav navbar-right" style="margin-right: 25px">
        <li><a href="${pageContext.request.contextPath}/teacher?method=findTeacher&id=${teacher.id}"><span class="badge" style="background: #C12E2A">${teacher.username}</span></a></li>
        <li><a href="${pageContext.request.contextPath}/teacher?method=destroyTeacher"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
    </ul>

    <!-- 侧边栏  -->
    <div class="navbar-default navbar-collapse" id="slider_sub">
        <ul class="nav">
            <li>

                <form class="form-inline" action="${pageContext.request.contextPath}/resource?method=findAll" method="post">

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
            <li><a href="${pageContext.request.contextPath}/index.jsp" class="collapse" data-toggle="collapse">首页<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
            <li><a href="${pageContext.request.contextPath}/student?method=findAll"  class="collapse" data-toggle="collapse">学生管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
            <li><a href="${pageContext.request.contextPath}/classno?method=findAll"  class="collapse" data-toggle="collapse">班级管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
            <li><a href="${pageContext.request.contextPath}/course?method=findAll"  class="collapse" data-toggle="collapse">课程管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
            <li><a href="${pageContext.request.contextPath}/resource?method=findAll"  class="collapse" data-toggle="collapse">分享资源<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>

            </li>
        </ul>
    </div>
</nav>

<!-- 主区域 -->
<div class="page_main" style="background: rgba(92,88,116,0.34)">
    <ol class="breadcrumb">
        <li><a href="#">管理首页</a></li>
        <li><a href="#">资源管理</a></li>
        <li><a href="#">资源信息</a></li>
    </ol>

    <div class="row">
        <div class="col-md-12 col-sm-3">
            <div class="panel panel-default">

                <div class="panel-body table-responsive">


                    <div style="float: right;margin: 5px;">

                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/resource_add.jsp">添加资源</a>
                        <a class="btn btn-primary" href="javascript:void(0);" id="delSelectedResource">删除选中</a>

                    </div>

                    <form id="form" action="${pageContext.request.contextPath}/resource?method=delSelectedResource" method="post">
                        <table class="table table-striped table-hover" style="margin: 10px;">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="firstCb"></th>
                                <th>编号</th>
                                <th>资源主题</th>
                                <th>发送人</th>
                                <th>资源地址</th>

                            </tr>
                            </thead>

                            <c:forEach items="${pb.list}" var="resource" varStatus="s">
                                <tr>
                                    <td><input type="checkbox" name="id" value="${resource.id}"></td>
                                    <td>${resource.id}</td>
                                    <td>${resource.theme}</td>
                                    <td>${resource.sender}</td>
                                    <td>${resource.fPath}></td>
                                    <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/resource?method=findResource&id=${resource.id}">修改</a>&nbsp;
                                        <a class="btn btn-default btn-sm" href="javascript:deleteResource(${resource.id});">删除</a></td>
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
                                <a href="${pageContext.request.contextPath}/resource?method=findAll&currentPage=${pb.currentPage - 1}&rows=5" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${pb.totalPage}" var="i" >

                                <c:if test="${pb.currentPage == i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/resource?method=findAll&currentPage=${i}&rows=5">${i}</a></li>
                                </c:if>
                                <c:if test="${pb.currentPage != i}">
                                    <li><a href="${pageContext.request.contextPath}/resource?method=findAll&currentPage=${i}&rows=5">${i}</a></li>
                                </c:if>

                            </c:forEach>
                            <%--下一页--%>
                            <li>
                                <a href="${pageContext.request.contextPath}/resource?method=findAll&currentPage=${pb.currentPage + 1}&rows=5" aria-label="Next">
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