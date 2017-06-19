<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <form class="form-inline" role="form" method="post">

            <div class="form-group">
                <label class="control-label" for="username">请输入您的用户名：</label>
                <input type="text" class="form-control" name="username" id="username">
                <span class="text-danger"></span>
            </div>
            <br>
            <div class="form-group">
                <label class="control-label" for="password">请输入您的密码：</label>
                <input type="password" class="form-control" name="password" id="password">
            </div>

        </form>




        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
		$("#username").change(function(){
			var xdr = new XDomainRequest();
			xdr.onload = function(){
				alert(xdr.responseText);
			}
			xdr.open("get","AjaxServlet?username=1");
			xdr.send(null);
		});
			
            
        </script>
    </body>
</html>