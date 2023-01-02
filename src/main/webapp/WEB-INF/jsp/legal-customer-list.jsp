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
        <a href="legal-customer-insert">افزودن مشتری</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="legal-customer-list">لیست مشتری حقوقی</a>

        </br>
        </br>
        </br>

    </h2>
    <hr>
    <form action="legal-customer-search" method="post">
        <table class="search" align="center" dir="rtl" style="vertical-align: center; margin-left:30%;">
            <caption>
                <h2>
                    جستجوی پیشرفته
                </h2>
            </caption>
            <tr>
                <th>نام شرکت</th>
                <td>
                    <input type="text" name="firstName" size="45"
                           value="<c:out value="${legalCustomer.firstName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>تاریخ ثبت نام</th>
                <td>
                    <input type="text" name="birthDate" size="10" minlength="10"
                           maxlength="10" title="yyyy/yy/yy" value="<c:out value="${legalCustomer.birthDate}"/>"/>
                </td>
            </tr>
            <th>کد تقتصادی</th>
            <td>
                <input type="text" name="nationalId"
                       value="<c:out value="${legalCustomer.nationalId}"/>"/>
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
            <th>نام شرکت</th>
            <th>تاریخ ثبت نام</th>
            <th>کد اقتصادی</th>
            <th>شماره مشتری</th>
            <th>نوع مشتری</th>
            <th>عملیات</th>
        </tr>
        <c:forEach var="legalCustomer" items="${legalCustomers}">
            <tr>
                <td><c:out value="${legalCustomer.id}"/></td>
                <td><c:out value="${legalCustomer.firstName}"/></td>
                <td><c:out value="${legalCustomer.birthDate}"/></td>
                <td><c:out value="${legalCustomer.nationalId}"/></td>
                <td><c:out value="${legalCustomer.customerNumber}"/></td>
                <td>مشتری حقوقی</td>
                <td>
                    <a  href="legal-customer-edit?id=<c:out value='${legalCustomer.id}'/>">ویرایش</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="legal-customer-delete?id=<c:out value='${legalCustomer.id}'/>">حذف</a>
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