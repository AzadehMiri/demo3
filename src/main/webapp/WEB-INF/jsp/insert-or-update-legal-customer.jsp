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
        <a href="insert">Add New LegalCustomer</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="list">List All LegalCustomers</a>
    </h2>
</center>
<div align="center" style="margin-top:50px; margin-left:250px; height:50px;">
    <c:if test="${legalCustomer.id != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${legalCustomer.id == null}">
        <form action="add" method="post">
            </c:if>
            <table align="center" style="vertical-align: center; margin-left:20%;">
                <caption>
                    <h2>
                        <c:if test="${legalCustomer.id != null}">
                            Edit LegalCustomer
                        </c:if>
                        <c:if test="${legalCustomer.id == null}">
                            Add new LegalCustomer
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${legalCustomer != null}">
                    <input type="hidden" name="id" value="<c:out value="${legalCustomer.id}"/>"/>
                </c:if>
                <tr>
                    <th>company name</th>
                    <td>
                        <input type="text" name="firstName" size="45"
                               value="<c:out value="${legalCustomer.firstName}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>Registration Date</th>
                    <td>
                        <input type="text" name="birthDate" size="10" minlength="10"
                               maxlength="10" title="yyyy/yy/yy" value="<c:out value="${legalCustomer.birthDate}"/>"/>
                    </td>
                </tr>
                    <th>Economic Code</th>
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