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
<script type="text/javascript">
function doSearch() {
	$('#Account_balance').datagrid('load',{
		vip_Balance:$('#time').val(),
	});
} 

</script>
</head>
<body>
<table id="Account_balance" title="VIP账户余额提醒" class="easyui-datagrid" 
        url="<%=path%>/account/balance.do"
		toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
			<th field="vip_ID" width="50">会员号</th>
			<th field="vip_Level" width="40">会员等级</th>
			<th field="vip_Name" width="50">会员姓名</th>
			<th field="vip_Balance" width="50">会员账户余额</th>
		</tr>
	</thead>
</table>
<div >
	<div id="toolbar" style="padding:3px">
		<span>余额:</span>		
		<input id="time" style="line-height:26px;border:1px solid #ccc">
		<a class="easyui-linkbutton" iconCls="icon-ok"  href="javascript:void(0)" onclick="doSearch()">查询</a>
		
		
	</div>
</div>
</body>
</html>