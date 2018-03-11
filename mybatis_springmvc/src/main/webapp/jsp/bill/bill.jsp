<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script type="text/javascript" src="<%=path%>/easyui_1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/easyui_1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/easyui_1.5.2/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/easyui_1.5.2/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/easyui_1.5.2/themes/icon.css"/>
    <title>Insert title here</title>
    <script type="text/javascript">
        function doSearch() {
            var opts=$("#VIP_Order").datagrid("options");
            if(null==opts.url||""==opts.url){
                opts.url="<%=path%>/order/selectBill.do";
            }
            $('#VIP_Order').datagrid('load', {
                year: $('#year').val(),
                month: $('#month').val(),
            });
        }

    </script>
</head>
<body>
<table id="VIP_Order" title="订单收入信息" class="easyui-datagrid"
       toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="ID" checkbox="true"></th>
        <th field="vip_ID" width="50">会员号</th>
        <th field="order_ID" width="40">订单号</th>
        <th field="order_total" width="50">总计</th>
        <th field="order_Time" width="40">消费时间</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <div id="tb" style="padding:3px">
        <span>年份:</span>
        <input id="year" style="line-height:26px;border:1px solid #ccc"/>
        <span>月份:</span>
        <select id="month" class="easyui-combobox" name="month" 　style="width:200px;">
            <option value="0">全月</option>
            <option value="1">一月</option>
            <option value="2">二月</option>
            <option value="3">三月</option>
            <option value="4">四月</option>
            <option value="5">五月</option>
            <option value="6">六月</option>
            <option value="7">七月</option>
            <option value="8">八月</option>
            <option value="9">九月</option>
            <option value="10">十月</option>
            <option value="11">十一月</option>
            <option value="12">十二月</option>

        </select>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
    </div>
</div>
</body>
</html>