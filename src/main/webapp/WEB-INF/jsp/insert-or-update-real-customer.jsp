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
    <script type="text/javascript">
        function validateForm() {
            let x = document.forms["myForm"]["fname"].value;
            let y = document.forms["myForm"]["lname"].value;
            let z = document.forms["myForm"]["num"].value;
            if (x == "") {
                alert("first name is required");
                return false;
            } else if (y == "") {
                alert("last name is required");
                return false;
            } else if (z == "") {
                alert("national code is required");
                return false;
            }
        }

        function validateFirstNameForm() {
            let x = document.forms["myForm"]["fname"].value;
            if (x == "") {
                alert("Please enter first name");
                return false;
            }
        }

        function validateLastNameForm() {
            let y = document.forms["myForm"]["lname"].value;
            if (y == "") {
                alert("Please enter last name");
                return false;
            }
        }

        function validateNumberForm() {
            var z = document.forms["myForm"]["num"].value;
            if (/\D/.test(z)) {
                alert("Please only enter numeric characters only for your nationalId! (Allowed input:0-9)");
                return false;
            }
        }

    </script>
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
    <form action="update" method="post" name="myForm" onsubmit="validateForm()">
        </c:if>
        <c:if test="${realCustomer.id == null}">
        <form action="add" method="post" name="myForm" onsubmit="validateForm()">
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
                        <input type="text" name="firstName" id="fname" onclick="return validateFirstNameForm()" size="45"
                               value="<c:out value="${realCustomer.firstName}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>last name</th>
                    <td>
                        <input type="text" name="lastName" id="lname" onclick="return validateLastNameForm()" size="45"
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
                        <input type="text" name="birthDate" placeholder="yyyy/mm/dd" value="<c:out value="${realCustomer.birthDate}"/>"
                               size="10" min="1300/01/01" max="1420/01/01" title="yyyy/yy/yy" />
                    </td>
                </tr>
                <tr>
                    <th>national Id</th>
                    <td>
                        <input type="text" name="nationalId"
                               title="Please enter ten digits" oninput="validateNumberForm()" id="num"
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