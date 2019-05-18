<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back.css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" ></script>
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
	 <th>用户名称</th>
	 <th>用户密码</th>
	 <th>用户性别</th>
	 <th>用户电话</th>
	 <th>操作</th>
	</tr>
	
	 <c:forEach items="${list}" var="user" >
	<tr>
		<td>${user.userName}</td>
		<td>${user.passWord}</td>
		<td>${user.gender}</td>
		<td>${user.telephone}</td>
		<td>
		<a class="btn btn-default btn-sm" onclick="userDetails('${user.id}','${user.userName}','${user.passWord}','${user.gender}' ,'${user.telephone}')"   >修改</a>
		<a class="btn btn-danger btn-sm" onclick="dropUser('${user.id}')">删除</a>
		</td>
	</tr>
	</c:forEach>
</table>


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
       	<input type="hidden" id="UserId"  class="form-control" name="id" >
		  <div class="form-group">
			    <label for="userName">用户名称</label>
			    <input type="text" name="userName" class="form-control" id="userName" >
		  </div>
		    <div class="form-group">
			    <label for="passWord">用户密码</label>
			    <input type="text" name="passWord" class="form-control" id="passWord" >
		    </div>
        <div class="form-group">
			    <label for="gender">用户性别</label>
			    <input type="text" name="gender" class="form-control" id="gender" >
		  </div>
		  <div class="form-group">
			    <label for="telephone">用户性别</label>
			    <input type="text" name="telephone" class="form-control" id="telephone" >
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


<div class="modal fade" id="dropUser" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除用户</h4>
      </div> 
     
      <div class="modal-body">
      <form id="dropUserForm"> 
       	<input type="hidden" id="deleteUserId"  class="form-control" name="id" > 
		  <div class="form-group">
			    <label for="name">确定删除</label>
		  </div>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="dropBtn">提交</button>
      </div>
    </div> 
  </div> 
</div>


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
       	<input type="hidden" id="UserId"  class="form-control" name="id" >
		  <div class="form-group">
			    <label for="userName">用户名称</label>
			    <input type="text" name="username" class="form-control" id="username" >
		  </div>
		    <div class="form-group">
			    <label for="passWord">用户密码</label>
			    <input type="text" name="password" class="form-control" id="password" >
		    </div>
        <div class="form-group">
			    <label for="gender">用户性别</label>
			    <input type="text" name="gender" class="form-control" id="gender" >
		  </div>
		  <div class="form-group">
			    <label for="telephone">用户电话</label>
			    <input type="text" name="telephone" class="form-control" id="telephone" >
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
<script >
//修改用户
function userDetails(id,userName,passWord,gender,telephone){
	$("#UserId").val(id);
	$("#userName").val(userName); 
	$("#passWord").val(passWord);
	$("#gender").val(gender);
	$("#telephone").val(telephone);
	$("#userDetails").modal('toggle');
}
$("#submitBtn").click(function(){  
	$.ajax({
		url:'${ctx}/BackUupdateServlet',
		//序列化表单
		data:$("#udpateForm").serialize(),
		type:'post',
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
//删除用户
function dropUser(id){ 
	$("#deleteUserId").val(id); 
	$("#dropUser").modal('toggle');
}
$("#dropBtn").click(function(){  
	$.ajax({
		url:'${ctx}/BackUdropServlet',
		//序列化表单
		data:$("#dropUserForm").serialize(),
		type:'post',
		dataType:'text', 
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#dropUser").modal('toggle');
				location.reload();
			}
			else{
				alert('删除失败')
			}
		}
		
	}); 	
});
//增加用户


$("#addSubmitBtn").click(function(){  
	$.ajax({
		url:'${ctx}/BackUaddServlet',
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