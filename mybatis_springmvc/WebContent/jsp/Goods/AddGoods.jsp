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
    $('#AddGoodsForm').form('submit', { 
      url: "<%=path%>/goods/insertgoods.do", 
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
          $('#AddGoodsForm').form('clear');
        } 
        else { 
          $.messager.alert('提示信息', '提交失败，请联系管理员！', 'warning'); 
      } 
      } 
    }); 
}

</script>
<body>
<form id="AddGoodsForm" method="post"  style="width:100%;">
		<table>
			<tr>
				<td>商品描述:</td>
				<td><input name="product_Description" class="easyui-validatebox" type="text" required="true"></input></td>
			</tr>
			<tr>
				<td>商品价格:</td>
				<td><input name="product_Price" class="easyui-validatebox" type="text" required="true"></input></td>
			</tr>
			</table>
	  <div style="margin-top: 20px;"> 
          <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-left: 10px;" onclick="submitForm()">提交</a> 
      </div> 	
	</form>
</body>
</html>