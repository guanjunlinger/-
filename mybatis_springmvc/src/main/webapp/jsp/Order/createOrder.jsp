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
    $(function () {
        $("#subjson").click(function () {

            var rows=$("#CreateOrder").datagrid("getRows");

            var saveDataAry=[];

            for(var i=0;i<rows.length;i++){
                var product_ID=rows[i].product_ID;
                var product_Num=rows[i].product_Num;
                var data1={"product_ID":product_ID,"product_Num":product_Num};
                saveDataAry.push(data1);
            }

            $.ajax({
                type:"POST",
                url: "<%=path%>/viporder/subOrder.do",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(saveDataAry),
                success:function(data){
                }
            });
        });
    });
    var editIndex = undefined;
    $(document).ready(function(){
        loadGrid();
    });

    function getJson(){
        var rows=$('#CreateOrder').datagrid("getRows");
        var json="";
        for(var i=0;i<rows.length;i++)
        {
            json+="{";
            json+="product_ID"+":"+rows[i].product_ID+",";
            json+="product_Num"+":"+rows[i].product_Num+",";
            json = json.substring(0, json.length - 1) + "},";
        }
        json = "[" + json.substring(0, json.length - 1) + "]";


        return json;
    }
    function Submit() {
        var saveDataAry=[];
        var data1={"product_ID":"1","product_Num":"2"};
        var data2={"product_ID":"2","product_Num":"3"};
        saveDataAry.push(data1);
        saveDataAry.push(data2);
        $.ajax({
            type:"POST",
            url: "<%=path%>/viporder/subOrder.do",
            dataType:"json",
            contentType:"application/json",
            data:JSON.stringify(saveDataAry),
            success:function(data){
            }
        });
    }

    function loadGrid(){
        $('#CreateOrder').datagrid({
            onClickCell:onClickCell,
            onAfterEdit:onAfterEdit,
            rownumbers:true,
            pagination:'true',
            fitColumns:'true',
            columns:[[
                {field:'ck',checkbox:true },
                {field:'product_ID',width:50,title:'产品ID',editor:{type:'text'}},
                {field:'product_Num',width:50,title:'产品数量',editor:{type:'numberbox',options:{precision:0,min:1}}}
            ]]});
    }
    function Add(){
        $("#CreateOrder").datagrid("appendRow",{
            product_ID:'1',
            product_Num:'1'
        });
    }
    function Remove(){
        var row = $('#CreateOrder').datagrid('getSelected');
        if (!row){
            $.messager.alert('提示信息', '未选中数据！', 'warning');
            return;
        }
        var index=$('#CreateOrder').datagrid('getRowIndex',row);
        $('#CreateOrder').datagrid('deleteRow', index);
    }
    function endEditing() {
        if (editIndex == undefined) {
            return true
        }
        if ($('#CreateOrder').datagrid('validateRow',editIndex)){
            $('#CreateOrder').datagrid('endEdit',editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index,field,value) {
        if (endEditing()) {
            $('#CreateOrder').datagrid('beginEdit', index);
            var ed = $(this).datagrid('getEditor', {index:index,field:field});
            $(ed.target).focus();
            editIndex = index;
        }
    }
    function onAfterEdit(index, row, changes) {
        //$(this).datagrid('endEdit',index);

    }
</script>
<body>
<table id="CreateOrder" title="VIP下单" class="easyui-datagrid" style="width:100%;height:100%;"
	   toolbar="#toolbar" fit="true" idField="product_ID" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
</table>
<div id="toolbar">
	<div id="tb" style="padding:3px">
		<span>会员号:</span>
		<input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="Add()">增加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="Remove()">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="subjson" plain="true" >提交</a>
	</div>
</div>
</body>
</html>