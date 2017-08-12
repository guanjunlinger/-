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
<title>Insert title here</title>
<script type="text/javascript">
function doSearch() { 
	$('#VIP_Order').datagrid('load',{
		year: $('#year').val(),
		month: $('#month').val(),
	});
} 

</script>
</head>
<body>
<table id="VIP_Order" title="账户信息" class="easyui-datagrid" 
		url="<%=path%>/viporder/selectByDate.do"
		toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
		    <th field="ID" checkbox="true"></th>
			<th field="vip_ID" width="50">会员号</th>
			<th field="order_ID" width="40">订单号</th>
			<th field="order_total" width="50">总计</th>
			<th field="order_Time" width="40">消费时间</th>
			<th field="employee_Name" width="50">执行员工</th>
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>年份:</span>
		<input id="year" style="line-height:26px;border:1px solid #ccc">
		<span>月份:</span>
		<input id="month" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
	</div>
</div>
</body>
</html>