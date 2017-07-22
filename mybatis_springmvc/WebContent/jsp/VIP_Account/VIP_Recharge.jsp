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
function doEdit(){ 
	var row = $('#VIP_Account').datagrid('getSelected');
	var  vip_ID=$('#vip_ID').val();
	if (!row){
		$.messager.alert('提示信息', '未选中数据！', 'warning'); 
		return;
	}
	if (!vip_ID){
		$.messager.alert('提示信息', '请输入会员ID！', 'warning'); 
		return;
	}
	$('#dlg').dialog('open').dialog('setTitle','VIP充值');
	$('#EditVIPForm').form('load',
			{vip_ID:$('#vip_ID').val(),
		     discount_ID:row.discount_ID,
		     discount_total:row.discount_total,
		     discount_gift:row.discount_gift
		     });
}
</script>
<body>
<table id="VIP_Account" title="VIP充值信息" class="easyui-datagrid" 
		toolbar="#toolbar" fit="true" idField="discount_ID" pagination="true"
		url="<%=path%>/account/selectrechargetype.do"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr> 
		    <th field="ID" checkbox="true"></th>
			<th field="discount_ID" width="50">优惠号</th>
	        <th field="discount_total" width="50">充值金额</th>
	        <th field="discount_gift" width="50">赠送金额</th>    
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>会员号:</span>
		<input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询套餐</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">充值</a>
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:100%;height:100%;" closed="true" buttons="#dlg-buttons">
	<form id="EditVIPForm" method="post"  style="width:100%;">
		<table>
		    <tr>
				<td>会员号:</td>
				<td><input name="vip_ID" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
			<tr>
				<td>优惠号:</td>
				<td><input name="discount_total" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
		    
			<tr>
				<td>充值金额:</td>
				<td><input name="discount_total" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
			<tr>
				<td>赠送金额:</td>
				<td><input name="discount_gift" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
			</table>
			</form>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">确定</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
</div>
</body>
</html>