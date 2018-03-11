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
    var opts=$("#VIP_Information").datagrid("options");
    if(null==opts.url||""==opts.url){
        opts.url="<%=path%>/vip/selectvip.do";
    }
	$('#VIP_Information').datagrid('load',{
		vip_ID: $('#vip_ID').val(),
		vip_Name: $('#vip_Name').val()
	});
} 
function doEdit(){ 
	var row = $('#VIP_Information').datagrid('getSelected');
	if (!row){
		$.messager.alert('提示信息', '未选中数据！', 'warning'); 
		return;
	}
	$('#dlg').dialog('open').dialog('setTitle','修改VIP信息');
	$('#EditVIPForm').form('load',row);
}
function saveUser(){
	$('#EditVIPForm').form('submit',{
		url:"<%=path%>/vip/updatevip.do", 
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(data){
			if (data!=1){
				 $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning'); 
			} else {
				   $.messager.show({ 
			            title: '提示消息', 
			            msg: '修改成功', 
			            showType: 'show', 
			            timeout: 1000, 
			            style: { 
			              right: '', 
			              bottom: ''
			            } 
			          });  
				$('#dlg').dialog('close');
				$('#VIP_Information').datagrid('load');
			}
		}
	});
}
</script>
<body>
<table id="VIP_Information" title="VIP基本信息" class="easyui-datagrid"
		toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
		    <th field="ID" checkbox="true"></th>
			<th field="vip_ID" width="50">会员号</th>
			<th field="vip_Name" width="50">会员姓名</th>
			<th field="vip_Gender" width="40">会员性别</th>
			<th field="vip_Birthday" width="50">会员生日</th>
			<th field="vip_Telephone" width="50">联系方式</th>
			<th field="vip_Age" width="50">会员年龄</th>
			<th field="vip_Address" width="80">家庭住址</th>
			<th field="vip_Time" width="50">注册时间</th>
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>会员号:</span>
		<input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
		<span>会员名:</span>
		<input id="vip_Name" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">修改</a>
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
				<td>会员性别:</td>
				<td><input name="vip_Gender" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
		    
			<tr>
				<td>会员姓名:</td>
				<td><input name="vip_Name" class="easyui-validatebox" type="text"></input></td>
			</tr>
			<tr>
				<td>会员生日:</td>
				<td><input name="vip_Birthday" class="easyui-datebox"  editable="false" required="true" /></td>
			</tr>
			<tr>
				<td>会员电话:</td>
				<td><input name="vip_Telephone" class="easyui-validatebox" type="text" required="true"></input></td>
			</tr>
				<tr>
				<td>会员年龄:</td>
				<td><input name="vip_Age" class="easyui-validatebox" type="text" required="true" ></input></td>
			</tr>
				<tr>
				<td>会员地址:</td>
				<td><input name="vip_Address" class="easyui-validatebox" type="text" required="true"></input></td>
			</tr>
				<tr>
				<td>会员注册时间:</td>
				<td><input name="vip_Time"  class="easyui-validatebox" type="text" editable="false"></input></td>
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