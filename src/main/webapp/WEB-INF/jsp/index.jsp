<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/back.css">
    <script src="${ctx}/bootstrap/js/bootstrap.min.js" ></script>
</head>
<body>
<div class="admin-body">
    <div class="admin-header">
        <div class="header-main">
            <a class="logo" href="">
                <img src="" alt="">我的后台
            </a>
            <ul class="header-nav">
                <li>
                    <a href="">admin</a>
                    <dl>
                        <dd><a href="">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="admin-side">
        <ul class="nav-three">
            <li >
                <span class="item-main">用户管理</span>
                <dl>
                    <dd><a  href="${ctx}/user/checkUser" target="iframe">查询所有用户</a></dd>
                    <dd><a href="javascript:;">增加用户</a></dd>
                    <dd><a href="javascript:;">删除用户</a></dd>
                    <dd><a href="javascript:;">修改用户信息</a></dd>
                </dl>
            </li>
            <li>
                <span class="item-main">设备管理</span>
                <dl>
                    <dd><a href="${ctx}/equipment/checkEquipment" target="iframe">查询所有设备</a></dd>
                    <dd><a href="javascript:;">增加设备</a></dd>
                    <dd><a href="javascript:;">删除设备</a></dd>
                    <dd><a href="javascript:;">修改设备信息</a></dd>
                </dl>
            </li>
            <li>
                <span class="item-main">车间管理</span>
                <dl>
                    <dd><a href="${ctx}/workshop/checkWorkshop" target="iframe">查询所有车间</a></dd>
                    <dd><a href="javascript:;">增加设备</a></dd>
                    <dd><a href="javascript:;">删除设备</a></dd>
                    <dd><a href="javascript:;">修改设备信息</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div class="admin-content" >
        <!---主要内容 -->
        <iframe id="iframe" name="iframe" src="./check_equipment.jsp" height="100%" style="border:1px solid red;width:100%;padding:10px;">

        </iframe>
    </div>
</div>

</body>

</html>
<script>
    $('.nav-three li').click(function(){
        //侧边栏打开与关闭
        if($(this).hasClass('nav-this')){
            $(this).removeClass('nav-this')
        }else{
            $(this).addClass('nav-this').siblings().removeClass('nav-this')
        }
    })


</script>