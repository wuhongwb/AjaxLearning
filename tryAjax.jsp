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

            function createXHR(){
                if(typeof XMLHttpRequest != "undefined"){
                    return new XMLHttpRequest();
                }
                else if(typeof ActiveXObject != "undefined"){
                    var versions = ["MSXML2.XMLHttp.6.0" , "MSXML2.XMLHttp.3.0" , "MSXML2.XMLHttp"];
                    var i , len;
                    for(i=0, len=versions.length; i<len; i++){
                        try{
                            new ActiveXObject(versions[i]);
                            arguments.callee.activeXString = versions[i];
                            break;
                        }catch(ex){}
                    }
                    return new ActiveXObject(arguments.callee.activeXString);
                }
                else{
                    throw new Error("No XHR object available.");
                }
            }

            
            $("#username").change(function(){
                var xhr = createXHR();
                
                xhr.onreadystatechange = function(){
                    if(xhr.readyState ==4){
                        if( (xhr.status >=200 && xhr.status <=300) || xhr.status == 304){
                        	alert(xhr.responseText);
                        	var json = JSON.parse(xhr.responseText);
                        	if(json.success){
                            	$(".form-group span").html(json.msg);
                            	}else{
                            		$(".form-group span").html(json.success+json.msg);
                            	}
                        } else{
                            alert("Request was unsuccessful: " + xhr.status);
                        }
                    }
                }

                var username = $(this).val();
                xhr.open("post","http://127.0.0.1:8080/try/AjaxServlet",true);
                //xhr.setRequestHeader("Content-Type" , "application/x-www-form-urlencoded");
                //var data = new FormData;
                //data.append("username","1");
                xhr.send($("#username").serialize());
            });
            
        </script>
    </body>
</html>