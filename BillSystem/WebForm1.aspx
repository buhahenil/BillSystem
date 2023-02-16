<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div>
            <div id="Customer" align="center">
                <h3>-: Customer :-</h3>
                <table id="tblForm1" border="1">
                    <tr>
                        <td>
                            <span id="lblFirstName">Customer Name</span>
                        </td>
                        <td>
                            <input type="text" id="cusFirstName" name="searchbox" required="" placeholder="Search Customer" />
                        </td>
                    </tr>
                </table>
            </div>
            <br />

            <div id="Item" align="center">
                <h3>-: Item :-</h3>
                <table width="50%" id="tblForm2" border="2">
                    <thead>
                        <tr>
                            <th>Item Code</th>
                            <th>Item Name</th>
                            <th>GST</th>
                            <th>Price</th>
                            <th>Price with GST</th>
                            <th>GST</th>
                            <th>Qty</th>
                            <th>Discount</th>
                            <th>Total GST</th>
                            <th>Total with GST and Discount</th>
                            <th>Delete</th>
                            <th>
                                <input type="button" id="addnewrow" value="Add New Row" />
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tblPage">
                        <tr id="Trow" class="d-none">
                            <td>
                                <input type="text" placeholder="Search Item Code" class="itemcode" onkeyup="ItemCode1()"/>
                            </td>

                            <td>
                                <input type="text" placeholder="Search Item Name" class="itemname" onkeyup="ItemName2()" />
                            </td>

                            <td>
                                <input type="number" id="gst" class="gst" name="GST1" onchange="calc(this)" />
                            </td>

                            <td>
                                <input type="number" id="price" class="price" name="Price" onchange="calc(this)" />
                            </td>

                            <td>
                                <input type="number" id="pricewithgst" name="Price with GST" readonly="readonly" />
                            </td>

                            <td>
                                <input type="number" id="priwithgst" placeholder="GST(Price with GST - Price)" name="GST(PricewithGST-Price)" readonly="readonly" />
                            </td>

                            <td>
                                <input type="number" id="qty" onchange="calc(this)" name="QTY" />
                            </td>

                            <td>
                                <input type="number" id="discount" class="discount" name="Discount" onchange="calc(this)" />
                            </td>

                            <td>
                                <input type="number" id="totalgst" class="gstTotal" name="Total GST" readonly="readonly" />
                            </td>

                            <td>
                                <input type="number" id="totalwithgstanddiscount" class="total" name="Total with GST and Discount" readonly="readonly" />
                            </td>

                            <td>
                                <button type="button" id="rowdelete" name="Delete">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot id="Tfoot">
                        <tr>
                            <td>
                                <span id="lblTotol">Total</span>
                            </td>
                            <td>
                                <input type="text" id="txtTotal" name="Total" placeholder="Total Amount" readonly="readonly" onchange="calc(this)" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <span id="lblAdjustment">Adjustment Discount Type</span>
                            </td>
                            <td>
                                <input type="text" id="txtAdjustmentType" name="AdjustmentDiscountType" placeholder="Adjustment Discount Type" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span id="lblAdjustmentDiscount">Adjustment Discount</span>
                            </td>
                            <td>
                                <input type="text" id="txtAdjDiscount" name="AdjustmentDiscount" placeholder="Adjustment Discount" onchange="calc(this)" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <span id="lblGSTAmount">GST Amount</span>
                            </td>
                            <td>
                                <input type="text" id="txtGSTAmount" name="GSTAmount" placeholder="GST Amount" />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <span id="lblBillableAmount">Billable Amount</span>
                            </td>
                            <td>
                                <input type="text" id="txtBillableAmount" name="BillableAmount" placeholder="Billable Amount" onchange="calc(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="payment">Customer Payment Method  </label>
                            </td>
                            <td colspan="12" style="text-align: center; align-items: center; align-content: center; align-self: center;">
                                <input id="cblPayment_1" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Cash" />Cash
                            <input id="cblPayment_2" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Net Banking" />Net Banking
                            <input id="cblPayment_3" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Cheak" />Cheak
                            <input id="cblPayment_4" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="UPI" />UPI
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="12" style="text-align: center; align-items: center; align-content: center; align-self: center;">
                                <input type="submit" id="btnSubmit" value="Submit" />
                            </td>
                        </tr>

                    </tfoot>
                </table>
            </div>
        </div>
    </form>
