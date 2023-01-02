<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Management Application</title>
    <style>
        td, th {
            font-family: arial, sans-serif;
        }
    </style>

</head>
<body dir="rtl" style="background-color: #FFFFE0; ">
<center>
    <h1>مدیریت اطلاعات مشتریان بانک</h1>
    <h2>
        <a href="legal-customer-insert">افزودن مشتری حقوقی</a>
        &nbsp;&nbsp;&nbsp;&nbsp;

        <a href="legal-customer-list">لیست مشتریان</a>
    </h2>
</center>
<div align="center" style="margin-top:50px; margin-left:250px; height:50px;">
<%--        <c:if test="${legalCustomer.id == null}">--%>
        <form action="legal-customer-add" method="post">
<%--            </c:if>--%>
            <table align="center" style="vertical-align: center; margin-left:20%;">
                <caption>
                    <h2>
                        <c:if test="${legalCustomer.id == null}">
                            افزودن مشتری حقوقی
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${legalCustomer != null}">
                    <input type="hidden" name="id" value="<c:out value="${legalCustomer.id}"/>"/>
                </c:if>
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
                    <th>کد اقتصادی</th>
                    <td>
                        <input type="text" name="nationalId"
                               value="<c:out value="${legalCustomer.nationalId}"/>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="save"/>
                    </td>
                </tr>
            </table>
        </form>
        <h3>
            <a href="/legalCustomer/welcome">Go welcome</a>
        </h3>
</div>
</body>
</html>