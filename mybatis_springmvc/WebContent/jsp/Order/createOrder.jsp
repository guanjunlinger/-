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
	$('#VIP_Information').datagrid('load',{
		vip_ID: $('#vip_ID').val(),
		vip_Name: $('#vip_Name').val()
	});
} 
function Add(){ 
	$('#dlg').dialog('open').dialog('setTitle','新增商品条目');
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
<table id="CreateOrder" title="VIP订单" class="easyui-datagrid" 
		toolbar="#toolbar" fit="true" idField="product_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
		    <th field="ID" checkbox="true"></th>
			<th field="product_ID" width="50">商品编号</th>
			<th field="product_Description" width="50">商品描述</th>
			<th field="product_Num" width="40">商品数量</th>
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>会员号:</span>
		<input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="Add()">增加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="Update()">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="Submit()">提交</a>
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:100%;height:100%;" closed="true" buttons="#dlg-buttons">
	<form id="EditVIPForm" method="post"  style="width:100%;">
		<table>
		    <tr>
				<td>商品编号:</td>
				<td> <input class="easyui-combobox" id="mkid" 
                                 data-options="valueField:'mkid', textField:'mkmch', panelHeight:'auto'" >  </td>
			</tr>
			<tr>
				<td>商品描述:</td>
				<td><input name="product_Description" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>	    
			<tr>
				<td>商品数量:</td>
				<td><input name="product_Num" class="easyui-validatebox" type="text"></input></td>
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