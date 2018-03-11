<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <script type="text/javascript">
        function doSearch() {
            var opts=$("#Account_balance").datagrid("options");
            if(null==opts.url||""==opts.url){
                opts.url="<%=path%>/recharge/listVIP.do";
            }
            $('#Account_balance').datagrid('load', {
                vip_ID: $('#vip_ID').val(),
            });
        }
        function doEdit(){
            var row = $('#Account_balance').datagrid('getSelected');
            if (!row){
                $.messager.alert('提示信息', '未选中数据！', 'warning');
                return;
            }
            $('#dlg').dialog('open').dialog('setTitle','开始推拿');
            $('#EditDisForm').form('load',row);
        }
        function saveDis(){
            $('#EditDisForm').form('submit',{
                url:"<%=path%>/recharge/massage.do",
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(data){
                    if (data!=1){
                        $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning');
                    } else {
                        $.messager.show({
                            title: '提示消息',
                            msg: '推拿计费成功',
                            showType: 'show',
                            timeout: 1000,
                            style: {
                                right: '',
                                bottom: ''
                            }
                        });
                        $('#dlg').dialog('close');
                        $('#Account_balance').datagrid('load');
                    }
                }
            });
        }
    </script>
</head>
<body>
<table id="Account_balance" title="VIP推拿" class="easyui-datagrid"
       toolbar="#toolbar" fit="true" idField="vip_ID" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="ID" checkbox="true"></th>
        <th field="vip_ID" width="50">会员号</th>
        <th field="vip_Name" width="50">会员姓名</th>
        <th field="vip_Level_ID" width="40">会员等级号</th>
        <th field="level_Description" width="40">会员等级描述</th>
        <th field="remains" width="50">会员剩余次数</th>
    </tr>
    </thead>
</table>
<div>
    <div id="toolbar" style="padding:3px">
        <span>会员号:</span>
        <input id="vip_ID" style="line-height:26px;border:1px solid #ccc">
        <a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="doSearch()">查询</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">推拿</a>


    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width:100%;height:100%;" closed="true" buttons="#dlg-buttons">
    <form id="EditDisForm" method="post"  style="width:100%;">
        <table>
            <tr>
                <td>会员号:</td>
                <td><input name="vip_ID" class="easyui-validatebox"  type="text" editable="false"></input></td>
            </tr>
            <tr>
                <td>会员姓名:</td>
                <td><input name="vip_Name" class="easyui-validatebox"  type="text" editable="false"></input></td>
            </tr>
            <tr>
                <td>会员等级号:</td>
                <td><input name="vip_Level_ID" class="easyui-validatebox" type="text" editable="false"></input></td>
            </tr>
            <tr>
                <td>会员等级描述:</td>
                <td><input name="level_Description" class="easyui-validatebox" type="text" editable="false"></input></td>
            </tr>
            <tr>
                <td>会员推拿剩余次数:</td>
                <td><input name="remains" class="easyui-validatebox" editable="false" type="text"></input></td>
            </tr>
        </table>
    </form>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDis()">确定</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
</div>
</body>
</html>