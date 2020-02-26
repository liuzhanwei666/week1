<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<LINK href="/resource/css/css.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function fenye(own) {
		$("[name=pageNum]").val(own);
		$("form").submit();
	}
	function toadd() {
		location="/toAdd";
	}
</script>
</head>
<body>
<form action="/list" method="post">
	<input type="hidden" name="pageNum">
	种类:<select name="tname">
			<option value="">请选择</option>
			<option value="手机">手机</option>
			<option value="电脑">电脑</option>
			<option value="电视">电视</option>
		</select>
	品牌:<select name="bname">
			<option value="">请选择</option>
			<option value="三星">三星</option>
			<option value="联想">联想</option>
			<option value="华硕">华硕</option>
		</select>
	单价范围:<input type="text" name="p1">-<input type="text" name="p2">
	<button>查询</button>
</form>
	<table>
		<tr>
			<td>商品编号</td>
			<td>商品名称</td>
			<td>尺寸</td>
			<td>价格</td>
			<td>数量</td>
			<td>种类</td>
			<td>品牌</td>
			<td>图片</td>
		</tr>
		<c:forEach items="${page.list }" var="l" varStatus="count">
			<tr>
				<td>${count.count+page.startRow-1 }</td>
				<td>${l.name }</td>
				<td>${l.cc }</td>
				<td>${l.price }</td>
				<td>${l.num }</td>
				<td>${l.tname }</td>
				<td>${l.bname }</td>
				<td><img alt="失败" src=""></td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="10">
				<button onclick="fenye(1)">首页</button>
				<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
				<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
				<button onclick="fenye(${page.pages})">尾页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				当前${page.pageNum }/${page.pages }页,共${page.total }条
				<button onclick="toadd()">添加</button>
			</td>
		</tr>
	</table>
</body>
</html>