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
    نام تسهیلات:<input readonly type="text" value="<c:out value="${facilityType.name}"/>" dir="rtl">
    </br>
    </br>
    نرخ سود:<input readonly type="text" value="<c:out value="${facilityType.interestRate}"/>" dir="rtl" >
        <table dir="rtl" align="center" style="vertical-align: center; margin-left:43%;">
            <tr><th>نام شرط</th><td><input type="text" id="limitationName" /></td></tr>
            <tr><th>حداقل مدت</th><td><input type="text" id="minimumContractPeriod"/></td></tr>
            <tr><th>حداکثر مدت</th><td><input type="text" id="maximumContractPeriod"/></td></tr>
            <tr><th>حداقل مبلغ</th><td><input type="text" id="minimumContractAmount"/></td></tr>
            <tr><th>حداکثر مبلغ</th><td><input type="text" id="maximumContractAmount"/></td></tr>
            <tr><th></th><td><button onclick="addLimitation()">اضافه کردن</button></td></tr>

        </table>

<%--    <form action="facilityType-add" method="post">--%>
        <input type="hidden" id="facilityName" name="name" value="${facilityType.name}"/>
        <input type="hidden" id="facilityInterestRate" name="interestRate" value="${facilityType.interestRate}"/>

        <table class="list" id="tbl-limitations" dir="rtl" style="margin-top: 0px;margin-left: 100px; ">
            <caption><h2>لیست شروط </h2></caption>
            <tr>
                <th>ردیف</th>
                <th>نام شرط</th>
                <th>حداق مدت</th>
                <th>حداکثر مدت</th>
                <th>حداقل مبلغ</th>
                <th>حداکثر مبلغ</th>
                <%--<th>عملیات</th>--%>
            </tr>
        </table>
    <button onclick="sendDataToBack()">ارسال</button>
<%--        <input type="submit" value="ارسال"/>--%>
<%--    </form>--%>
</div>


</body>
<script type="text/javascript">
    var limitations = [];
    var tbl = $("#tbl-limitations");
    var index = 0;
    var facilityType = {};

    function addLimitation() {
        index++;
        let limitationName = "";
        let minimumContractPeriod = "";
        let maximumContractPeriod = "";
        let minimumContractAmount = "";
        let maximumContractAmount = "";

        limitationName = document.getElementById("limitationName").value;
        minimumContractPeriod = document.getElementById("minimumContractPeriod").value;
        maximumContractPeriod = document.getElementById("maximumContractPeriod").value;
        minimumContractAmount = document.getElementById("minimumContractAmount").value;
        maximumContractAmount = document.getElementById("maximumContractAmount").value;
        limitations.push({"limitationName" : limitationName,
            "minimumContractPeriod" : minimumContractPeriod,
            "maximumContractPeriod" : maximumContractPeriod,
            "minimumContractAmount" : minimumContractAmount,
            "maximumContractAmount" : maximumContractAmount,
        });
        console.log(limitations);

        var table = '<tr>';
        table += '<td>' + index + '</td>';
        table += '<td>' + limitationName + '</td>';
        table += '<td>' + minimumContractPeriod + '</td>';
        table += '<td>' + maximumContractPeriod + '</td>';
        table += '<td>' + minimumContractAmount + '</td>';
        table += '<td>' + maximumContractAmount + '</td>';
        table += '</tr>';

        tbl.append(table);

        resetInput();
        makeData();
    }

    function resetInput() {
        document.getElementById("limitationName").value = "";
        document.getElementById("minimumContractPeriod").value = "";
        document.getElementById("maximumContractPeriod").value = "";
        document.getElementById("minimumContractAmount").value = "";
        document.getElementById("maximumContractAmount").value = "";
    }

    function makeData() {
        let facilityName = "";
        let facilityInterestRate = "";
        facilityName = document.getElementById("facilityName").value;
        facilityInterestRate = document.getElementById("facilityInterestRate").value;
        facilityType.name = facilityName;
        facilityType.interestRate = facilityInterestRate;
        facilityType.limitations = limitations;
        console.log(facilityType);
        return facilityType;
    }

    function sendDataToBack() {
        $.ajax({
            type: "post",
            contentType: "application/json",
            url: "http://localhost:8083/facilityType/facilityType-add",
            data: JSON.stringify(facilityType)
        })
    }

</script>
</html>