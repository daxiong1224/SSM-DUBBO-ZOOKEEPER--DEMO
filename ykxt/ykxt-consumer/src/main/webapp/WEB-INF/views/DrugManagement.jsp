<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/8 0008
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>药品目录管理</title>
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
                        <a class="mini-button" iconCls="icon-add" onclick="addDrug()">增加</a>
                        <a class="mini-button" iconCls="icon-add" onclick="editDrug()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="deleteDrug()">删除</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="drugDatagrid" class="mini-datagrid" style="width:100%;height:310px;"
         url="/Drug/FindDrugByPage" idField="id"
    >
        <div property="columns">
            <div field="id" width="120" headerAlign="center" allowSort="true" align="center">ID</div>
            <div field="drug_number" width="120" headerAlign="center" allowSort="true" align="center">药品编号</div>
            <div field="name" width="120" headerAlign="center" allowSort="true" align="center">药品名称</div>
            <div field="common_name" width="120" headerAlign="center" allowSort="true" align="center">通用名</div>
            <div field="category" width="120" headerAlign="center" allowSort="true" align="center">药品分类</div>
            <div field="specification" width="120" headerAlign="center" allowSort="true" align="center">药品规格</div>
            <div field="origin" width="120" headerAlign="center" allowSort="true" align="center">产地</div>
            <div field="status" width="120" headerAlign="center" allowSort="true" align="center">状态</div>
        </div>
    </div>

    <div id="addWindow" class="mini-window" title="添加药品" style="width:460px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <form method="post" id="addForm">
            <table>
                <tr>
                    <td>药品编号：</td>
                    <td><input name="drug_number" class="mini-textbox" required="true"  emptyText="请输入编号"/></td>
                    <td>药品名称：</td>
                    <td><input name="name" class="mini-textbox" required="true"  emptyText="请输入名称"/></td>
                </tr>
                <tr>
                    <td>通用名：</td>
                    <td><input name="common_name" class="mini-textbox" required="true"  emptyText="请输入通用名"/></td>
                    <td>药品分类：</td>
                    <td><input name="category" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/DrugCategoryMenu.txt"
                               emptyText="请选择分类" valueField="value"/></td>
                </tr>
                <tr>
                    <td>药品规格：</td>
                    <td><input name="specification" class="mini-textbox" required="true"  emptyText="请输入规格"/></td>
                    <td>产地：</td>
                    <td><input name="origin" class="mini-textbox" required="true"  emptyText="请输入产地"/></td>
                </tr>
                <tr>
                    <td>状态：</td>
                    <td><input name="status" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/StatusMenu.txt"
                               emptyText="请选择状态" valueField="value"/></td>
                    <td><button type="button" onclick="saveAdd()">保存</button></td>
                    <td><button onclick="cancelAdd()">取消</button></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWindow" class="mini-window" title="编辑药品" style="width:460px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <form method="post" id="editForm">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input id="editId" name="id" class="mini-textbox" required="true" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>药品编号：</td>
                    <td><input id="editDrugNumber" name="drug_number" class="mini-textbox" required="true"  emptyText="请输入编号"/></td>
                    <td>药品名称：</td>
                    <td><input id="editName" name="name" class="mini-textbox" required="true"  emptyText="请输入名称"/></td>
                </tr>
                <tr>
                    <td>通用名：</td>
                    <td><input id="editCommonName" name="common_name" class="mini-textbox" required="true"  emptyText="请输入通用名"/></td>
                    <td>药品分类：</td>
                    <td><input id="editCategory" name="category" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/DrugCategoryMenu.txt"
                               emptyText="请选择分类" valueField="value"/></td>
                </tr>
                <tr>
                    <td>药品规格：</td>
                    <td><input id="editSpecification" name="specification" class="mini-textbox" required="true"  emptyText="请输入规格"/></td>
                    <td>产地：</td>
                    <td><input id="editOrigin" name="origin" class="mini-textbox" required="true"  emptyText="请输入产地"/></td>
                </tr>
                <tr>
                    <td>状态：</td>
                    <td><input id="editStatus" name="status" class="mini-combobox" required="true"
                               url="<%=request.getContextPath()%>/static/data/StatusMenu.txt"
                               emptyText="请选择状态" valueField="value"/></td>
                    <td><button type="button" onclick="saveEdit()">保存编辑</button></td>
                    <td><button onclick="cancelEdit()">取消编辑</button></td>
                </tr>
            </table>
        </form>
    </div>

    <script type="text/javascript">
        mini.parse();//把html的标签转换成miniui的控件对象
        var grid = mini.get("drugDatagrid");
        grid.load();
        var addWindow=mini.get("addWindow");
        var editWindow=mini.get("editWindow");

        function addDrug() {
            addWindow.show();
        }

        function saveAdd() {
            $.ajax({
                url:"/Drug/AddDrug",
                dataType:"json",
                type:"post",
                data:$("#addForm").serialize(),
                success:function (data) {
                    alert(data.result);
                    addWindow.hide();
                },
                error:function () {
                    alert("error！");
                }
            });
        }

        function cancelAdd() {
            addWindow.hide();
        }

        function editDrug() {
            var row=grid.getSelected();
            if(row==null){
                alert("请先选择行！");
            }else {
                mini.get("editId").setValue(row.id);
                mini.get("editDrugNumber").setValue(row.drug_number);
                mini.get("editName").setValue(row.name);
                mini.get("editCommonName").setValue(row.common_name);
                mini.get("editCategory").setValue(row.category);
                mini.get("editSpecification").setValue(row.specification);
                mini.get("editOrigin").setValue(row.origin);
                mini.get("editStatus").setValue(row.status);
                editWindow.show();
            }
        }

        function saveEdit() {
            $.ajax({
               url:"/Drug/UpdateDrug",
               dataType:"json",
               type:"post",
               data:$("#editForm").serialize(),
               success:function (data) {
                    alert(data.result);
                    editWindow.hide();
               },
               error:function () {
                   alert("error！");
               }
            });
        }
        
        function deleteDrug() {
            var row=grid.getSelected();
            if(row==null){
                alert("请先选中行！");
            }else{
                $.ajax({
                   url:"/Drug/DeleteDrug",
                   dataType:"json",
                   type:"post",
                   data:{
                       "id":row.id
                   },
                   success:function (data) {
                       alert(data.result);
                   },
                   error:function () {
                       alert("error!");
                   }
                });
            }
        }
    </script>
</body>
</html>
