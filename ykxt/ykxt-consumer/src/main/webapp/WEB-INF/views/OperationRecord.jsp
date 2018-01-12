<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/10 0010
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出入库记录查看</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/miniui.css" type="text/css"/>

    <script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/miniui.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/echarts.min.js" type="text/javascript"></script>
</head>
<body>
    <div style="width: 100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="showEcharts()">库存统计</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="operationRecordDatagrid" class="mini-datagrid" style="width:100%;height:310px;"
         url="/OperationRecord/FindOperationRecordByPage" idField="id"
    >
        <div property="columns">
            <div field="id" width="120" headerAlign="center" allowSort="true" align="center">ID</div>
            <div field="employeeId" width="120" headerAlign="center" allowSort="true" align="center">操作人编号</div>
            <div field="employee.name" width="120" headerAlign="center" allowSort="true" align="center">操作人姓名</div>
            <div field="operation" width="120" headerAlign="center" allowSort="true" align="center">操作</div>
            <div field="time" width="120" headerAlign="center" allowSort="true" align="center">操作时间</div>
        </div>
    </div>

    <div id="echartsWindow" class="mini-window" title="库存统计" style="width:600px;"
         showModal="true" allowResize="true" allowDrag="true"
    >
        <div id="echarts" style="width: 500px;height: 400px"></div>
    </div>
    <script type="text/javascript">
        mini.parse();//把html的标签转换成miniui的控件对象
        var grid = mini.get("operationRecordDatagrid");
        grid.load();
        var echartsWindow=mini.get("echartsWindow");
        function showEcharts() {
            $.ajax({
                url:"/Inventory/FindEchartsData",
                dataType:"json",
                type:"post",
                success:function (data) {
                    var myChart = echarts.init(document.getElementById("echarts"));
                    var option = {
                        title: {
                            text: '药品库存统计'
                        },
                        tooltip: {},
                        legend: {
                            data:['库存量']
                        },
                        xAxis: {
                            data: data.nameList
                        },
                        yAxis: {},
                        series: [{
                            name: '库存量',
                            type: 'bar',
                            data: data.numberList
                        }]
                    };
                    myChart.setOption(option);
                    echartsWindow.show();
                },
                error:function () {
                    alert("error!")
                }
            });
        }
    </script>
</body>
</html>
