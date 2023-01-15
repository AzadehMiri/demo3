<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
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

        .container {
            width: 100px;

        }
    </style>
</head>
<body style="background-color: #FFFFE0; ">
<div style="margin-top:50px; height:50px;" dir="rtl">
    <table dir="rtl" align="center" style="vertical-align: center; margin-left:37%;">
        <tr>
            <th>نام تسهیلات</th>
            <td><input readonly type="text" value="<c:out value="${facilityType.name}"/>" dir="rtl"></td>
        </tr>
        <tr>
            <th>نرخ سود</th>
            <td><input readonly type="text" value="<c:out value="${facilityType.interestRate}"/>" dir="rtl"></td>
        </tr>
    </table>
    <br/>
    <br/>

    <table dir="rtl" align="center" style="vertical-align: center; margin-left:37%;">
        <tr>
            <th>نام شرط</th>
            <td><input type="text" id="limitationName"/></td>
        </tr>
        <tr>
            <th>حداقل مدت (ماه)</th>
            <td><input type="text" id="minimumContractPeriod"/></td>
        </tr>
        <tr>
            <th>حداکثر مدت (ماه)</th>
            <td><input type="text" id="maximumContractPeriod"/></td>
        </tr>
        <tr>
            <th>حداقل مبلغ</th>
            <td><input type="text" id="minimumContractAmount" onkeyup="fixPrice()"/>
                <br/>
                <b id="minimumContractAmountResult"></b>
            </td>
        </tr>
        <tr>
            <th>حداکثر مبلغ</th>
            <td><input type="text" id="maximumContractAmount" onkeyup="fixPrice()"/>
                <br/>
                <b id="maximumContractAmountResult"></b>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <button onclick="addLimitation()" class="btn btn-primary">اضافه کردن</button>
            </td>
        </tr>
    </table>

    <input type="hidden" id="facilityName" name="name" value="${facilityType.name}"/>
    <input type="hidden" id="facilityInterestRate" name="interestRate" value="${facilityType.interestRate}"/>
    <center>
        <caption><h2>لیست شروط </h2></caption>
        <table class="list table table-bordered table-striped" id="tbl-limitations" dir="rtl"
               style="margin-top: 0px;margin-left: 5px; ">
            <tr>
                <th>ردیف</th>
                <th>نام شرط</th>
                <th>حداق مدت</th>
                <th>حداکثر مدت</th>
                <th>حداقل مبلغ</th>
                <th>حداکثر مبلغ</th>
            </tr>
            <c:forEach var="limitation" items="${limitations}">
                <tr>
                    <td><c:out value="${limitation.id}"/></td>
                    <td><c:out value="${limitation.limitationName}"/></td>
                    <td><c:out value="${limitation.minimumContractPeriod}"/></td>
                    <td><c:out value="${limitation.maximumContractPeriod}"/></td>
                    <td><c:out value="${limitation.minimumContractAmount}"/></td>
                    <td><c:out value="${limitation.maximumContractAmount}"/></td>
                </tr>
            </c:forEach>
        </table>
    </center>
    <center>
        <div>
            <button class="btn btn-primary" onclick="sendDataToBack()">ارسال</button>
        </div>
    </center>

</div>

<button type="button" id="btnShowModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" hidden>
    Launch demo modal
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-right" id="exampleModalLabel">نتیجه عملیات</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-right" id="showData">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">بستن</button>
            </div>
        </div>
    </div>
</div>

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

        if (minimumContractPeriod >= maximumContractPeriod || minimumContractAmount >= maximumContractAmount) {
            const showData = document.getElementById("showData");
            if (minimumContractPeriod >= maximumContractPeriod) {
                if (showData) {
                    showData.innerHTML = '<span class="text-success">' + 'مقدار "حداکثر مدت" باید بیشتر از "حداقل مدت" باشد.' + '</span>';
                    startModal();
                }
            } else if (minimumContractAmount >= maximumContractAmount) {
                if (showData) {
                    showData.innerHTML = '<span class="text-success">' + 'مقدار "حداکثر مبلغ" باید بیشتر از "حداقل مبلغ" باشد.' + '</span>';
                    startModal();
                }
            }
            return;
        }

        limitations.push({
            "limitationName": limitationName,
            "minimumContractPeriod": minimumContractPeriod,
            "maximumContractPeriod": maximumContractPeriod,
            "minimumContractAmount": minimumContractAmount,
            "maximumContractAmount": maximumContractAmount,
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
            url: "http://localhost:8083/test/facilityType-add",
            data: JSON.stringify(facilityType),
            success: function (result) {
                const showData = document.getElementById("showData");
                if (showData) {
                    if (result.status) {
                        showData.innerHTML = '<span class="text-success">' + result.data + '</span>';
                        startModal();
                    }
                }

            }
        })
    }

    function startModal() {
        $("#btnShowModal").click();
    }

    function fixPrice() {
        var minimumContractAmount = document.getElementById("minimumContractAmount");
        var minimumContractAmountResult = document.getElementById("minimumContractAmountResult");
        var maximumContractAmount = document.getElementById("maximumContractAmount");
        var maximumContractAmountResult = document.getElementById("maximumContractAmountResult");
        let x = minimumContractAmount.value;
        let y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        minimumContractAmountResult.innerText = y;
        let x1 = maximumContractAmount.value;
        let y1 = x1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        maximumContractAmountResult.innerText = y1;
    }

</script>
</body>
</html>