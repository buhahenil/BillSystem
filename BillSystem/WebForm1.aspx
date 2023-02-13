<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
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
                <table width="50%" id="tblForm2" border="2" >
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
                                <input type="text" placeholder="Search" class="itemcode" onkeyup="ItemName1()" />
                            </td>

                            <td>
                                <input type="text" placeholder="Search" class="itemname" onkeyup="ItemName1()"/>
                            </td>

                            <td>
                                <%--<select id="gst" onchange="calc(this)" name="GST1" class="gst">
                                    <option value="5">5%</option>
                                    <option value="12">12%</option>
                                    <option value="18">18%</option>
                                    <option value="28">28%</option>
                                </select>--%>
                                <input type="number" id="gst" class="gst" name="GST1" onchange="calc(this)"/>
                            </td>

                            <td>
                                <input type="number" id="price" class="price" name="Price" onchange="calc(this)"/>
                            </td>

                            <td>
                                <input type="number" id="pricewithgst" name="Price with GST" readonly="readonly"/>
                            </td>

                            <td>
                                <input type="number" id="priwithgst" placeholder="GST(Price with GST - Price)" name="GST(PricewithGST-Price)" readonly="readonly"/>
                            </td>

                            <td>
                                <input type="number" id="qty" onchange="calc(this)" name="QTY"/>
                            </td>

                            <td>
                                <input type="number" id="discount" class="discount" name="Discount" onchange="calc(this)"/>
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
                                <input type="text" id ="txtTotal" name="Total" placeholder="Total Amount" readonly="readonly" onchange="calc(this)"/>
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
                                <input type="text" id="txtAdjDiscount" name="AdjustmentDiscount" placeholder="Adjustment Discount" onchange="calc(this)"/>
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
                                <input type="text" id="txtBillableAmount" name="BillableAmount" placeholder="Billable Amount" onchange="calc(this)"/>
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
  
      $(document).ready(function (){
          $("#cusFirstName").autocomplete({
              minLength: 3,
              autoFocus: true,
              delay:0,
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
          ItemName1();
          //add button click than row AND delete
          /*var rowCount = 0;
          $('#addnewrow').on('click', function () {
              rowCount++;
              $('#tblPage').append("<tr id='Newrow" + rowCount + "'><td> <input type='text' placeholder='Search' id='itemcode' onkeyup='filterFunction()' /></td> <td><input type='text' placeholder='Search' id='itemname' onkeyup='filterFunction()'/></td>  <td><select id='gdt'>  <option value='5 % '>5%</option>  <option value='12 % '>12%</option> <option value='18 %'>18%</option>" + "<option value='28 % '>28%</option>" + "</select>" + "</td>" + "<td><input type='number' id='price' name='price' /></td>" + "<td><input type='number' id='pricewithgst' name='price'/></td> <td><input type='number' id='priwithgst' placeholder='GST(Price with GST - Price) ' /></td> <td> <input type='number' id='qty' name='qty' /></td>  <td><input type='number' id='discount' name='Discount' /></td> <td><input type='number' id='totalgst' name='Total GST' /></td> <td><input type='number' id='totalwithgstanddiscount' name='Total with GST and Discount' /></td><td><input type='button' name='remove' id='" + rowCount +"' class='btn_remove' value='Delete'/></td></tr>")
              console.log(rowCount);
          }); */

          //Add New Row
          $('#addnewrow').click(function () {
              var row = $("#Trow").clone().appendTo("#tblPage");
              $(row).find("input").val('');
              $(row).removeClass('d-none');
              //calculateSubTotal();
          }); 

          // Row Delete

          $('tbody').on('click', '#rowdelete', function () {
              $(this).parent().parent().remove();
              calc(this);
          }); 

          /*$('#tblPage').on('click', '.btn_remove', function () {
              var button_id = $(this).attr('id');
              console.log(button_id);
              $('#Newrow' + button_id + '').remove();
          });*/

          /*$('#addnewrow').click(function () {
              var row_index = $(this).parent('table').index();
              alert(row_index);
          });  this code is find row index */
          
          
      });
        
        function calc(v) {
          //var indexRow = $(v).parent().parent().index();
          //alert(indexRow);

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
        function ItemName1() {
            $(document).on('input', '.itemcode, .itemname', function () {
                var input = $(this);
                var endpoint = '/Customer.asmx/Itemcode1';
                var itemName = input.val();
                var itemCode = input.val();
                $.ajax({
                    url: endpoint,
                    method: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({ ItemName: itemName, ItemCode: itemCode}),
                    dataType: 'json',
                    success: function (data) {
                        var items = data.d;
                       
                        //items.forEach(function (item) {
                        //    console.log(item.ItemCode);
                        //    console.log(item.ItemName);
                        //    console.log(item.GST);
                        //    console.log(item.Price);
                        //    console.log(item.Discount);
                        //});
                        input.autocomplete({
                            source: function (request, response) {
                                var filteredItems = items.filter(function (item) {
                                    //console.log("item.ItemCode: ", item.ItemCode);
                                    //console.log("item.ItemName: ", item.ItemName);
                                    //console.log("item.GST: ", item.GST);
                                    //console.log("item.Price: ", item.Price);
                                    //console.log("item.Discount: ", item.Discount);
                                    return (item.ItemCode.toLowerCase().indexOf(request.term.toLowerCase()) > -1 || item.ItemName.toLowerCase().indexOf(request.term.toLowerCase()) > -1);
                                    
                                });
                                /*console.log(filteredItems); */
                                //response(filteredItems);
                                response($.map(filteredItems, function (item) {
                                    return {
                                        label: item.ItemCode,
                                        value: item.ItemCode,
                                        id: item.ItemCode,
                                        gst: item.GST,
                                        price: item.Price,
                                        discount: item.Discount
                                    };
                                }));
                            },
                            select: function (event, ui) {
                                console.log("Event: ", event);
                                console.log("UI: ", ui);
                                var item = ui.item;
                                if (item) {
                                    $('.itemcode').val(item.ItemCode);
                                    $('.itemname').val(item.ItemName);
                                    $('.gst').val(item.GST);
                                    $('.price').val(item.Price);
                                    $('.discount').val(item.Discount);
                                } else {
                                    console.log("Selected item is not found in the items source");
                                }
                            }
                        });
                    },
                    error: function (err) {
                        console.error(err);
                        alert("An error occurred while trying to retrieve the item names.");
                    }
                });
            });
        }
       //----------------------------------------------------- 
    </script>
</html>

<%-- https://makitweb.com/autocomplete-data-on-multiple-fields-with-jquery-and-ajax/ --%>

<%--   $(document).on('keydown', '.username', function() {
 
     var id = this.id;
     var splitid = id.split('_');
     var index = splitid[1];

     // Initialize jQuery UI autocomplete
     $( '#'+id ).autocomplete({
        source: function( request, response ) {
           $.ajax({
              url: "ajaxfile.php",
              type: 'post',
              dataType: "json",
              data: {
                 search: request.term,request:1
              },
              success: function( data ) {
                 response( data );
              }
           });
        },
        select: function (event, ui) {
           $(this).val(ui.item.label); // display the selected text
           var userid = ui.item.value; // selected value

           // AJAX
           $.ajax({
              url: 'ajaxfile.php',
              type: 'post',
              data: {userid:userid,request:2},
              dataType: 'json',
              success:function(response){
 
                 var len = response.length;

                 if(len > 0){
                    var id = response[0]['id'];
                    var name = response[0]['name'];
                    var email = response[0]['email'];
                    var age = response[0]['age'];
                    var salary = response[0]['salary'];

                    // Set value to textboxes
                    document.getElementById('name_'+index).value = name;
                    document.getElementById('age_'+index).value = age;
                    document.getElementById('email_'+index).value = email;
                    document.getElementById('salary_'+index).value = salary;
 
                 }
 
              }
           });

           return false;
        }
     }); --%>