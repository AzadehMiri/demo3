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
        td, th {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 8px;
        }
    </style>
</head>
<body style="background-color: #FFFFE0; ">

<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-8">
            <div>
                <div class="form-group">
                    <div class="text-right">
                        <label for="customerNumber"> شماره مشتری </label>
                    </div>
                    <div>
                        <input class="form-control" type="text" id="customerNumber" name="customerNumber" dir="rtl">
                    </div>
                </div>

                <div class="form-group text-right">
                    <input type="button" class="btn btn-primary" value="بازیابی" onclick="sample1()"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row justify-content-center mt-5">
        <div class="col-8">
            <div class="form-group">
                <div class="text-right">
                    <label for="customerId">
                        شماره مشتری
                    </label>
                </div>
                <div>
                    <input class="form-control" type="text" readonly value="${realCustomer.customerNumber}" dir="rtl"
                           id="customerId">
                </div>
            </div>

            <div class="form-group">
                <div class="text-right">
                    <label for="firstName">
                        نام
                    </label>
                </div>
                <div>
                    <input class="form-control" type="text" readonly value="${realCustomer.firstName}" dir="rtl"
                           id="firstName">
                </div>
            </div>

            <div class="form-group">
                <div class="text-right">
                    <label for="lastName">
                        نام خانوادگی
                    </label>
                </div>
                <div>
                    <input class="form-control" type="text" readonly value="${realCustomer.lastName}" dir="rtl"
                           id="lastName">
                </div>
            </div>

            <div class="form-group">
                <div>
                    <div class="text-right">
                        <label for="facilityId">
                            انتخاب طرح
                        </label>
                    </div>
                    <div>
                        <select class="form-control" name="facilityName" id="facilityId">
                            <option name="facilityType">انتخاب کنید</option>
                            <c:forEach items="${facilityTypeList}" var="facilityType">
                                <option name="facilityType" value="${facilityType.id}">${facilityType.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <div class="text-right">
                            <label for="contractAmount">
                                مبلغ وام درخواستی (تومان)
                            </label>
                        </div>
                        <div>
                            <input class="form-control" type="text" value="${contractAmount}" dir="rtl"
                                   id="contractAmount" onkeyup="fixPrice()">
                            <b id="contractAmountResult"></b>
                        </div>
                    </div>

                    <div>
                        <div class="text-right">
                            <label for="contractPeriod">
                                مدت وام درخواستی (ماه)
                            </label>
                        </div>
                        <div>
                            <input class="form-control" type="text" value="${contractPeriod}" dir="rtl"
                                   id="contractPeriod">
                        </div>
                    </div>

                    <div class="form-group text-right">
                        <input type="button" class="btn btn-primary" value="ارسال" onclick="sample()"/>
                    </div>
                </div>
            </div>
        </div>

    </div>


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
                <a href="/realCustomer/get-facility" class="btn btn-primary">بازگشت</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function sample() {
        var customerId = document.getElementById("customerId").value;
        var facilityId = document.getElementById("facilityId").value;
        var contractAmount = document.getElementById("contractAmount").value;
        var contractPeriod = document.getElementById("contractPeriod").value;
        $.ajax({
            url: "/test/get-facilityType-for-customer/" + customerId + "/" + facilityId + "/" + contractAmount + "/" + contractPeriod,
            data: {},
            method: "post",
            success: function (result) {
                const showData = document.getElementById("showData");
                if (showData) {
                    if (result.status) {
                        showData.innerHTML = '<span class="text-success">' + result.data + '</span>';
                    } else {
                        showData.innerHTML = '<span class="text-danger">' + result.data + '</span>';
                    }
                }
                startModal();
            }
        });
    }

    function sample1() {
        var customerNumber = document.getElementById("customerNumber").value;
        $.ajax({
            url: "/test/find-by-customer-number/" + customerNumber,
            data: {},
            method: "post",
            success: function (result) {
                const showData = document.getElementById("showData");
                if (showData) {
                    if (result.status === 'موجود') {
                        getCustomerData();
                    } else {
                        showData.innerHTML = '<span class="text-danger">' + result.status + '</span>';
                        startModal();
                    }
                }

            }
        });
    }

    function getCustomerData() {
        var form = $('<form></form>');

        var customerNumber = document.getElementById("customerNumber").value;

        form.attr("method", "post");
        form.attr("action", "http://localhost:8083/realCustomer/find-by-customer-number/");

        var field1 = $('<input></input>');
        field1.attr("type", "hidden");
        field1.attr("name", "customerNumber");
        field1.attr("value", customerNumber);
        form.append(field1);

        // The form needs to be a part of the document in
        // order for us to be able to submit it.
        $(document.body).append(form);
        form.submit();
    }

    function startModal() {
        $("#btnShowModal").click();
    }

    function OnSubmitForm() {
        var customerId = document.getElementById("customerId").value;
        var facilityId = document.getElementById("facilityId").value;
        var contractAmount = document.getElementById("contractAmount").value;
        var contractPeriod = document.getElementById("contractPeriod").value;
        document.customerForm.action = "/test/get-facilityType-for-customer/" + customerId + "/" + facilityId + "/" + contractAmount + "/" + contractPeriod;
    }

    function fixPrice() {
        var contractAmount = document.getElementById("contractAmount");
        var contractAmountResult = document.getElementById("contractAmountResult");
        let x = contractAmount.value;
        let y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        contractAmountResult.innerText = y;
    }
</script>
</body>
</html>