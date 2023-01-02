<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <title>Bank Management Application</title>
    <style>
        .list {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 80%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 8px;
        }

        .insert {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 40%;
        }
    </style>
</head>
<body style="background-color: #FFFFE0; ">
<%--<center>
    <h1>شروط تسهیلات</h1>
    <h2>
        <a href="condition-insert">افزودن شرط</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="condition-list">لیست شروط</a>
    </h2>
</center>--%>
<%--<div align="center" style="margin-top:50px; margin-left:250px; height:50px;">
    <form action="facilityType-add">
        <c:out value="${facilityType.name}"/>
        <c:out value="${facilityType.interestRate}"/>
        <table class="insert" dir="rtl" align="center" style="vertical-align: center; margin-left:20%;">
            <caption>
                <h2>
                    افزودن شرط تسهیلات
                </h2>
            </caption>
            <tr>
                <th>نام شرط</th>
                <td>
                    <input type="text" name="limitationName" value="<c:out value="${limitation.limitationName}"/>"/>
                </td>
            </tr>
            <tr>
                <th>حداقل مدت</th>
                <td>
                    <input type="text" name="MinimumContractPeriod"
                           value="<c:out value="${limitation.MinimumContractPeriod}"/>"/>
                </td>
            </tr>
            <tr>
                <th>حداکثر مدت</th>
                <td>
                    <input type="text" name="MaximumContractPeriod"
                           value="<c:out value="${limitation.MaximumContractPeriod}"/>"/>
                </td>
            </tr>
            <tr>
                <th>حداقل مبلغ</th>
                <td>
                    <input type="text" name="MinimumContractAmount"
                           value="<c:out value="${limitation.MinimumContractAmount}"/>"/>
                </td>
            </tr>
            <tr>
                <th>حداکثر مبلغ</th>
                <td>
                    <input type="text" name="MaximumContractAmount"
                           value="<c:out value="${limitation.MaximumContractAmount}"/>"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" onclick="access()" value="save"/>
                </td>
            </tr>
        </table>
    </form>
</div>--%>



<div style="margin-top:50px; margin-left:100px; height:50px;">

    <form action="find-by-customer-number" method="post">
        شماره مشتری: <input type="text" id="customerNumber" name="customerNumber" dir="rtl">
        <input type="submit" value="بازیابی">
    </form>
    </br>
    </br>
    شماره مشتری: <input type="text" readonly value="${realCustomer.customerNumber}" dir="rtl">
    </br>
    نام: <input type="text" readonly value="${realCustomer.firstName}" dir="rtl">
    </br>
    نام خانوادگی: <input type="text" readonly value="${realCustomer.lastName}" dir="rtl">
    </br>
    </br>
    </br>
    <form name="customerform" method="post" onsubmit="OnSubmitForm();">
        انتخاب طرح:<select name="facilityName" id="facilityId">
            <option name="facilityType">انتخاب کنید</option>
            <c:forEach items="${facilityTypeList}" var="facilityType">
                <option name="facilityType" value="${facilityType.id}">${facilityType.name}</option>
            </c:forEach>
        </select>
        </br>
        <input type="text" id="customerId" hidden value="${realCustomer.id}" dir="rtl">
        مبلغ وام درخواستی: <input type="text" id="contractAmount" name="contractAmount"
                                  value="<c:out value="${contractAmount}"/>" dir="rtl">
        </br>
        مدت وام درخواستی: <input type="text" id="contractPeriod" name="contractPeriod"
                                 value="<c:out value="${contractPeriod}"/>" dir="rtl">

        <input type="submit" value="submit"/>
    </form>
<%--    </br>--%>
<%--    </br>--%>
<%--    <a href="get-facilityType-by-customer?customerId=<c:out value='${realCustomer.id}'/>&facilityId=<c:out value='${facilityType.id}'/>&contractAmount=<c:out value='${contractAmount}'/>?contractPeriod=<c:out value='${contractPeriod}'/>">ارسال درخواست</a>--%>
</div>





</body>
<script type="text/javascript">

    function OnSubmitForm()
    {
        var customerId = document.getElementById("customerId").value;
        var facilityId = document.getElementById("facilityId").value;
        var contractAmount = document.getElementById("contractAmount").value;
        var contractPeriod = document.getElementById("contractPeriod").value;
        document.customerform.action="/realCustomer/get-facilityType-for-customer/" + customerId + "/" + facilityId + "/" + contractAmount + "/" +contractPeriod;
    }

    /*function retrieval() {

        firstName = firstName;
        lastName = lastName;

        resetInput();
        sendData();
    }

    function sendData() {
        let facilityName = "";
        let facilityInterestRate = "";
        facilityName = document.getElementById("facilityName").value;
        facilityInterestRate = document.getElementById("facilityInterestRate").value;
        facilityType.name = facilityName;
        facilityType.interestRate = facilityInterestRate;
        facilityType.limitations = limitations;
        console.log(facilityType);
    }*/

</script>
</html>