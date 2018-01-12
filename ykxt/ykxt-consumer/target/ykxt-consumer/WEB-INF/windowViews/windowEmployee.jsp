<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/5 0005
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工面板</title>
    <link href="<%=request.getContextPath()%>/static/css/miniui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/miniui.js" type="text/javascript"></script>
</head>
<body>
    <form method="post" id="employeeForm">
        <table>
            <tr>
                <td>员工账号：</td>
                <td><input name="account" class="mini-textbox" required="true"  emptyText="请输入帐号"/></td>
                <td>员工密码：</td>
                <td><input name="password" class="mini-password" required="true"  emptyText="请输入密码"/></td>
            </tr>
            <tr>
                <td>员工姓名：</td>
                <td><input name="name" class="mini-textbox" required="true"  emptyText="请输入姓名"/></td>
                <td>员工角色：</td>
                <td><input name="character" class="mini-combobox" required="true"  emptyText="请选择角色"/></td>
            </tr>
            <tr>
                <td>账号状态：</td>
                <td><input name="status" class="mini-combobox" required="true"  emptyText="请选择状态"/></td>
            </tr>
            <tr>
                <td><button>确认</button></td>
                <td><button>取消</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
