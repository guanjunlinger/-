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
    var opts=$("#Goods").datagrid("options");
    if(null==opts.url||""==opts.url){
        opts.url="<%=path%>/goods/selectgoods.do";
    }
	$('#Goods').datagrid('load',{
		product_ID: $('#product_ID').val()
	});
} 

function doEdit(){ 
	var row = $('#Goods').datagrid('getSelected');
	if (!row){
		$.messager.alert('提示信息', '未选中数据！', 'warning'); 
		return;
	}
	$('#dlg').dialog('open').dialog('setTitle','修改商品信息');
	$('#EditGoodsForm').form('load',row);
}


function saveGoods(){
	$('#EditGoodsForm').form('submit',{
		url:"<%=path%>/goods/updategoods.do", 
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
				$('#Goods').datagrid('load');
			}
		}
	});
}
</script>
<body>
<table id="Goods" title="商品信息" class="easyui-datagrid"
		toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead> 
		<tr>
		    <th field="ID" checkbox="true"></th>
			<th field="product_ID" width="50">商品编号</th>
			<th field="product_Description" width="80">商品描述</th>
			<th field="product_Price" width="50">商品价格</th>
		
			
		</tr>
	</thead>
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>商品编号:</span>
		<input id="product_ID" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">修改</a>
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:100%;height:100%;" closed="true" buttons="#dlg-buttons">
	<form id="EditGoodsForm" method="post"  style="width:100%;">
		<table>
		    <tr>
				<td>商品编号:</td>
				<td><input name="product_ID" class="easyui-validatebox" type="text" editable="false"></input></td>
			</tr>
			<tr>
				<td>商品描述:</td>
				<td><input name="product_Description" class="easyui-validatebox" type="text" ></input></td>
			</tr>
		    
			<tr>
				<td>商品价格:</td>
				<td><input name="product_Price" class="easyui-validatebox" type="text"></input></td>
			</tr>
			</table>
			</form>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveGoods()">确定</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
</div>	
</body>
</html>