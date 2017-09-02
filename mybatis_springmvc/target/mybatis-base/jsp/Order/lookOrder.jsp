<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script type="text/javascript"  src="<%=path%>/easyui_1.5.2/jquery.min.js" ></script>
    <script type="text/javascript"  src="<%=path%>/easyui_1.5.2/jquery.easyui.min.js" ></script>
    <script type="text/javascript"  src="<%=path%>/easyui_1.5.2/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css"  href="<%=path%>/easyui_1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css"  href="<%=path%>/easyui_1.5.2/themes/icon.css" />
</head>
<script type="text/javascript">

    function doSearch() {
        $('#OrderInformation').datagrid('load',{
            vip_ID: $('#vip_ID').val(),
            order_ID: $('#order_ID').val()
        });
    }

</script>
<body>
<table id="OrderInformation" title="订单信息" class="easyui-datagrid"
       toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
</table>

<script type="text/javascript">


    $(function () {
        $('#OrderInformation').datagrid({
            url:"<%=path%>/viporder/selectUserOrderById.do",
            loadMsg: '数据加载中，请稍后...',
            fitColumns: true,
            rownumbers:true,
            showFooter:true,
            columns: [[

                { field: 'vip_ID', sum: 'true', align: 'right', title: '会员编号', width: 50,},
                { field: 'order_ID', sum: 'true', align: 'right', title: '订单编号', width: 50,},
                { field: 'order_total', sum: 'true', align: 'right', title: '消费金额', width: 50,},
                { field: 'order_Time', sum: 'true', align: 'right', title: '消费时间', width: 50,},
                { field: 'employee_Name', sum: 'true', align: 'right', title: '办理员工', width: 50,},
            ]],
            onLoadSuccess: function (data) {

                var rows = $('#OrderInformation').datagrid('getRows')//获取当前的数据行
                var ShouldPay = 0 ;

                for (var i = 0; i < rows.length; i++) {
                    ShouldPay += rows[i]['order_total'];

                }
                //新增一行显示统计信息
                $('#OrderInformation').datagrid('appendRow', {
                    vip_ID: '<span class="subtotal">合计</span>',
                    order_ID: '<span class="subtotal">' + ShouldPay + '</span>'
                });

                //合计
            },
        });
    });

    function compute() {
        var rows = $('#OrderInformation').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i].order_total);
        }
        return total;
    }

</script>

<div id="toolbar">
    <div id="tb" style="padding:3px">
        <span>会员号:</span>
        <input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
        <span>订单编号:</span>
        <input id="order_ID" style="line-height:26px;border:1px solid #ccc">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
    </div>
</div>
</body>
</html>