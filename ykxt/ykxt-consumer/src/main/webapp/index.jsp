<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <title>简易药库管理</title>

    <link href="<%=request.getContextPath()%>/static/css/miniui.css" rel="stylesheet" type="text/css"/>

    <script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/static/js/miniui.js" type="text/javascript"></script>

    <style type="text/css">
        body{
            margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
        }
        .header
        {
            background:url(static/css/images/header.gif) repeat-x 0 -1px;
        }
    </style>

    <script type="text/javascript">

        $(function () {
            // $.ajax({
            //     url:"/Employee/UserCharacter",
            //     type:"POST",
            //     success:function (data) {
            //         $("#leftTree").attr("url","static/data/"+data);
            //        // location.reload(true);
            //     },
            //     error:function () {
            //         alert("出错啦！")
            //     }
            // });

            //判断角色
            //验证当前用户是否有操作该模块的权限
            mini.parse();//把html的标签转换成miniui的控件对象
            var leftTree = mini.get("leftTree");
            $.ajax({
                url:"/Employee/UserCharacter",
                type:"POST",
                success:function (data) {
                    alert(data)
                    if(data=="管理员"){
                        leftTree.load("static/data/AdminMenu.txt");
                    }else{
                        leftTree.load("static/data/CommonMenu.txt");
                    }
                },
                error:function () {
                    alert("出错啦！")
                }
            });
        });

        function showTab(node) {
            var tabs = mini.get("mainTabs");
            var id = "tab$" + node.id;
            var tab = tabs.getTab(id);
            if (!tab) {
                tab = {};
                tab.name = id;
                tab.title = node.text;
                tab.showCloseButton = true;
                tab.url = node.url;
                tabs.addTab(tab);
            }
            tabs.activeTab(tab);
        }

        function onNodeSelect(e) {
            var node = e.node;
            var isLeaf = e.isLeaf;
            if (isLeaf) {
                showTab(node);
            }
        }
    </script>
</head>
<body>
    <!--Layout-->
    <div id="layout1" class="mini-layout" style="width:100%;height:100%;">
        <div class="header" region="north" height="70" showSplit="false" showHeader="false">
            <h1 style="margin:0;padding:15px;cursor:default;font-family:微软雅黑,黑体,宋体;">简易药库管理系统</h1>
            <div style="position:absolute;top:18px;right:10px;">
                <a class="mini-button mini-button-iconTop" iconCls="icon-add" onclick="onQuickClick" plain="true">快捷</a>
                <a class="mini-button mini-button-iconTop" iconCls="icon-edit" onclick="onClick"  plain="true" >首页</a>
                <a class="mini-button mini-button-iconTop" iconCls="icon-date" onclick="onClick"  plain="true" >消息</a>
                <a class="mini-button mini-button-iconTop" iconCls="icon-edit" onclick="onClick"  plain="true" >设置</a>
                <a class="mini-button mini-button-iconTop" iconCls="icon-close" onclick="onClick"  plain="true" >关闭</a>
            </div>
        </div>
        <div title="south" region="south" showSplit="false" showHeader="false" height="30" >
        </div>
        <div title="center" region="center" bodyStyle="overflow:hidden;">
            <!--Splitter-->
            <div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0;">
                <div size="180" maxSize="250" minSize="100" showCollapseButton="true">
                    <!--OutlookTree-->
                    <div id="leftTree" class="mini-outlooktree" onnodeselect="onNodeSelect"
                         textField="text" idField="id" parentField="pid"
                    >
                    </div>
                </div>
                <div showCollapseButton="false">
                    <!--Tabs-->
                    <div id="mainTabs" class="mini-tabs bg-toolbar" activeIndex="0" style="width:100%;height:100%;"
                         bodyStyle="border:0;background:white;"
                    >
                        <div title="首页" url="welcome.jsp" >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
