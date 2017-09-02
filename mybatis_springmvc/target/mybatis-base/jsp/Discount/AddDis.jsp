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
    function submitForm() {
        $('#AddDisForm').form('submit', {
            url: "<%=path%>/dis/insertDis.do",
            onSubmit: function () {
                return  $(this).form('validate');
            },
            success: function (data) {
                if (data > 0) {
                    $.messager.show({
                        title: '提示消息',
                        msg: '提交成功',
                        showType: 'show',
                        timeout: 1000,
                        style: {
                            right: '',
                            bottom: ''
                        }
                    });
                    $('#AddDisForm').form('clear');
                }
                else {
                    $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning');
                }
            }
        });
    }

    $.extend($.fn.validatebox.defaults.rules,{
        NotEmpty : { // 非空字符串验证。 easyui 原装required 不能验证空格
            validator : function(value, param) {
                return $.trim(value).length>0;
            },
            message : '该输入项为必输项'
        },
        integer : {// 验证整数
            validator : function(value) {
                return /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/.test(value);
            },
            message : '请输入整数'
        },
        english : {// 验证英语
            validator : function(value) {
                return /^[A-Za-z]+$/i.test(value);
            },
            message : '请输入英文'
        },
        age: {// 验证年龄
            validator: function (value) {
                return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
            },
            message: '年龄必须是0到120之间的整数'
        },
        mobile: {// 验证手机号码
            validator: function (value) {
                return /^(13|15|18)\d{9}$/i.test(value);
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
</script>
<body>
<form id="AddDisForm" method="post"  style="width:100%;">
    <table>
        <tr>
            <td>会员等级:</td>
            <td>
                <select class="easyui-combobox"  name="vip_Level" data-options="valueField:'vip_Level',textField:'vip_Level',url:'<%=path%>/vip/selectLevel.do'" style="width:156px;"/>
            </td>
        </tr>

        <tr>
            <td>充值金额:</td>
            <td><input name="discount_total" class="easyui-validatebox" validtype="integer" type="text" required="true"></input></td>
        </tr>
        <tr>
            <td>赠送金额:</td>
            <td><input name="discount_gift" class="easyui-validatebox" validtype="integer" type="text" required="true"></input></td>
        </tr>

        <tr>
            <td>会员描述:</td>
            <td><input name="level_Description" class="easyui-validatebox" validtype="NotEmpty" type="text" required="true"></input></td>
        </tr>
    </table>
    <div style="margin-top: 20px;">
        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-left: 10px;" onclick="submitForm()">提交</a>
    </div>
</form>
</body>
</html>