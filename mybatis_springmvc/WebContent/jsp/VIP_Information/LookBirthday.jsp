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
function doSearchb() { 
	$('#VIP_Information').datagrid('load',{
		time: $('#time').val(),
	});
} 

</script>
</head>
<body>
<table id="VIP_Information" title="VIP生日提醒" class="easyui-datagrid" 
        url="<%=path%>/vip/selectbir.do"
		toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
		    <th field="ID" checkbox="true"></th>
			<th field="vip_ID" width="50">会员号</th>
			<th field="vip_Level" width="40">会员等级</th>
			<th field="vip_Name" width="50">会员姓名</th>
			<th field="vip_Gender" width="40">会员性别</th>
			<th field="vip_Birthday" width="50">会员生日</th>
			<th field="vip_Telephone" width="50">联系方式</th>
			<th field="vip_Mailbox" width="80">邮箱</th>
			<th field="vip_Age" width="50">会员年龄</th>
			<th field="vip_Address" width="80">家庭住址</th>
		</tr>
	</thead>
</table>
<div >
	<div id="toolbar" style="padding:3px">
		<span>日期:</span>		
		<input id="time" style="line-height:26px;border:1px solid #ccc">
		<a class="easyui-linkbutton" iconCls="icon-ok"  href="javascript:void(0)" onclick="doSearchb()">查询</a>				
	</div>
</div>
</body>
</html>