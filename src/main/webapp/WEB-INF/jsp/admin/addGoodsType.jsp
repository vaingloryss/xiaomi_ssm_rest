<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<title>添加商品种类</title>
</head>
<body>
<div style="width:98%;margin-left: 1%;">
	<div class="panel panel-default">
		<div class="panel-heading">
			添加商品种类
		</div>
		<div class="panel-body">

            <form action="${pageContext.request.contextPath }/addGoodsType" method="post">
                <table>
                    <tr>
                        <td>种类名称：</td>
                        <td><input type="text" value="${goodsType.name}" name="name"></td>
                    </tr>
                    <tr>
                        <td>种类级别：</td>
                        <td><input type="text" value="${goodsType.level}" name="level"></td>
                    </tr>
                    <tr>
                        <td>父类别：</td>
                        <td><input type="text" value="${goods.parent}" name="parent"></td>
                    </tr>
                    <tr>
                        <td><button type="reset" class="btn btn-default">清空</button></td>
                        <td><button type="submit" class="btn btn-default">添加</button></td>
                    </tr>
                </table>
            </form>


			<%--<form action="${pageContext.request.contextPath }/addGoodsType" method="post">
				<div class="row">
					<div class="form-group form-inline">
						<span>所属种类</span>
						<select name="goodsParent">
							<option value="1">--请选择--</option>
							<c:forEach items="${goodsTypeList }" var="type">
								<c:if test="${type.level <=2}">
									<option value="${type.id }">${type.name }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-inline">
						<span>种类名称</span>
						<input type="text" name="typename" class="form-control" value="${goodsType.}">
					</div>
				</div>
				<div class="row">
					<div class="btn-group">
						<button type="reset" class="btn btn-default">清空</button>
						<button type="submit" class="btn btn-default">添加</button>
					</div>
				</div>
			</form>--%>
		</div>
	</div>
</div>
</body>
</html>