<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
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
                alert("لطفا نام را وارد کنید");
                return false;
            }
        }

        function validateLastNameForm() {
            let y = document.forms["myForm"]["lname"].value;
            if (y == "") {
                alert("لطفا نام خانوادگی را وارد کنید");
                return false;
            }
        }

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background-color: #FFFFE0; ">
<center>
    <h1>مدیریت اطلاعات مشتریان بانک</h1>
    <h2>
        <a href="real-customer-insert">افزودن مشتری حقیقی</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="real-customer-list">لیست مشتریان</a>
    </h2>
</center>
<div align="center" style="margin-top:50px; margin-left:250px; height:50px;">
        <form action="real-customer-add" method="post" name="myForm" onsubmit="validateForm()">
            <table dir="rtl" align="center" style="vertical-align: center; margin-left:20%;">
                <caption>
                    <h2>
                           افزودن مشتری حقیقی
                    </h2>
                </caption>
                    <input type="hidden" name="id" value="<c:out value="${realCustomer.id}"/>"/>
                <tr>
                    <th>نام</th>
                    <td>
                        <input type="text" name="firstName" id="fname" onclick="return validateFirstNameForm()" size="45"
                               value="<c:out value="${realCustomer.firstName}"/>" />
                    </td>
                </tr>
                <tr>
                    <th>نام خانوادگی</th>
                    <td>
                        <input type="text" name="lastName" id="lname" onclick="return validateLastNameForm()" size="45"
                               value="<c:out value="${realCustomer.lastName}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>نام پدر</th>
                    <td>
                        <input type="text" name="fatherName" size="45"
                               value="<c:out value="${realCustomer.fatherName}"/>"/>
                    </td>
                </tr>
                <tr>
                    <th>تاریخ تولد</th>
                    <td>
                        <input type="text" name="birthDate" placeholder="yyyy/mm/dd" value="<c:out value="${realCustomer.birthDate}"/>"
                               size="10" min="1300/01/01" max="1420/01/01" title="yyyy/yy/yy" />
                    </td>
                </tr>
                <tr>
                    <th>کد ملی</th>
                    <td>
                        <input type="text" name="nationalId"
                               title="Please enter ten digits" oninput="validateNumberForm()" id="num" onkeypress="return isNumber(event)"
                               value="<c:out value="${realCustomer.nationalId}"/>" maxlength="10"/>

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
            <a href="/realCustomer/welcome">صفحه اصلی</a>
        </h3>
</div>
</body>
</html>