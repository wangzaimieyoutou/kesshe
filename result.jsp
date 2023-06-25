<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>GPA查询结果</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('img/update.jpg');">
<div class="container-fluid">
    <div class="row" style="margin-top: 50px;">
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3" style="margin-top: 200px">
            <h1 class="text-center"><%
                float gpa = (float)request.getAttribute("gpa");
                if (gpa == 0) {
                } else if(gpa >= 3.8) {
                    out.print(request.getParameter("name") + "同学，你的GPA为 " + gpa + ", 请继续保持!!");
                } else {
                    out.print(request.getParameter("name") + "同学，你的GPA为 " + gpa + ", 请继续努力!!");
                }
            %></h1>
        </div>
    </div>
</div>
</body>
</html>
