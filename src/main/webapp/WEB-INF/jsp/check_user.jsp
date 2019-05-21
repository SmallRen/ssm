<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/back.css">
	<script src="${ctx}/bootstrap/js/bootstrap.min.js" ></script>
<title>查询用户</title>
</head>
<body>
<form class="form-inline" style="display:inline-block" action="${ctx}/BackUsearchServlet">
<div class="form-group">
	<input class="form-control" name="search"/>
</div>
<button type="submit" class="btn btn-success btn-sm">查询</button>
</form>
<a class="btn btn-success btn-sm"  data-toggle="modal" data-target="#add">增加</a>
<table class="table table-bordered" style="margin-top:10px">
	<tr>
		<th>用户ID</th>
	    <th>用户名称</th>
	    <th>用户密码</th>
	    <th>用户工号</th>
	    <th>用户电话</th>
	    <th>用户角色</th>
		<th>工作车间</th>
		<th>入职时间</th>
		<th>MAC地址</th>
	    <th>操作</th>
	</tr>


	
	 <c:forEach items="${list}" var="user" >
	<tr>
		<td>${user.id}</td>
		<td>${user.name}</td>
		<td>${user.password}</td>
		<td>${user.employeeNumber}</td>
		<td>${user.telephone}</td>
		<td>${user.myRole.roleName}</td>
		<td>${user.workshop.workshopNumber}</td>
		<td>${user.hireDate}</td>
		<td>${user.mac}</td>
		<td>
		<a class="btn btn-default btn-sm" onClick="userDetails('${user.id}','${user.name}','${user.password}','${user.employeeNumber}','${user.telephone}','${user.hireDate}','${user.role}','${user.workshopId}','${user.mac}')">修改</a>
		<a class="btn btn-danger btn-sm" onClick="deleteUser('${user.name}')">删除</a>
		</td>
	</tr>
	</c:forEach>
</table>

<%--用户删除--%>
<div class="modal fade" id="deleteUser" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">删除用户</h4>
			</div>

			<div class="modal-body">
				<form id="deleteUserForm">
					<input type="hidden" id="deleteUserName"  class="form-control" name="name" >
					<div class="form-group">
						<label >确定删除</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="deleteBtn">提交</button>
			</div>
		</div>
	</div>
</div>

<%--用户修改--%>
<div class="modal fade" id="userDetails" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">用户信息</h4>
			</div>

			<div class="modal-body">
				<form id="udpateForm">
					<input type="hidden" id="id"  class="form-control" name="id" >
					<div class="form-group">
						<label for="name">用户名称</label>
						<input type="text" name="name" class="form-control" id="name" >
					</div>
					<div class="form-group">
						<label for="password">用户密码</label>
						<input type="text" name="password" class="form-control" id="password" >
					</div>
					<div class="form-group">
						<label for="employeeNumber">用户工号</label>
						<input type="text" name="employeeNumber" class="form-control" id="employeeNumber" >
					</div>
					<div class="form-group">
						<label for="telephone">用户电话</label>
						<input type="text" name="telephone" class="form-control" id="telephone" >
					</div>
					<div class="form-group">
						<label for="hireDate">入职时间</label>
						<%--<input type="text" name="hireDate" class="form-control" id="hireDate" >--%>
					</div>
					<div class="form-group">
						<label for="role">用户角色</label>
						<input type="text" name="role" class="form-control" id="role" >
					</div>
					<div class="form-group">
					    <label for="workshopId">工作车间</label>
					    <input type="text" name="workshopId" class="form-control" id="workshopId" >
				    </div>
					<div class="form-group">
						<label for="mac">mac地址</label>
						<input type="tcext" name="mac" class="form-control" id="mac" >
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="submitBtn">提交</button>
			</div>
		</div>
	</div>
</div>

<%--用户增加--%>
<div class="modal fade" id="add" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">用户增加</h4>
			</div>

			<div class="modal-body">
				<form id="addForm">
					<input type="hidden" id="UseId"  class="form-control" name="id" >
					<div class="form-group">
						<label for="name">用户名称</label>
						<input type="text" name="name" class="form-control" id="uname" >
					</div>
					<div class="form-group">
						<label for="password">用户密码</label>
						<input type="text" name="password" class="form-control" id="upassword" >
					</div>
					<div class="form-group">
						<label for="employeeNumber">用户工号</label>
						<input type="text" name="employeeNumber" class="form-control" id="uemployeeNumber" >
					</div>
					<div class="form-group">
						<label for="telephone">用户电话</label>
						<input type="text" name="telephone" class="form-control" id="utelephone" >
					</div>
					<div class="form-group">
						<label for="hireDate">入职时间</label>
						<%--<input type="text" name="hireDate" class="form-control" id="hireDate" >--%>
					</div>
					<div class="form-group">
						<label for="role">用户角色</label>
						<input type="text" name="role" class="form-control" id="urole" >
					</div>
					<div class="form-group">
						<label for="workshopId">工作车间</label>
						<input type="text" name="workshopId" class="form-control" id="uworkshopId" >
					</div>
					<div class="form-group">
						<label for="mac">mac地址</label>
						<input type="text" name="mac" class="form-control" id="umac" >
					</div>
				</form>
			   </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="addSubmitBtn">提交</button>
			</div>
		</div>
	</div>
</div>
</body>

<script>
//删除用户
function deleteUser(name){
	$("#deleteUserName").val(name);
	$("#deleteUser").modal('toggle');
}
$("#deleteBtn").click(function(){
	$.ajax({
		url:'${ctx}/user/delete',
		//序列化表单
		data:$("#deleteUserForm").serialize(),
		type:'post',
		dataType:'TEXT',
		success:function (data){
			debugger
			console.log(data)
			if(data=='true'){
				$("#deleteUser").modal('toggle');
				location.reload();
			}
			else{
				alert('删除失败')
			}
		}

	});
});

//修改用户
function userDetails(id,name,password,employeeNumber,telephone,hireDate,role,workshopId,mac){
	$("#id").val(id);
	$("#name").val(name);
	$("#password").val(password);
	$("#employeeNumber").val(employeeNumber);
	$("#telephone").val(telephone);
	$("#hireDate").val(hireDate);
	$("#role").val(role);
	$("#workshopId").val(workshopId);
	$("#mac").val(mac);
	$("#userDetails").modal('toggle');
}
$("#submitBtn").click(function(){
	debugger
	$.ajax({
		url:'${ctx}/user/update',
		//序列化表单
		data:$("#udpateForm").serialize(),
		type:'POST',
		dataType:'text',
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#userDetails").modal('toggle');
				location.reload();
			}
			else{
				alert('修改失败')
			}
		}

	});
});


//增加用户
$("#addSubmitBtn").click(function(){
	$.ajax({
		url:'${ctx}/user/insert',
		//序列化表单
		data:$("#addForm").serialize(),
		type:'post',
		dataType:'text',
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#add").modal('toggle');
				location.reload();
			}
			else{
				alert('增加失败')
			}
		}

	});
});
</script>
</html>