</body>
<script src="Scripts/jquery-3.6.3.js"></script>
<script src="Scripts/jquery-ui-1.13.2.js"></script>
<script src="Scripts/jquery-ui-1.13.2.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#cusFirstName").autocomplete({
            minLength: 3,
            autoFocus: true,
            delay: 0,
            source: function (request, responce) {
                $.ajax({
                    url: '/Customer.asmx/GetCustomer',
                    method: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ CustomerFirstName: request.term }),
                    dataType: 'json',
                    success: function (data) {
                        debugger;
                        responce(data.d);
                    },
                    error: function (err) {
                        debugger;
                        alert(err);
                    }
                });
            }

        });
        
        //add button click than row AND delete
        //var rowCount = 0;
        //$('#addnewrow').on('click', function () {
        //    rowCount++;
        //    $('#tblPage').append(" <tr id='Newrow" + rowCount + "' /*class='d-none'*/> <td><input type='text' id='itemcode" + rowCount + "' placeholder='Search Item Code' class='itemcode' onkeyup='ItemCode1()' for='" + rowCount + "'/></td> <td><input type='text' id='itemname" + rowCount + "' placeholder='Search Item Name' class='itemname' onkeyup='ItemName2()' for='" + rowCount + "'/></td> <td><input type='number' id='gst" + rowCount + "' class='gst' name='GST1' onchange='calc(this)' for='" + rowCount + "'/></td> <td><input type='number' id='price" + rowCount + "' class='price' name='Price' onchange='calc(this)' for='" + rowCount + "'/></td> <td><input type='number' id='pricewithgst" + rowCount + "' name='Price with GST' readonly='readonly' for='" + rowCount + "'/></td> <td><input type='number' id='priwithgst" + rowCount + "' placeholder='GST(Price with GST - Price)' name='GST(PricewithGST-Price)' readonly='readonly' for='" + rowCount + "'/></td> <td><input type='number' id='qty" + rowCount + "' onchange='calc(this)' name='QTY' for='" + rowCount + "'/></td> <td><input type='number' id='discount" + rowCount + "' class='discount' name='Discount' onchange='calc(this)' for='" + rowCount + "'/></td><td><input type='number' id='totalgst" + rowCount + "' class='gstTotal' name='Total GST' readonly='readonly' for='" + rowCount + "'/></td> <td><input type='number' id='totalwithgstanddiscount" + rowCount + "' class='total' name='Total with GST and Discount' readonly='readonly' for='" + rowCount + "'/></td> <td><input type='button' name='remove' id='" + rowCount + "' class='btn_remove' value='Delete'/></td></tr>");
        //    console.log(rowCount);
        //    ItemCode1();
        //    ItemName2();
        //});
        //$('#tblPage').on('click', '.btn_remove', function () {
        //    var button_id = $(this).attr('id');
        //    console.log(button_id);
        //    $('#Newrow' + button_id + '').remove();
        //    calc(this);
        //}); 

        //Add New Row
        $('#addnewrow').click(function () {
            var row = $("#Trow").clone().appendTo("#tblPage");
            $(row).find("input").val('');
            $(row).removeClass('d-none');
            ItemCode1();
            ItemName2();
        });  

        // Row Delete

        $('tbody').on('click', '#rowdelete', function () {
            $(this).parent().parent().remove();
            calc(this);
        });

    });
    function calc(v) {

        var $row = $(v).closest('tr');

        var GST = parseFloat($row.find('[name="GST1"]').val());
        var Price = parseFloat($row.find('[name="Price"]').val());
        var Qty = parseFloat($row.find('[name="QTY"]').val());
        var Discount = parseFloat($row.find('[name="Discount"]').val());

        if (!isNaN(GST) && !isNaN(Price) && !isNaN(Qty) && !isNaN(Discount)) {
            var Price_with_GST = Price + (Price * GST) / 100;
            $row.find('[name="Price with GST"]').val(Price_with_GST.toFixed(2));

            var GST2 = Price_with_GST - Price;
            $row.find('[name="GST(PricewithGST-Price)"]').val(GST2.toFixed(2));

            var TotalGST = GST2 * Qty;
            $row.find('[name="Total GST"]').val(TotalGST.toFixed(2));

            var Total_with_GST_and_Discount = Price_with_GST * Qty - (Price_with_GST * Qty * (Discount / 100));
            $row.find('[name="Total with GST and Discount"]').val(Total_with_GST_and_Discount.toFixed(4));

        }
        //tfoot sum
        // total
        var sum = 0.0000;
        $('.total').each(function () {
            var value = parseFloat($(this).val());
            if (!isNaN(value))
                sum += value;
        });
        $("#txtTotal").val(sum.toFixed(2));

        // GST Total
        var gstSum = 0.00
        $('.gstTotal').each(function () {
            var value = parseFloat($(this).val());
            if (!isNaN(value))
                gstSum += value;
        });
        $("#txtGSTAmount").val(gstSum.toFixed(2));

        // Adjustment Discount
        var Total = $('#txtTotal').val();
        var AdjustmentDiscount = $('#txtAdjDiscount').val();
        var Bill = (Total - AdjustmentDiscount);
        $("#txtBillableAmount").val(Bill.toFixed(2));

        //ItemCode1();
        //ItemName2();
        /*var GST = parseFloat($(v).parent().parent().find("#gst").val());
        //console.log(gst);

        var Price = parseFloat($(v).parent().parent().find("#price").val());
        //console.log(Price);

        var Price_with_GST = Price + ((Price * GST) / 100);
        $(v).parent().parent().find("#pricewithgst").val(Price_with_GST.toFixed(2)); 
        //console.log(Price_with_GST);

        var GST2 = Price_with_GST - Price;
        $(v).parent().parent().find("#priwithgst").val(parseFloat(GST2).toFixed(2));
        //console.log(GST2);    

        var Qty = parseFloat($(v).parent().parent().find("#qty").val());
        //console.log(Qty);

        var Discount = parseFloat($(v).parent().parent().find("#discount").val());
        console.log(Discount);

        var TotalGST = GST2 * Qty;
        $(v).parent().parent().find("#totalgst").val(parseFloat(TotalGST).toFixed(2));

        var Total_with_GST_and_Discount = Price_with_GST * Qty - (Price_with_GST * Qty * (Discount/100));
        $(v).parent().parent().find("#totalwithgstanddiscount").val(parseFloat(Total_with_GST_and_Discount).toFixed(4));
        
        */
    };

    /*function ItemCode() {
        $('.itemcode').autocomplete({
            source: function (request, responce) {
                debugger;
                $.ajax({
                    url: '/Customer.asmx/Itemcode',
                    method: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ ItemCode: request.term } ),
                    dataType: 'json',
                    success: function (data) {
                        responce(data.d);
                        //debugger;
                    },
                    error: function (err) {
                        debugger;
                        alert(err);
                    }
                });
            },
        });
    }
    function ItemName() {
        $('.itemname').autocomplete({
            source: function (request, responce) {
                debugger;
                $.ajax({
                    url: '/Customer.asmx/Itemname',
                    method: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ ItemName: request.term }),
                    dataType: 'json',
                    success: function (data) {
                        responce(data.d);

                        //debugger;
                    },
                    error: function (err) {
                        debugger;
                        alert(err);
                    }
                });
            },
        });
    } */

    //-----------------------------------------------------
    function ItemCode1() {
        $(document).on('input', '.itemcode','.itemname' , function () {
            var input = $(this);
            //var endpoint = '/Customer.asmx/Itemcode1';
            //var $row = $(v).closest('tr');
            var itemName = input.val();
            var itemCode = input.val();
            $.ajax({
                url: '/Customer.asmx/Itemcode1',
                method: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ ItemName: itemName,ItemCode: itemCode }),
                dataType: 'json',
                success: function (data) {
                    var items = data.d;
                    input.autocomplete({
                        source: function (request, response) {
                            var filteredItems = items.filter(function (item) {
                                return (item.ItemCode.toLowerCase().indexOf(request.term.toLowerCase()) > -1 || item.ItemName.toLowerCase().indexOf(request.term.toLowerCase()) > -1);
                            }); 
                            //response(filteredItems);
                            console.log(filteredItems);
                            response($.map(filteredItems, function (item) {
                                return {
                                    label: item.ItemCode,
                                    value: item.ItemName,
                                    GST: item.GST,
                                    Price: item.Price,
                                    Discount: item.Discount
                                };
                            }));
                            //response(items);
                        },
                        select: function (event, ui) {
                            $('.itemcode').val(ui.item.label);
                            $('.itemname').val(ui.item.value);
                            $('.gst').val(ui.item.GST);
                            $('.price').val(ui.item.Price);
                            $('.discount').val(ui.item.Discount);
                            return false;
                        }
                    });
                },
                error: function (err) {
                    //console.error(err);
                    alert("An error occurred while trying to retrieve the item names.");
                }
            });
        });
    }

    function ItemName2() {
        $(document).on('input', '.itemname','.itemcode', function () {
            var input = $(this);
            //var endpoint = '/Customer.asmx/Itemcode1';
            var itemName = input.val();
            var itemCode = input.val();
            $.ajax({
                url: '/Customer.asmx/Itemcode1',
                method: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ ItemName: itemName,ItemCode: itemCode }),
                dataType: 'json',
                success: function (data) {
                    var items = data.d;
                    input.autocomplete({
                        source: function (request, response) {
                            var filteredItems = items.filter(function (item) {
                                return (item.ItemCode.toLowerCase().indexOf(request.term.toLowerCase()) > -1 || item.ItemName.toLowerCase().indexOf(request.term.toLowerCase()) > -1);
                            }); 
                            //response(filteredItems);
                            console.log(filteredItems);
                            response($.map(filteredItems, function (item) {
                                return {
                                    label: item.ItemName,
                                    value: item.ItemName,
                                    GST: item.GST,
                                    Price: item.Price,
                                    Discount: item.Discount,
                                    ItemCode: item.ItemCode
                                };
                            }));
                            //response(items);
                        },
                        select: function (event, ui) {
                            $('.itemcode').val(ui.item.ItemCode);
                            $('.itemname').val(ui.item.value);
                            $('.gst').val(ui.item.GST);
                            $('.price').val(ui.item.Price);
                            $('.discount').val(ui.item.Discount);
                            return false;
                        }
                    });
                },
                error: function (err) {
                    //console.error(err);
                    alert("An error occurred while trying to retrieve the item names.");
                }
            });
        });
    }
    //-----------------------------------------------------
