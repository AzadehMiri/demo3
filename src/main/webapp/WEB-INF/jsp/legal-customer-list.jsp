<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Bank Management Application</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 60%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
    </style>
</head>
<body style="background-color: #FFFFE0;">
<center>
    <h1>Bank customer information management</h1>
    <h2>
        <a href="insert">Add New LegalCustomer</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="list">List All LegalCustomers</a>
        </br>
        </br>
        </br>
    </h2>
    <hr>
    <form action="search" method="post">
        <table align="center" style="vertical-align: center; margin-left:20%;">
            <caption>
                <h2>
                    Search LegalCustomer
                </h2>
            </caption>
            <tr>
                <th>Company Name</th>
                <td>
                    <input type="text" name="companyName" size="45"
                           value="<c:out value="${legalCustomer.firstName}"/>"/>
                </td>
            </tr>
                <th>Economic Code</th>
                <td>
                    <input type="text" name="economicCode" size="45"
                           value="<c:out value="${legalCustomer.nationalId}"/>"/>
                </td>
            </tr>
            <tr>
                <th>Customer Number</th>
                <td>
                    <input type="text" name="customerNumber" size="45"
                           value="<c:out value="${legalCustomer.customerNumber}"/>"/>

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="search"/>
                </td>
            </tr>
        </table>
    </form>
    <hr>
</center>
<div  style="margin-top:50px; margin-left:200px; height:50px;">
    <table style="margin-top: 0px;margin-left: 100px; ">
        <caption><h2>List of legal customers</h2></caption>
        <tr>
            <th>Id</th>
            <th>Company Name</th>
            <th>Registration Date</th>
            <th>Economic Code</th>
            <th>Customer Number</th>
            <th>Customer Type</th>
            <th>Action</th>
        </tr>
        <c:forEach var="legalCustomer" items="${legalCustomers}">
            <tr>
                <td><c:out value="${legalCustomer.id}"/></td>
                <td><c:out value="${legalCustomer.firstName}"/></td>
                <td><c:out value="${legalCustomer.birthDate}"/></td>
                <td><c:out value="${legalCustomer.nationalId}"/></td>
                <td><c:out value="${legalCustomer.customerNumber}"/></td>
                <td><c:out value="${legalCustomer.customerType}"/></td>
                <td>
                    <a  href="edit?id=<c:out value='${legalCustomer.id}'/>">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="delete?id=<c:out value='${legalCustomer.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <h3>
        <a href="/legalCustomer/welcome">Go welcome</a>
    </h3>
</div>
</body>
</html>