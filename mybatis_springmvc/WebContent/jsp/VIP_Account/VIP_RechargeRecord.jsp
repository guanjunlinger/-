<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
function doSearch() { 
	$('#VIP_Account').datagrid('load',{
		vip_ID: $('#vip_ID').val()
	});
} 
</script>
<body>
<table id="VIP_Account" title="VIP充值记录" class="easyui-datagrid" 
		toolbar="#toolbar" fit="true" idField="recharge_Time" pagination="true"
		url="<%=path%>/account/selectrechargeRecordByID.do"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr> 
		    <th field="vip_ID" width="50">会员号</th> 
			<th field="recharge_Time" width="50">充值时间</th>
	        <th field="recharge_Total" width="50">实际充值金额</th>
	        <th field="recharge_Accumulate" width="50">累计充值金额</th>
	        <th field="employee_Name" width="50">经办人</th>     
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>会员号:</span>
		<input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询充值记录</a>
	</div>
</div>
</body>
</html>