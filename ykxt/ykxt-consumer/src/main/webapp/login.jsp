<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <title>用户登录</title>
    <link href="static/css/miniui.css" rel="stylesheet" type="text/css"/>

    <script src="static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="static/js/miniui.js" type="text/javascript"></script>

    <style type="text/css">
        body
        {
            width:100%;height:100%;margin:0;overflow:hidden;
        }
    </style>

</head>
<body>
    <h2>用户登录</h2>
    <%--<form id="dl_form">--%>
        <%--<input type="text" name="account"/>--%>
        <%--<input type="password" name="password"/>--%>
        <%--<button type="button" id="dl">登陆</button>--%>
    <%--</form>--%>
    <div id="loginWindow" class="mini-window" title="用户登录" style="width:350px;height:165px;"
         showModal="true" showCloseButton="false"
    >
        <div id="loginForm" style="padding:15px;padding-top:10px;">
            <form id="dl_form">
                <table >
                    <tr>
                        <td style="width:60px;"><label >帐号：</label></td>
                        <td>
                            <input id="username" name="account" onvalidation="onUserNameValidation" class="mini-textbox" required="true" style="width:150px;"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:60px;"><label >密码：</label></td>
                        <td>
                            <input id="pwd" name="password" onvalidation="onPwdValidation" class="mini-password" requiredErrorText="密码不能为空" required="true" style="width:150px;" onenter="onLoginClick"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-top:5px;">
                            <a  id= "dl" class="mini-button" style="width:60px;">登录</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        mini.parse();//把html的标签转换成miniui的控件对象

        var loginWindow = mini.get("loginWindow");
        loginWindow.show();

        $("#dl").click(function () {
            $.ajax({
                url:"/Employee/Login",
                type:"POST",
                data:$("#dl_form").serialize(),
                success:function (result) {
                    alert(result);
                    if(result=="登录成功！"){
                        window.location.href="index.jsp";
                    }

                    // if(data.result=="登录成功！"){
                    //     alert(data.character);
                    //     window.location.href="index.jsp?data";
                    // }else if(data.result=="该账号已被禁用！"||data.result=="账号或密码不正确！"){
                    //     alert(data.result);
                    // }else(
                    //     alert("返回数据有误!")
                    // )
                },
                error:function () {
                    alert("error!@!!!!!!");
                }
            });
        });
    </script>
</body>
</html>
