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

    function doEdit(){
        var row = $('#OrderInformation').datagrid('getSelected');
        if (!row){
            $.messager.alert('提示信息', '未选中数据！', 'warning');
            return;
        }
        $('#dlg').dialog('open').dialog('setTitle','查看订单详情信息');
        $('#OrderDetails').datagrid("options").url = '<%=path%>/viporder/getOrderItems.do';
        $('#OrderDetails').datagrid('load',{
            order_ID: row['order_ID']
        });
    }
function Close() {
 $('#dlg').dialog('close');
 $('#OrderInformation').datagrid('load');
}


</script>
<body>
<table id="OrderInformation" title="订单信息" class="easyui-datagrid"
       url="<%=path%>/viporder/selectUserOrderById.do"
       toolbar="#toolbar" fit="true" idField="order_ID" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="ID" checkbox="true"></th>
        <th field="vip_ID" width="50">会员编号</th>
        <th field="order_ID" width="50">订单编号</th>
        <th field="order_total" width="50">消费金额</th>
        <th field="order_Time" width="50">消费时间</th>
        <th field="employee_Name" width="50">办理员工</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <div id="tb" style="padding:3px">
        <span>会员号:</span>
        <input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
        <span>订单编号:</span>
        <input id="order_ID" style="line-height:26px;border:1px solid #ccc">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">详情信息</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width:90%;height:90%;" closed="true" buttons="#dlg-buttons">
    <div id="panel" class="easyui-panel">
    <table id="OrderDetails"  class="easyui-datagrid" fit="true" idField="product_ID" pagination="true"
           rownumbers="true"      fitColumns="true" style="width:90%;height:90%;">
        <thread>
            <tr>
                <th field="product_ID" width="50">商品ID</th>
                <th field="product_Description" width="100">商品描述</th>
                <th field="product_Price" width="50">商品价格</th>
                <th field="product_Num" width="50">商品数量</th>
            </tr>
        </thread>
    </table>
    </div>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="Close()">取消</a>
    </div>
</div>
</body>
</html>