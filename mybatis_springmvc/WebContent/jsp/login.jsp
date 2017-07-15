<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath(); 
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"  src="<%=path%>/easyui_1.5.2/jquery.min.js" ></script>  
<script type="text/javascript"  src="<%=path%>/easyui_1.5.2/jquery.easyui.min.js" ></script>  
<script type="text/javascript"  src="<%=path%>/easyui_1.5.2/locale/easyui-lang-zh_CN.js"></script>  
<link rel="stylesheet" type="text/css"  href="<%=path%>/easyui_1.5.2/themes/default/easyui.css" />  
<link rel="stylesheet" type="text/css"  href="<%=path%>/easyui_1.5.2/themes/icon.css" />
<script type="text/javascript">
function submitForm(){
	$('#loginForm').form('submit', { 
	      url: "<%=path%>/emp/login.do", 
	      onSubmit: function () {
	        return  $(this).form('validate');
	      }, 
	      success: function (data) {
	        if (data==2) { 
	        	
	        	window.location.href="<%=path%>/jsp/index.jsp";
	        } 
	        else if(data==1) { 
	        	$('#loginForm').form('clear');
	          $.messager.alert('提示信息', '密码错误！', 'warning'); 
	      }else{
	    	  $('#loginForm').form('clear');
	    	  $.messager.alert('提示信息', '用户名不存在！', 'warning'); 
	      }
	      } 
	    }); 
}


</script>
<title>登录</title>

</head>
<body>
<div id="loginWin" class="easyui-window" title="登录" style="width:350px;height:188px;padding:5px;"
   minimizable="false" maximizable="false" resizable="false" collapsible="false">
    <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding:5px;background:#fff;border:1px solid #ccc;">
        <form id="loginForm" method="post">
            <div style="padding:5px 0;">
                <label for="employee_Name">帐号:</label>
                <input type="text" name="employee_Name" style="width:260px;"></input>
            </div>
            <div style="padding:5px 0;">
                <label for="employee_Password">密码:</label>
                <input type="password" name="employee_Password" style="width:260px;"></input>
            </div>
             <div style="padding:5px 0;text-align: center;color: red;" id="showMsg"></div>
        </form>
            </div>
            <div region="south" border="false" style="text-align:right;padding:5px 0;">
                <a class="easyui-linkbutton" iconCls="icon-ok"  href="javascript:void(0)" onclick="submitForm()">登录</a>
                <a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="$('#loginForm').form('clear')">重置</a>
            </div>
    </div>
</div>
</body>
</html>