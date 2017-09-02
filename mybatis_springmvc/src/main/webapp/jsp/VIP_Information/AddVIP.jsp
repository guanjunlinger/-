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
function submitForm() { 
    $('#AddVIPForm').form('submit', { 
      url: "<%=path%>/vip/insertvip.do", 
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
          $('#AddVIPForm').form('clear');
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
                    return /^[+]?[0-9]+\d*$/i.test(value);  
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
</script>
<body>
	<form id="AddVIPForm" method="post"  style="width:100%;">
		<table>
			<tr>
				<td>会员名:</td>
				<td><input name="vip_Name" class="easyui-validatebox" validtype="NotEmpty"  type="text" required="true"></input></td>
			</tr>
			<tr>
				<td>会员等级:</td>
				<td><input name="vip_Level" class="easyui-validatebox" validtype="NotEmpty" type="text" required="true"></input></td>
			</tr>
			<tr>
				<td>会员性别:</td>
				<td><input name="vip_Gender" class="easyui-validatebox" validtype="NotEmpty" type="text" required="true"></input></td>
			</tr>
			<tr>
				<td>会员生日:</td>
				<td><input name="vip_Birthday" class="easyui-datebox" validtype="NotEmpty" required="true"></input></td>
			</tr>
			<tr>
				<td>会员电话:</td>
				<td><input name="vip_Telephone" class="easyui-validatebox" validtype="mobile" type="text" required="true"></input></td>
			</tr>
				<tr>
				<td>会员邮箱:</td>
				<td><input name="vip_Mailbox" class="easyui-validatebox" validtype="email" type="text" required="true"></input></td>
			</tr>
				<tr>
				<td>会员年龄:</td>
				<td><input name="vip_Age" class="easyui-validatebox" type="text" validtype="age" required="true" ></input></td>
			</tr>
				<tr>
				<td>会员地址:</td>
				<td><input name="vip_Address" class="easyui-validatebox" type="text" validtype="NotEmpty" required="true"></input></td>
			</tr>
				<tr>
				<td>会员注册时间:</td>
				<td><input name="vip_Time"  class="easyui-datebox" type="text" validtype="NotEmpty" required="true"></input></td>
			</tr>
			</table>
	  <div style="margin-top: 20px;"> 
          <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-left: 10px;" onclick="submitForm()">提交</a> 
      </div> 	
	</form>
</body>
</html>