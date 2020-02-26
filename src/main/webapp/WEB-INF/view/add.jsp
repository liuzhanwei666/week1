<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<LINK href="/resource/css/css.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function add() {
		var can=$("form").serialize();
		$.post("/add",can,function(flag){
			if(flag){
				alert("成功")
				location="/list";
			}else{
				alert("失败")
			}
		},"json")
	}
</script>
</head>
<body>
<form action="" enctype="multipart/form-data">
	<table>
		<tr>
			<td>商品名称</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>英文名称</td>
			<td><input type="text" name="ename"></td>
		</tr>
		<tr>
			<td>商品品牌</td>
			<td>
			<select name="bid">
				<c:forEach items="${bb }" var="b">
					<option  value="${b.bid }">${b.bname }</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>商品种类</td>
			<td>
			<select name="tid">
				<c:forEach items="${list }" var="t">
					<option  value="${t.tid }">${t.tname }</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>尺寸</td>
			<td><input type="text" name="cc"></td>
		</tr>
		<tr>
			<td>单价</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>数量</td>
			<td><input type="text" name="num"></td>
		</tr>
		<tr>
			<td>标签</td>
			<td><input type="text" name="bq"></td>
		</tr>
		<tr>
			<td>商品图片</td>
			<td>
				<input type="file" name="pic">
			</td>
		</tr>
		<tr>
			<td colspan="10">
				<input type="button" value="提交" onclick="add()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>