</script>
</html>

<%-- https://makitweb.com/autocomplete-data-on-multiple-fields-with-jquery-and-ajax/ --%>
<%-- '<tr id='Trow' class='d-none'>' + '<td><input type="text" placeholder="Search Item Code" class="itemcode" onkeyup="ItemCode1()"/></td>' + '<td><input type="text" placeholder="Search Item Name" class="itemname" onkeyup="ItemName2()" /></td>' + '<td><input type="number" id="gst" class="gst" name="GST1" onchange="calc(this)" /></td>' + '<td><input type="number" id="price" class="price" name="Price" onchange="calc(this)" /></td>' + '<td><input type="number" id="pricewithgst" name="Price with GST" readonly="readonly" /></td>' + '<td><input type="number" id="priwithgst" placeholder="GST(Price with GST - Price)" name="GST(PricewithGST-Price)" readonly="readonly" /></td>' + '<td><input type="number" id="qty" onchange="calc(this)" name="QTY" /></td>' + '<td><input type="number" id="discount" class="discount" name="Discount" onchange="calc(this)" /></td>' + '<td><input type="number" id="totalgst" class="gstTotal" name="Total GST" readonly="readonly" /></td>' + '<td><input type="number" id="totalwithgstanddiscount" class="total" name="Total with GST and Discount" readonly="readonly" /></td>' + ' <td><button type="button" id="rowdelete" name="Delete">Delete</button></td>' + '</tr>' --%>