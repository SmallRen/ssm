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
	 <th>设备ID</th>
	 <th>设备编号</th>
	 <th>生产车间</th>
	 <th>机器型号</th>
	 <th>负责人</th>
	 <th>采购时间</th>
	 <th>出厂时间</th>
	 <th>操作</th>
	</tr>
	
	 <c:forEach items="${list}" var="equipment" >
	<tr>
		<td>${equipment.equipmentId}</td>
		<td>${equipment.enqipmentNumber}</td>
		<td>${equipment.workshopId}</td>
		<td>${equipment.model}</td>
		<td>${equipment.userId}</td>
		<td>${equipment.exfactoryDate}</td>
		<td>${equipment.exfactoryDate}</td>
		<td>
		<%--<a class="btn btn-default btn-sm" onclick="goodDetails('${goods.id}','${goods.name}','${goods.description}','${goods.price}')"  >修改</a>--%>
		<a class="btn btn-danger btn-sm" onClick="drop('${equipment.equipmentId}')">删除</a>
		</td>
	</tr>
	</c:forEach>
</table>
<%--设备删除--%>
<div class="modal fade" id="drop" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">删除设备</h4>
			</div>

			<div class="modal-body">
				<form id="dropForm">
					<input type="hidden" id="deleteId"  class="form-control" name="equipmentId" >
					<div class="form-group">
						<label >确定删除</label>
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
</body>
<script>
	//删除商品
	function drop(equipmentId){
		$("#deleteId").val(equipmentId);
		$("#drop").modal('toggle');
	}
	$("#dropSubmitBtn").click(function(){
		$.ajax({
			url:'${ctx}/equipment/delete',
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

</script>
</html>

