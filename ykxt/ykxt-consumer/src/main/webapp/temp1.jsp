<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/4 0004
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/static/css/miniui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/miniui.js" type="text/javascript"></script>
</head>
<body>
    asdadadasdasdadasd
    <input>
    <a>asasxxczxczxc</a>
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
        // mini.parse();
       //  var loginWindow = mini.get("loginWindow");
       // // loginWindow.show();
    </script>
</body>
</html>
