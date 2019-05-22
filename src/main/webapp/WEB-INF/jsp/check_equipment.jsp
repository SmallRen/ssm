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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/laydate.css" media="all">
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
<a class="btn btn-success btn-sm"  data-toggle="modal" data-target="#add">增加</a>
<table class="table table-bordered" style="margin-top:10px">
	<tr>
	 <th>设备ID</th>
	 <th>设备编号</th>
	 <th>所在车间</th>
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
		<td>${equipment.workshop.workshopNumber}</td>
		<td>${equipment.model}</td>
		<td>${equipment.user.name}</td>
		<td>${equipment.orderDate}</td>
		<td>${equipment.exfactoryDate}</td>
		<td>
		<a class="btn btn-default btn-sm" onClick="eDetails('${equipment.equipmentId}','${equipment.enqipmentNumber}','${equipment.workshopId}','${equipment.model}','${equipment.userId}','${equipment.orderDate}','${equipment.exfactoryDate}')"  >修改</a>
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

<div class="modal fade" id="add" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">设备增加</h4>
			</div>

			<div class="modal-body">
				<form id="addForm">
					<div class="form-group">
						<label for="enqipmentNumber">设备编号</label>
						<input type="text" name="enqipmentNumber" class="form-control">
					</div>
					<div class="form-group">
						<label for="workshopId">所在车间</label>
						<select class="form-control" name="workshopId" >
							<c:forEach items="${workList}" var="obj">
								<option value="${obj.workshopId}">${obj.workshopNumber}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="model">机器型号</label>
						<input type="text" name="model" class="form-control" >
					</div>

					<div class="form-group">
						<label for="userId">负责人</label>
						<select class="form-control" name="userId">
							<c:forEach items="${userlist}" var="obj">
								<option value="${obj.id}">${obj.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="orderDate1">采购时间</label>
						<input type="text" id="orderDate1" class="form-control"  name="orderDate">
					</div>
					<div class="form-group">
						<label for="exfactoryDate1">出厂时间</label>
						<input type="text" id="exfactoryDate1" class="form-control"  name="exfactoryDate">
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

<%--设备修改--%>
<div class="modal fade" id="eDetails" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">设备修改</h4>
			</div>

			<div class="modal-body">
				<form id="udpateForm">
					<input type="hidden"  id="equipmentId" name="equipmentId">
					<div class="form-group">
						<label for="enqipmentNumber">设备编号</label>
						<input type="text" name="enqipmentNumber" class="form-control" id="enqipmentNumber">
					</div>
					<div class="form-group">
						<label for="workshopId">所在车间</label>
						<select class="form-control" name="workshopId" id="workshopId">
						<c:forEach items="${workList}" var="obj">
							<option value="${obj.workshopId}">${obj.workshopNumber}</option>
						</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="model">机器型号</label>
						<input type="text" name="model" class="form-control" id="model">
					</div>

					<div class="form-group">
						<label for="userId">负责人</label>
						<select class="form-control" name="userId" id="userId">
						<c:forEach items="${userlist}" var="obj">
							<option value="${obj.id}">${obj.name}</option>
						</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="orderDate">采购时间</label>
						<input type="text" id="orderDate" class="form-control"  name="orderDate">
					</div>
					<div class="form-group">
						<label for="exfactoryDate">出厂时间</label>
						<input type="text" id="exfactoryDate" class="form-control"  name="exfactoryDate">
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
</body>
<script src="${ctx}/js/laydate.js"></script>
<script>
	//删除设备
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

	//修改
	function eDetails(equipmentId, enqipmentNumber, workshopId, model, userId, orderDate, exfactoryDate) {
		$("#equipmentId").val(equipmentId);
		$("#enqipmentNumber").val(enqipmentNumber);
		$("#workshopId").val(workshopId);
		$("#model").val(model);
		$("#userId").val(userId);
		$("#orderDate").val(orderDate);
		$("#exfactoryDate").val(exfactoryDate);
		$("#eDetails").modal('toggle');
	}

	$("#submitBtn").click(function () {
		$.ajax({
			url: '${ctx}/equipment/update',
			//序列化表单
			data: $("#udpateForm").serialize(),
			type: 'POST',
			dataType: 'text',
			success: function (data) {
				console.log(data)
				if (data == 'true') {
					$("#eDetails").modal('toggle');
					location.reload();
				} else {
					alert('修改失败')
				}
			}

		});
	});

	//增加
	$("#addSubmitBtn").click(function () {
		$.ajax({
			url: '${ctx}/equipment/insert',
			//序列化表单
			data: $("#addForm").serialize(),
			type: 'post',
			dataType: 'text',
			success: function (data) {
				console.log(data)
				if (data == 'true') {
					$("#add").modal('toggle');
					location.reload();
				} else {
					alert('增加失败')
				}
			}

		});
	});


	//执行一个laydate实例
	laydate.render({
		elem: '#orderDate' //指定元素exfactoryDate
	});
	//执行一个laydate实例
	laydate.render({
		elem: '#exfactoryDate' //指定元素exfactoryDate
	});
	laydate.render({
		elem: '#orderDate1' //指定元素exfactoryDate
	});
	//执行一个laydate实例
	laydate.render({
		elem: '#exfactoryDate1' //指定元素exfactoryDate
	});
</script>
</html>

