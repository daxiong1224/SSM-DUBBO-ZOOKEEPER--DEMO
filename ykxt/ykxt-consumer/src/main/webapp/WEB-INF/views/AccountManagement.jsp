<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>账号管理</title>

    <link href="<%=request.getContextPath()%>/static/css/miniui.css" rel="stylesheet" type="text/css"/>

    <script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/miniui.js" type="text/javascript"></script>

</head>
<body>
    <div style="width: 100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="addEmp()">增加</a>
                        <a class="mini-button" iconCls="icon-add" onclick="editEmp()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="deleteEmp()">删除</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>


    <div id="datagrid" class="mini-datagrid" style="width:100%;height:310px;"
         url="/Employee//FindEmployeeByPage" idField="id"
    >
        <div property="columns">
            <div field="id" width="120" headerAlign="center" allowSort="true" align="center">ID</div>
            <div field="account" width="120" headerAlign="center" allowSort="true" align="center">员工账号</div>
            <div field="name" width="120" headerAlign="center" allowSort="true" align="center">姓名</div>
            <div field="character" width="120" headerAlign="center" allowSort="true" align="center">角色</div>
            <div field="status" width="120" headerAlign="center" allowSort="true" align="center">状态</div>
        </div>
    </div>

    <div id="addWindow" class="mini-window" title="添加员工" style="width:460px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <form method="post" id="addForm">
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
                    <td><input name="character" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/EmpCharacterMenu.txt"
                                emptyText="请选择角色" valueField="value"/></td>
                </tr>
                <tr>
                    <td>账号状态：</td>
                    <td><input name="status" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/StatusMenu.txt"
                               emptyText="请选择状态" valueField="value"/></td>
                </tr>
                <tr>
                    <td><button type="button" onclick="saveAdd()">保存</button></td>
                    <td><button onclick="cancelAdd()">取消</button></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWindow" class="mini-window" title="编辑员工" style="width:460px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <form method="post" id="editForm">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input id="editId" name="id" class="mini-textbox" readonly="readonly"/></td>
                    <td>员工账号：</td>
                    <td><input id="editAccount" name="account" class="mini-textbox" required="true"  emptyText="请输入帐号"/></td>
                </tr>
                <tr>
                    <td>员工姓名：</td>
                    <td><input id="editName" name="name" class="mini-textbox" required="true"  emptyText="请输入姓名"/></td>
                    <td>员工角色：</td>
                    <td><input id="editCharacter" name="character" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/EmpCharacterMenu.txt"
                               emptyText="请选择角色" valueField="value"/></td>
                </tr>
                <tr>
                    <td>账号状态：</td>
                    <td><input id="editStatus" name="status" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/StatusMenu.txt"
                               emptyText="请选择状态" valueField="value"/></td>
                </tr>
                <tr>
                    <td><button type="button" onclick="saveEdit()">保存编辑</button></td>
                    <td><button onclick="cancelEdit()">取消编辑</button></td>
                </tr>
            </table>
        </form>
    </div>


    <script type="text/javascript">
        mini.parse();//把html的标签转换成miniui的控件对象
        var grid = mini.get("datagrid");
        grid.load();
        var addWindow = mini.get("addWindow");
        var editWindow= mini.get("editWindow");
        function addEmp() {
            addWindow.show();
        };

        function saveAdd() {
            $.ajax({
                url:"/Employee/AddEmployee",
                type:"post",
                data:$("#addForm").serialize(),
                dataType:"json",
                success:function (data) {
                   alert(data.result);
                   addWindow.hide ();
                },
                error:function (XMLHttpRequest, textStatus) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                    alert("error!!!!!!!");
                }
            });
        };

        function cancelAdd() {
            addWindow.hide ();
        };

        function  deleteEmp() {
            var row=grid.getSelected();
            if(row==null){
                alert("请先选中行！");
            }else{
                $.ajax({
                    url:"/Employee/DeleteEmployee",
                    type:"post",
                    dataType:"json",
                    data:{
                      "id":row.id
                    },
                    success:function (data) {
                        alert(data.result);
                    },
                    error:function () {
                        alert("error!")
                    }
                });
            }
        }

        function editEmp(){
            var row=grid.getSelected();
            if(row==null){
                alert("请先选中行！")
            }else{
                mini.get("editId").setValue(row.id);
                mini.get("editAccount").setValue(row.account);
                mini.get("editName").setValue(row.name);
                mini.get("editCharacter").setValue(row.character);
                mini.get("editStatus").setValue(row.status);
                editWindow.show();
            }
        }

        function saveEdit() {
            $.ajax({
                url:"/Employee/UpdateEmployee",
                type:"post",
                data:$("#editForm").serialize(),
                dataType:"json",
                success:function (data) {
                    alert(data.result);
                    editWindow.hide ();
                },
                error:function () {
                    alert("error!!!!!!!");
                }
            });
        }

        function cancelEdit() {
            editWindow.hide();
        }
    </script>
</body>
</html>
