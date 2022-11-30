<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Bank Management Application</title>
    <style>
        td, th {
            font-family: arial, sans-serif;
        }
    </style>
</head>
<body style="background-color: #FFFFE0; ">
<center>
    <h1>Bank customer information management</h1>
    <h2>
        <a href="insert">Add New RealCustomer</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="list">List All RealCustomers</a>
    </h2>
</center>
<div align="center" style="margin-top:50px; margin-left:250px; height:50px;">
    <c:if test="${realCustomer.id != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${realCustomer.id == null}">
        <form action="add" method="post">
            </c:if>
            <table align="center" style="vertical-align: center; margin-left:20%;">
                <caption>
                    <h2>
                        <c:if test="${realCustomer.id != null}">
                            Edit RealCustomer
                        </c:if>
                        <c:if test="${realCustomer.id == null}">
                            Add new RealCustomer
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${realCustomer != null}">
                    <input type="hidden" name="id" value="<c:out value="${realCustomer.id}"/>"/>
                </c:if>
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
                    <th>father name</th>
                    <td>
                        <input type="text" name="fatherName" size="45"
                               value="<c:out value="${realCustomer.fatherName}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>birth of date</th>
                    <td>
                        <input type="text" name="birthDate" size="10" minlength="10"
                               maxlength="10" title="yyyy/yy/yy" value="<c:out value="${realCustomer.birthDate}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>national Id</th>
                    <td>
                        <input type="number" name="nationalId" size="10" min="1000000000" max="9999999999"
                               title="Please enter ten digits" required="required"
                               value="<c:out value="${realCustomer.nationalId}"/>"/>

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
                <a href="/realCustomer/welcome">Go welcome</a>
            </h3>
</div>
</body>
</html>