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
    <a href="insert">Add New RealCustomer</a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="list">List All RealCustomers</a>
    </br>
    </br>
    </br>
</h2>
    <hr>
 <form action="search" method="post">
        <table align="center" style="vertical-align: center; margin-left:20%;">
            <caption>
                <h2>
                    Search RealCustomer
                </h2>
            </caption>
            <tr>
                <th>first name</th>
                <td>
                    <input type="text" name="firstName" size="45"
                           value="<c:out value="${realCustomer.firstName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>last name</th>
                <td>
                    <input type="text" name="lastName" size="45"
                           value="<c:out value="${realCustomer.lastName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>customer number</th>
                <td>
                    <input type="text" name="customerNumber" size="45"
                           value="<c:out value="${realCustomer.customerNumber}"/>"/>
                </td>
            </tr>
            <tr>
                <th>national Id</th>
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
    <hr>
</center>
<div  style="margin-top:50px; margin-left:200px; height:50px;">
    <table style="margin-top: 0px;margin-left: 100px; ">
        <caption><h2>List of real customers</h2></caption>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Father Name</th>
            <th>Date of Birth</th>
            <th>National Id</th>
            <th>Customer Number</th>
            <th>Action</th>
        </tr>
        <c:forEach var="legalCustomer" items="${realCustomers}">
            <tr>
                <td><c:out value="${legalCustomer.id}"/></td>
                <td><c:out value="${legalCustomer.firstName}"/></td>
                <td><c:out value="${legalCustomer.lastName}"/></td>
                <td><c:out value="${legalCustomer.fatherName}"/></td>
                <td><c:out value="${legalCustomer.birthDate}"/></td>
                <td><c:out value="${legalCustomer.nationalId}"/></td>
                <td><c:out value="${legalCustomer.customerNumber}"/></td>
                <td>
                    <a  href="edit?id=<c:out value='${legalCustomer.id}'/>">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="delete?id=<c:out value='${legalCustomer.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <h3>
        <a href="/realCustomer/welcome">Go welcome</a>
    </h3>
</div>
</body>
</html>