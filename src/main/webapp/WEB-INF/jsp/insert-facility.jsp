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
</head>
<body style="background-color: #FFFFE0; ">
<center>
    <h1>مدیریت تسهیلات مشتریان بانک</h1>
</center>
<div align="center">
    <form action="limitations-add" method="post" name="myForm"  onsubmit="return(validate());">
        </br>
        </br>
        </br>
        <table dir="rtl" align="center" style="vertical-align: center; margin-left:43%;">
            <caption>
                <h2>
                    افزودن تسهیلات
                </h2>
            </caption>
            <input type="hidden" name="id" value="<c:out value="${facilityType.id}"/>"/>
            <tr>
                <th>نام تسهیلات</th>
                <td>
                    <input type="text" name="name"
                           value="<c:out value="${facilityType.name}"/>"/>
                </td>
            </tr>
            <tr>
                <th>نرخ سود</th>
                <td>
                    <input type="text"  name="interestRate" id="outputPercentage"
                           value="<c:out value="${facilityType.interestRate}"/>"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="صفحه بعد"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script type="text/javascript">
    function validate() {
        var outputPercentageString = document.myForm.outputPercentage.value;
        var outputPercentage = parseInt(outputPercentageString);
        if (outputPercentage <= 0 || outputPercentage >= 100) {
            alert("لطفا درصد را به صورت صحیح وارد کنید");
            document.myForm.outputPercentage.focus();
            return false;
        }
    }
</script>
</html>