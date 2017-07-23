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
    $('#EditEmpForm').form('submit', { 
      url: "<%=path%>/emp/updateEmp.do", 
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
          window.location.replace="<%=path%>/jsp/login.jsp"
        } 
        else { 
          $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning'); 
      } 
      } 
    }); 
}
</script>
<body>
<form id="EditEmpForm" method="post"  style="width:100%;">
		<table>
		    
			<tr>
				<td>新用户密码:</td>
				<td><input name="employee_Password" class="easyui-validatebox" type="password" required="true"></input></td>
			</tr>
			<tr>
				<td>再输入一次密码:</td>
				<td><input name="lemployee_Password" class="easyui-validatebox" type="password" required="true"></input></td>
			</tr>
			</table>
			</form>
			
			<div region="south" border="false" style="text-align:right;padding:5px 0;">
                <a class="easyui-linkbutton" iconCls="icon-ok"  href="javascript:void(0)" onclick="submitForm()">登录</a>
            </div>
<body>
</body>
</html>