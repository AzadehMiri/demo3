<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            font-family: arial, sans-serif;
        }
    </style>
</head>
<body style="background-color: #FFFFE0; ">
<center>
    <h1>مدیریت تسهیلات مشتریان بانک</h1>
</center>
<div align="center">
    <div>
        </br>
        </br>
        </br>
        <caption>
            <h4 align="center">
                افزودن تسهیلات
            </h4>
        </caption>
        <table dir="rtl" align="center" style="vertical-align: center; margin-left:43%;">

            <input type="hidden" name="id" value="<c:out value="${facilityType.id}"/>"/>
            <tr>
                <th>نام تسهیلات</th>
                <td>
                    <input type="text" id="name" name="name" onkeypress="validateFacilityNameForm()"
                           value="<c:out value="${facilityType.name}"/>" required=""
                           oninvalid="this.setCustomValidity('لطفا نام تسهیلات را وارد کنید')"
                           oninput="setCustomValidity('')"/>
                </td>
            </tr>
            <tr>
                <th>نرخ سود</th>
                <td>
                    <input type="text" name="interestRate" id="outputPercentage"
                           value="<c:out value="${facilityType.interestRate}"/>"
                           onkeypress="return isNumber(event)"
                           required="" maxlength="3"
                           oninvalid="this.setCustomValidity('لطفا نرخ سود را وارد کنید')"
                           onclick="setCustomValidity('')"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" class="btn btn-primary" value="صفحه بعد" onclick="sample1()"/>
                </td>
            </tr>
        </table>
    </div>
</div>

<button type="button" id="btnShowModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" hidden>
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-right" id="exampleModalLabel">نتیجه عملیات</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-right" id="showData" >

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">بستن</button>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }

    function sample1() {
        var facilityTypeName = document.getElementById("name").value;
        var facilityTypeInterestRate = document.getElementById("outputPercentage").value;
        if (facilityTypeInterestRate <= 0 || facilityTypeInterestRate >= 100) {
            alert("لطفا درصد را به صورت صحیح وارد کنید");
            return false;
        } else {
            $.ajax({
                url: "/test/limitations-add/" + facilityTypeName + "/" + facilityTypeInterestRate,
                data: {},
                method: "post",
                success: function (result) {
                    const showData = document.getElementById("showData");
                    if(showData){
                        if(result.status){
                            goToNextPage();
                        }else{
                            goToNextPage1();
                        }
                    }
                }
            });
        }
    }

    function goToNextPage() {
        var form = $('<form></form>');

        var facilityTypeName = document.getElementById("name").value;
        var facilityTypeInterestRate = document.getElementById("outputPercentage").value;

        form.attr("method", "post");
        form.attr("action", "http://localhost:8083/facilityType/limitations-add/");

        var field1 = $('<input></input>');
        field1.attr("type", "hidden");
        field1.attr("name", "name");
        field1.attr("value", facilityTypeName);
        form.append(field1);
        var field2 = $('<input></input>');
        field2.attr("type", "hidden");
        field2.attr("name", "interestRate");
        field2.attr("value", facilityTypeInterestRate);
        form.append(field2);

        // The form needs to be a part of the document in
        // order for us to be able to submit it.
        $(document.body).append(form);
        form.submit();
    }

    function goToNextPage1() {
        var form = $('<form></form>');

        var facilityTypeName = document.getElementById("name").value;
        var facilityTypeInterestRate = document.getElementById("outputPercentage").value;

        form.attr("method", "post");
        form.attr("action", "http://localhost:8083/facilityType/limitations-add/");

        var field1 = $('<input></input>');
        field1.attr("type", "hidden");
        field1.attr("name", "name");
        field1.attr("value", facilityTypeName);
        form.append(field1);
        var field2 = $('<input></input>');
        field2.attr("type", "hidden");
        field2.attr("name", "interestRate");
        field2.attr("value", facilityTypeInterestRate);
        form.append(field2);

        // The form needs to be a part of the document in
        // order for us to be able to submit it.
        $(document.body).append(form);
        form.submit();
    }

    function startModal(){
        $("#btnShowModal").click();
    }
</script>
</body>
</html>