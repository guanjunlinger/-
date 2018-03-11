<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
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
</head>
<script type="text/javascript">

    function doEdit() {
        var row = $('#Discount').datagrid('getSelected');
        if (!row) {
            $.messager.alert('提示信息', '未选中数据！', 'warning');
            return;
        }
        $('#dlg').dialog('open').dialog('setTitle', '修改商品信息');
        $('#EditDisForm').form('load', row);
    }

    $.extend($.fn.validatebox.defaults.rules, {
        NotEmpty: { // 非空字符串验证。 easyui 原装required 不能验证空格
            validator: function (value, param) {
                return $.trim(value).length > 0;
            },
            message: '该输入项为必输项'
        },
        ivalidtypenteger: {// 验证整数
            validator: function (value) {
                return /^[+]?[0-9]+\d*$/i.test(value);
            },
            message: '请输入整数'
        },
        english: {// 验证英语
            validator: function (value) {
                return /^[A-Za-z]+$/i.test(value);
            },
            message: '请输入英文'
        },
        age: {// 验证年龄
            validator: function (value) {
                return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
            },
            message: '年龄必须是0到120之间的整数'
        },
        mobile: {// 验证手机号码
            validator: function (value) {
                return /^1[34578]\d{9}$/.test(value);
            },
            message: '手机号码格式不正确'
        },
        email: {// 验证邮箱
            validator: function (value) {
                return /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            },
            message: '邮箱格式不正确'
        },
    });

    function saveDis() {
        $('#EditDisForm').form('submit', {
            url: "<%=path%>/recharge/recharge.do",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                if (data != 1) {
                    $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning');
                } else {
                    $.messager.show({
                        title: '提示消息',
                        msg: '充值成功',
                        showType: 'show',
                        timeout: 1000,
                        style: {
                            right: '',
                            bottom: ''
                        }
                    });
                    $('#dlg').dialog('close');
                    $('#Discount').datagrid('load');
                }
            }
        });
    }
</script>
<body>
<table id="Discount" title="充值优惠信息" class="easyui-datagrid"
       toolbar="#toolbar" fit="true" idField="vip_Level_ID" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true"
       url="<%=path%>/discount/selectByVIP_Level_ID.do">
    <thead>
    <tr>
        <th field="ID" checkbox="true"></th>
        <th field="vip_Level_ID" width="50">会员等级ID</th>
        <th field="level_Description" width="60">会员等级描述</th>
        <th field="discount_count" width="80">会员推拿次数</th>
        <th field="discount_price" width="50">会员推拿充值价格</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <div id="tb" style="padding:3px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()">充值</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width:100%;height:100%;" closed="true" buttons="#dlg-buttons">
    <form id="EditDisForm" method="post" style="width:100%;">
        <table>
            <tr>
                <td>会员ID:</td>
                <td><input name="vip_ID" class="easyui-validatebox" type="text" editable="true" validtype="integer"/>
                </td>
            </tr>
            <tr>
                <td>会员等级ID:</td>
                <td><input name="vip_Level_ID" class="easyui-validatebox" type="text" editable="false"></input></td>
            </tr>
            <tr>
                <td>会员等级描述:</td>
                <td><input name="level_Description" class="easyui-validatebox" type="text" editable="false"></input>
                </td>
            </tr>
            <tr>
                <td>会员推拿次数:</td>
                <td><input name="discount_count" class="easyui-validatebox" validtype="integer" type="text"
                           editable="false"></input></td>
            </tr>
            <tr>
                <td>会员推拿充值价格:</td>
                <td><input name="discount_price" class="easyui-validatebox" validtype="integer" type="text"
                           editable="false"></input></td>
            </tr>
        </table>
    </form>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDis()">确定</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
</div>

</body>
</html>