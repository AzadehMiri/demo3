<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <title>Bank Management Application</title>
</head>
<body style="background-color: #FFFFE0;">
<h1>مدیریت اطلاعات تسهیلات اعطایی بانک به مشتریان</h1>
<h2>
    <a href="facilityType-insert">افزودن تسهیلات جدید</a>
    <a href="facilityType-list">لیست تسهیلات</a>
</h2>

<div style="margin-top:100px; margin-left:200px; height:50px;">
<table dir="rtl" style="margin-top: 0px;margin-left: 100px; ">
    <caption><h2> لیست تسهیلات</h2></caption>
    <tr>
        <th></th>
        <th>نام تسهیلات</th>
        <th>نرخ سود</th>
    </tr>
    <c:forEach var="facilityType" items="${facilities}">
        <tr>
            <td><c:out value="${facilityType.id}"/></td>
            <td><c:out value="${facilityType.name}"/></td>
            <td><c:out value="${facilityType.interestRate}"/></td>
        </tr>
    </c:forEach>
</table>

</div>

</body>
</html>