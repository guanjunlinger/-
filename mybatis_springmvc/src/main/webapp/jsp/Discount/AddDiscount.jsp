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
            url: "<%=path%>/discount/insertDiscount.do",
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
        age: {// 验证年龄
            validator: function (value) {
                return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
            },
            message: '年龄必须是0到120之间的整数'
        },

    });
</script>
<body>
<form id="AddDisForm" method="post"  style="width:100%;">
    <table>
        <tr>
            <td>会员等级描述:</td>
            <td><input name="Level_Description" class="easyui-validatebox" required="true"></input></td>
        </tr>
        <tr>
            <td>会员推拿次数:</td>
            <td><input name="Discount_count" class="easyui-validatebox" validtype="integer" type="text" required="true"></input></td>
        </tr>

        <tr>
            <td>会员充值金额:</td>
            <td><input name="Discount_price" class="easyui-validatebox" validtype="integer" type="text" required="true"></input></td>
        </tr>
    </table>
    <div style="margin-top: 20px;">
        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-left: 10px;" onclick="submitForm()">提交</a>
    </div>
</form>
</body>
</html>