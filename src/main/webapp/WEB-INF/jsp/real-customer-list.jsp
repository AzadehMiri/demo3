<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>

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
        .search {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 40%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 8px;
        }
    </style>
</head>
<body  style="background-color: #FFFFE0;">
<center>
<h1>مدیریت اطلاعات مشتریان بانک</h1>
<h2>
    <a href="real-customer-insert">افزودن مشتری</a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="real-customer-list">لیست مشتری حقیقی</a>

    </br>
    </br>
    </br>

</h2>
    <hr>
 <form action="real-customer-search" method="post">
        <table class="search" align="center" dir="rtl" style="vertical-align: center; margin-left:30%;">
            <caption>
                <h2>
                    جستجوی پیشرفته
                </h2>
            </caption>
            <tr>
                <th>نام</th>
                <td>
                    <input type="text" name="firstName" size="45"
                           value="<c:out value="${realCustomer.firstName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>نام خانوادگی</th>
                <td>
                    <input type="text" name="lastName" size="45"
                           value="<c:out value="${realCustomer.lastName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>شماره مشتری</th>
                <td>
                    <input type="text" name="customerNumber" size="45"
                           value="<c:out value="${realCustomer.customerNumber}"/>"/>
                </td>
            </tr>
            <tr>
                <th>کد ملی</th>
                <td>
                    <input type="text" name="nationalId" size="45"
                           value="<c:out value="${realCustomer.nationalId}"/>"/>

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="search"/>
                </td>
            </tr>
        </table>
 </form>
</center>

<div style="margin-top:50px; margin-left:100px; height:50px;">
    <table class="list" dir="rtl" style="margin-top: 0px;margin-left: 100px; ">
        <caption><h2>لیست مشتری</h2></caption>
        <tr>
            <th> </th>
            <th>نام</th>
            <th>نام خانوادگی</th>
            <th>نام پدر</th>
            <th>تاریخ تولد</th>
            <th>کدملی</th>
            <th>شماره مشتری</th>
            <th>نوع مشتری</th>
            <th>عملیات</th>
        </tr>
        <c:forEach var="realCustomer" items="${realCustomers}">
            <tr>
                <td><c:out value="${realCustomer.id}"/></td>
                <td><c:out value="${realCustomer.firstName}"/></td>
                <td><c:out value="${realCustomer.lastName}"/></td>
                <td><c:out value="${realCustomer.fatherName}"/></td>
                <td><c:out value="${realCustomer.birthDate}"/></td>
                <td><c:out value="${realCustomer.nationalId}"/></td>
                <td><c:out value="${realCustomer.customerNumber}"/></td>
                <td>مشتری حقیقی</td>
                <td>
                    <a  href="real-customer-edit?id=<c:out value='${realCustomer.id}'/>">ویرایش</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="real-customer-delete?id=<c:out value='${realCustomer.id}'/>">حذف</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <h3>
        <a href="/realCustomer/welcome">صفحه اصلی</a>
    </h3>
</div>
</body>
</html>