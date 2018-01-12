<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/9 0009
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>库存信息</title>
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
                        <a class="mini-button" iconCls="icon-add" onclick="reduce()">出库</a>
                        <a class="mini-button" iconCls="icon-add" onclick="add()">入库</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="inventoryDatagrid" class="mini-datagrid" style="width:100%;height:310px;"
         url="/Inventory/FindInventoryByPage" idField="id"
    >
        <div property="columns">
            <div field="id" width="120" headerAlign="center" allowSort="true" align="center">ID</div>
            <div field="drugId" width="120" headerAlign="center" allowSort="true" align="center">药品ID</div>
            <div field="drug.name" width="120" headerAlign="center" allowSort="true" align="center">药品名称</div>
            <div field="inventoryNumber" width="120" headerAlign="center" allowSort="true" align="center">库存数量</div>
            <div field="drug.status" width="120" headerAlign="center" allowSort="true" align="center">状态</div>
        </div>
    </div>

    <div id="reduceWindow" class="mini-window" title="出库" style="width:600px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <table>
            <tr>
                <td>ID:</td>
                <td><input id="reduceId" class="mini-textbox" required="true" readonly="readonly"/></td>
                <td>药品ID:</td>
                <td><input id="reduceDrugId" class="mini-textbox" required="true" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>药品名称：</td>
                <td><input id="reduceDrugName" class="mini-textbox" required="true" readonly="readonly" /></td>
                <td>库存数量：</td>
                <td><input id="reduceInventoryNumber" class="mini-textbox" required="true" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>出库数量：</td>
                <td><input id="reduceNumber" class="mini-textbox" required="true" emptyText="请输入出库数量"/></td>
                <td><button type="button" onclick="saveReduce()">确定</button></td>
                <td><button onclick="cancelReduce()">取消</button></td>
            </tr>
        </table>
    </div>

    <div id="addWindow" class="mini-window" title="入库" style="width:600px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <table>
            <tr>
                <td>ID:</td>
                <td><input id="addId" class="mini-textbox" required="true" readonly="readonly"/></td>
                <td>药品ID:</td>
                <td><input id="addDrugId" class="mini-textbox" required="true" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>药品名称：</td>
                <td><input id="addDrugName" class="mini-textbox" required="true" readonly="readonly" /></td>
                <td>库存数量：</td>
                <td><input id="addInventoryNumber" class="mini-textbox" required="true" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>入库数量：</td>
                <td><input id="addNumber" class="mini-textbox" required="true" emptyText="请输入出库数量"/></td>
                <td><button type="button" onclick="saveAdd()">确定</button></td>
                <td><button onclick="cancelAdd()">取消</button></td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        mini.parse();//把html的标签转换成miniui的控件对象
        var grid = mini.get("inventoryDatagrid");
        grid.load();
        var reduceWindow=mini.get("reduceWindow");
        var addWindow=mini.get("addWindow");
        function reduce() {
            var row=grid.getSelected();
            if(row==null){
                alert("请先选中行！");
            }else if(row.drug.status=="停用"){
                alert("该药品以被停用，不能进行出入库操作！");
            }else if(row.inventoryNumber<=0){
                alert("该药品库存数量不足！不能进行出库操作！");
            }else{
                mini.get("reduceId").setValue(row.id);
                mini.get("reduceDrugId").setValue(row.drugId);
                mini.get("reduceDrugName").setValue(row.drug.name);
                mini.get("reduceInventoryNumber").setValue(row.inventoryNumber);
                reduceWindow.show();
            }
        }

        function saveReduce() {
            var inventoryNumber=parseInt(mini.get("reduceInventoryNumber").getValue());
            if(mini.get("reduceNumber").getValue()==""){
                alert("请先输入出库数量！");
            }else {
                var reduceNumber = parseInt(mini.get("reduceNumber").getValue());
                if (inventoryNumber < reduceNumber) {
                    alert("出库数量大于库存数量，不能出库！");
                } else {
                    var newInventoryNumber = inventoryNumber - reduceNumber;//新的库存数量
                    $.ajax({
                        url: "/Inventory/UpdateInventoryNumber",
                        type: "post",
                        dataType: "json",
                        data: {
                            "id": mini.get("reduceId").getValue(),
                            "newInventoryNumber": newInventoryNumber,
                            "operation":"出库"
                        },
                        success: function (data) {
                            alert(data.result);
                            reduceWindow.hide();
                        },
                        error: function () {
                            alert("error!");
                        }
                    });
                }
            }
        }

        function cancelReduce() {
            reduceWindow.hide();
        }
        
        function add() {
            var row=grid.getSelected();
            if(row==null){
                alert("请先选中行！");
            }else if(row.drug.status=="停用") {
                alert("该药品以被停用，不能进行出入库操作！");
            }else{
                mini.get("addId").setValue(row.id);
                mini.get("addDrugId").setValue(row.drugId);
                mini.get("addDrugName").setValue(row.drug.name);
                mini.get("addInventoryNumber").setValue(row.inventoryNumber);
                addWindow.show();
            }
        }
        
        function saveAdd() {
            var inventoryNumber=parseInt(mini.get("addInventoryNumber").getValue());
            if(mini.get("addNumber").getValue()==""){
                alert("请先输入入库数量！");
            }else {
                var addNumber = parseInt(mini.get("addNumber").getValue());
                var newInventoryNumber = inventoryNumber + addNumber;//新的库存数量
                $.ajax({
                    url: "/Inventory/UpdateInventoryNumber",
                    type: "post",
                    dataType: "json",
                    data: {
                        "id": mini.get("addId").getValue(),
                        "newInventoryNumber": newInventoryNumber,
                        "operation":"入库"
                    },
                    success: function (data) {
                        alert(data.result);
                        addWindow.hide();
                    },
                    error: function () {
                        alert("error!");
                    }
                });
            }
        }

        function cancelAdd() {
            addWindow.hide();
        }
    </script>
</body>
</html>
