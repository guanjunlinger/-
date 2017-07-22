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
<script>
function addTab(title, url){
	if ($('#tt').tabs('exists', title)){
		$('#tt').tabs('select', title);
	} else {
		var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		$('#tt').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
	}
}
</script>
</head>
<body>
        <div region="north"  style="width:80%;height:5%;">顶部</div>
		<div class="easyui-layout" fit="true">
			<div region="west" split="true" style="width:15%;height:90%;">
				<ul class="easyui-tree">
					<li>
						<span>会员管理</span>
						<ul>
							<li>
							<span>会员基本信息管理</span>
						<ul>
							<li><span><a href="#" onclick="addTab('注册会员','<%=path%>/jsp/VIP_Information/AddVIP.jsp')">注册会员</a></span></li>
							<li><span><a href="#" onclick="addTab('浏览会员信息','<%=path%>/jsp/VIP_Information/LookVIP.jsp')">浏览会员信息</a></span></li>
							<li><span><a href="#" onclick="addTab('会员生日提醒','<%=path%>/jsp/VIP_Information/LookBirthday.jsp')">会员生日提醒</a></span></li>							
						</ul>
						</li>
						<li>
							<span>会员账户管理</span>
						<ul>	
						<li>
						 <span>会员余额管理</span>	
						<ul>
							<li><span><a href="#" onclick="addTab('会员余额提醒','<%=path%>/jsp/VIP_Account/Account_balance.jsp')">会员余额提醒</a></span></li>		
							<li><span>充值</span></li>						
						</ul>
						</li>
						<li>
						 <span>会员积分管理</span>	
						<ul>
							<li><span>积分查询</span></li>
							<li><span>积分兑换</span></li>						
						</ul>
						</li>
						</ul>
						</li>
						<li>
						    <span>会员专项服务管理</span>
						<ul>
							<li><span>添加会员类型</span></li>
							<li><span>浏览会员优惠信息</span></li>
						</ul>
					</li>
					</ul>
					</li>
						<li>
						<span>商品管理</span>
						<ul>
							<li><span><a href="#" onclick="addTab('添加商品信息','<%=path%>/jsp/Goods/AddGoods.jsp')">添加商品信息</a></span></li>
							<li><span><a href="#" onclick="addTab('浏览商品信息','<%=path%>/jsp/Goods/LookGoods.jsp')">浏览商品信息</a></span></li>
						</ul>
					</li>
				<li>
						<span>订单管理</span>
						<ul>
							<li><span>会员下单</span></li>
							<li><span>订单查询</span></li>
						</ul>
					</li>
				<li>
						<span>财务管理</span>
						<ul>
							<li><span>月份财务报表</span></li>
							<li><span>季度财务报表</span></li>
							<li><span>年度财务报表</span></li>
						</ul>
					</li>			
				</ul>
			</div>
    <div region="center" style="width:80%;height:90%;">
	<div id="tt" class="easyui-tabs" style="width:100%;height:90%;">
		<div title="Home">
		</div>
	</div>  
    </div>
    <div region="east"   style="width:5%;height:90%;">右侧</div>
    <div region="south"  style="width:80%;height:5%;">底部</div>
    </div>
	</body>
</html>