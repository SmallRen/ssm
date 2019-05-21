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
    <title>查询所有车间</title>
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
        <th>设备ID</th>
        <th>设备编号</th>
        <th>操作</th>
    </tr>

    <c:forEach items="${list}" var="workshop" >
        <tr>
            <td>${workshop.workshopId}</td>
            <td>${workshop.workshopNumber}</td>
            <td>
                    <%--<a class="btn btn-default btn-sm" onclick="goodDetails('${goods.id}','${goods.name}','${goods.description}','${goods.price}')"  >修改</a>--%>
                <a class="btn btn-danger btn-sm" onClick="deleteWorkshop('${workshop.workshopId}')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%--车间增加--%>
<div class="modal fade" id="add" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">车间增加</h4>
            </div>
            <div class="modal-body">
                <form id="addForm">
                    <div class="form-group">
                        <label for="workshopNumber">车间号</label>
                        <input type="text" name="workshopNumber" class="form-control" id="workshopNumber" >
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


<%--删除车间--%>
<div class="modal fade" id="deleteWorkshop" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除车间</h4>
            </div>

            <div class="modal-body">
                <form id="deleteForm">
                    <input type="hidden" id="delete"  class="form-control" name="workshopId" >
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


</body>
<script>
    $("#addSubmitBtn").click(function(){
        $.ajax({
            url:'${ctx}/workshop/insert',
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
//删除
    function deleteWorkshop(workshopId){
        $("#delete").val(workshopId);
        $("#deleteWorkshop").modal('toggle');
    }
    $("#deleteBtn").click(function(){
        $.ajax({
            url:'${ctx}/workshop/delete',
            //序列化表单
            data:$("#deleteForm").serialize(),
            type:'post',
            dataType:'TEXT',
            success:function (data){
                console.log(data)
                if(data=='true'){
                    $("#deleteWorkshop").modal('toggle');
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

