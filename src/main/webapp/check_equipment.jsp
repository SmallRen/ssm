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
<title>查询所有商品</title>
</head>
<body>
<form class="form-inline" style="display:inline-block" action="${ctx}/BackSearchServlet">
<div class="form-group"> 
	<input class="form-control" name="search"/>
</div>
<button type="submit" class="btn btn-success btn-sm">查询</button>
</form>
<a class="btn btn-success btn-sm"  data-toggle="modal" data-target="#addGood">增加</a>
<table class="table table-bordered" style="margin-top:10px">
	<tr>
	 <th>商品名称</th>
	 <th>商品描述</th>
	 <th>商品价格</th>
	 <th>商品种类</th>
	 <th>操作</th>
	</tr>
	
	 <c:forEach items="${list}" var="goods" >
	<tr>
		<td>${goods.name}</td>
		<td>${goods.description}</td>
		<td>${goods.description}</td>
		<td>${goods.categoryName}</td>
		<td>
		<a class="btn btn-default btn-sm" onclick="goodDetails('${goods.id}','${goods.name}','${goods.description}','${goods.price}')"  >修改</a>
		<a class="btn btn-danger btn-sm" onclick="drop('${goods.id}')">删除</a>
		</td>
	</tr>
	</c:forEach>
</table>

<div class="modal fade" id="goodDetails" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">商品信息</h4>
      </div> 
     
      <div class="modal-body">
      <form id="udpateForm">
       	<input type="hidden" id="GoodsId"  class="form-control" name="id" >
		  <div class="form-group">
			    <label for="name">商品名称</label>
			    <input type="text" name="name" class="form-control" id="name" >
		  </div>
		    <div class="form-group">
			    <label for="description">商品描述</label>
			    <input type="text" name="description" class="form-control" id="description" >
		    </div>
        <div class="form-group">
			    <label for="price">商品价格</label>
			    <input type="text" name="price" class="form-control" id="price" >
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


<div class="modal fade" id="drop" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除商品</h4>
      </div> 
     
      <div class="modal-body">
      <form id="dropForm"> 
       	<input type="hidden" id="deleteId"  class="form-control" name="id" > 
		  <div class="form-group">
			    <label for="name">确定删除</label>
		  </div>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="dropSubmitBtn">提交</button>
      </div>
    </div> 
  </div> 
</div>


<div class="modal fade" id="addGood" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">增加商品</h4>
      </div> 
     
      <div class="modal-body">
      <form id="addForm">
		  <div class="form-group">
			    <label for="name">商品名称</label>
			    <input type="text" name="name" class="form-control" id="name" >
		  </div>
		 
			<div class="form-group">
			    <label for="description">商品描述</label>
			    <input type="text" name="description" class="form-control" id="description" >
		    </div>
        <div class="form-group">
			    <label for="price">商品价格</label>
			    <input type="text" name="price" class="form-control" id="price" >
		  </div>
			<div class="form-group">
				<label for="categoryId">商品种类</label> 
				<select class="form-control" name="category" id="category">  
				 <c:forEach items="${clist}" var="category">
				<option value="${category.id}">${category.categoryName}</option>
				</c:forEach>
				</select> 
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
//商品详细信息
function goodDetails(id,name,description,price){
	$("#GoodsId").val(id);
	$("#name").val(name); 
	$("#description").val(description);
	$("#price").val(price);
	$("#goodDetails").modal('toggle');
}
$("#submitBtn").click(function(){  
	$.ajax({
		url:'${ctx}/UpdateGoodsServlet',
		//序列化表单
		data:$("#udpateForm").serialize(),
		type:'post',
		dataType:'text', 
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#goodDetails").modal('toggle');
				location.reload();
			}
			else{
				alert('修改失败')
			}
		}
		
	}); 	
}); 

//删除商品
function drop(id){
	$("#deleteId").val(id); 
	$("#drop").modal('toggle');
}
$("#dropSubmitBtn").click(function(){  
	$.ajax({
		url:'${ctx}/BackDropServlet',
		//序列化表单
		data:$("#dropForm").serialize(),
		type:'post',
		dataType:'text', 
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#drop").modal('toggle');
				location.reload();
			}
			else{
				alert('删除失败')
			}
		}
		
	}); 	
});


 //增加商品
$("#addSubmitBtn").click(function(){  
	$.ajax({
		url:'${ctx}/BackAddServlet',
		//序列化表单
		data:$("#addForm").serialize(),
		type:'post',
		dataType:'text', 
		success:function (data){
			console.log(data)
			if(data=='true'){
				$("#addGood").modal('toggle');
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

