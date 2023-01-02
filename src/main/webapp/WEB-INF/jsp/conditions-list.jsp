<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <title>Bank Management Application</title>
    <style>
        .list {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 80%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 8px;
        }
    </style>

</head>
<body style="background-color: #FFFFE0; ">
<center>
    <h1>شروط تسهیلات</h1>
    <h2>
        <a href="condition-insert">افزودن شرط</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="condition-list">لیست شروط</a>

        </br>
        </br>
        </br>

    </h2>
<div style="margin-top:50px; margin-left:100px; height:50px;">
    <table class="list" dir="rtl" style="margin-top: 0px;margin-left: 100px; ">
        <caption><h2>لیست شرط ها</h2></caption>
        <tr>
            <th> </th>
            <th>نام شرط</th>
            <th>حداقل مدت</th>
            <th>حداکثر مدت</th>
            <th>حداقل مبلغ</th>
            <th>حداکثر مبلغ</th>
            <th>عملیات</th>
        </tr>
        <c:forEach var="limitation" items="${limitations}">
            <tr>
                <td><c:out value="${limitation.id}"/></td>
                <td><c:out value="${limitation.limitationName}"/></td>
                <td><c:out value="${limitation.MinimumContractPeriod}"/></td>
                <td><c:out value="${limitation.MaximumContractPeriod}"/></td>
                <td><c:out value="${limitation.MinimumContractAmount}"/></td>
                <td><c:out value="${limitation.MaximumContractAmount}"/></td>
                <td>
                    <a  href="condition-edit?id=<c:out value='${limitation.id}'/>">ویرایش</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="condition-delete?id=<c:out value='${limitation.id}'/>">حذف</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>