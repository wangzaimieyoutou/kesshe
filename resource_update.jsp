<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改资源信息</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body style="background-image: url('img/update.jpg');">
<%request.setCharacterEncoding("UTF-8");%>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改资源信息</h3>
    <form action="${pageContext.request.contextPath}/resource?method=updateResource" method="post">
        <!--隐藏域 提交id-->
        <input type="hidden" name="id" value="${resource.id}">

        <div class="form-group">
            <label for="theme">资源主题：</label>
            <input type="text" class="form-control" id="theme" name="theme"  value="${resource.theme}" placeholder="请输入资源主题" />
        </div>

        <div class="form-group">
            <label for="sender">发送人：</label>
            <input type="text" class="form-control" value="${resource.sender}" id="sender"  name="sender" placeholder="请输入发送人姓名" />
        </div>

        <div class="form-group">
            <label for="fPath">资源地址：</label>
            <input type="text" id="fPath" class="form-control" value="${resource.fPath}" name="fPath" placeholder="请输入资源地址"/>
        </div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
        </div>

    </form>
</div>
</body>
</html>