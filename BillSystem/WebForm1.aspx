<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div id="Customer" align="center">
            <h3>-: Customer :-</h3>
            <table id="tblForm1" border="1">
                <tr>
                    <td>
                        <span id="lblFirstName">Customer Name</span>
                    </td>
                    <td>
                        <input type="text" id="cusFirstName" name="searchbox" />
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
                        <th><input type="button" id="addnewrow" value="Add New Row"/>  

                        </th>
                    </tr>
                </thead>
                <tbody id="tblPage">
                    <tr id="Trow" class="d-none">
                        <td>
                            <input type="text" placeholder="Search" id="itemcode" onkeyup="filterFunction()"/>
                        </td>

                        <td>
                            <input type="text" placeholder="Search" id="itemname" onkeyup="filterFunction()"/>
                        </td>

                        <td>
                            <select id="gst" onchange="calc(this)">
                                <option value="5">5%</option>
                                <option value="12">12%</option>
                                <option value="18">18%</option>
                                <option value="28">28%</option>
                            </select>
                        </td>

                        <td>
                            <input type="number" id="price" name="Price" onchange="calc(this)" />
                        </td>

                        <td>
                            <input type="number" id="pricewithgst" name="Price with GST" />
                        </td>

                        <td>
                            <input type="number" id="priwithgst" placeholder="GST(Price with GST - Price)" name="GST(PricewithGST-Price)" />
                        </td>

                        <td>
                            <input type="number" id="qty" onchange="calc(this)"/>
                        </td>

                        <td>
                            <input type="number" id="discount" name="Discount" onchange="calc(this)"/>
                        </td>

                        <td>
                            <input type="number" id="totalgst" name="Total GST" />
                        </td>

                        <td>
                            <input type="number" id="totalwithgstanddiscount" name="Total with GST and Discount" />
                        </td>

                        <td>
                            <button type="button" id="rowdelete" name="Delete" >Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br /><br />

        <div id="total">
            <table id="From3" border="2" align="right">
                <tr>
                    <td>
                        <span id="lblTotol">Total</span>
                    </td>
                    <td>
                        <input type="text" id="txtTotal" name="Total" placeholder="Total Amount"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span id="lblAdjustment">Adjustment Discount Type</span>
                    </td>
                    <td>
                        <input type="text" id="txtAdjustmentType" name="AdjustmentDiscountType" placeholder="Adjustment Discount Type"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span id="lblAdjustmentDiscount">Adjustment Discount</span>
                    </td>
                    <td>
                        <input type="text" id="txtAdjDiscount" name="AdjustmentDiscount" placeholder="Adjustment Discount"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span id="lblGSTAmount">GST Amount</span>
                    </td>
                    <td>
                        <input type="text" id="txtGSTAmount" name="GSTAmount" placeholder="GST Amount"/>
                    </td>
                </tr>       
                
                <tr>
                    <td>
                        <span id="lblBillableAmount">Billable Amount</span>
                    </td>
                    <td>
                        <input type="text" id="txtBillableAmount" name="BillableAmount" placeholder="Billable Amount"/>
                    </td>
                </tr> 
            </table>
        </div>
        <br /><br />
            <div id="paymentandsubmit"> 
                <label for="payment">Customer Payment Method :- </label>
                <input id="cblPayment_1" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Cash" />Cash
                <input id="cblPayment_2" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Net Banking" />Net Banking
                <input id="cblPayment_3" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="Cheak" />Cheak
                <input id="cblPayment_4" type="checkbox" class="ads_Checkbox" name="cblPayment$0" value="UPI" />UPI
            </div>
            <input type="submit" id="btnSubmit" value="Submit" />
        </div>
    </form>
</body>
    <script src="Scripts/jquery-3.6.3.js"></script>
    <script src="Scripts/jquery-ui-1.13.2.js"></script>
    <script src="Scripts/jquery-ui-1.13.2.min.js"></script>
    <script type="text/javascript">
  
      $(document).ready(function (){
          $("#cusFirstName").autocomplete({
              source: function (request, response) {
                  $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: "Customer.asmx/GetCustomer",
                      data: "{'CustomerFirstName':'" + request.CustomerFirstName + "'}",
                      dataType: "json",
                      success: function (data) {
                          response(data.d);
                      },
                      error: function (result) {
                          alert("Error");
                      }
                  });
              },
              minLength: 3
          });

          //add button click than row AND delete
          //$('thead').on('click', '#addnewrow', function () {
          //    var tr = "<tr>" + "<td><input type='text' placeholder='Search' id='itemcode' onkeyup='filterFunction()' /></td>" + "<td><input type='text' placeholder='Search' id='itemname' onkeyup='filterFunction()'/></td> " + " <td><select id='gdt'> " + " <option value='5 % '>5%</option> " + " <option value='12 % '>12%</option>" + "<option value='18 %'>18%</option>" + "<option value='28 % '>28%</option>" + "</select>" + "</td>" + "<td><input type='number' id='price' name='price' /></td>" + "<td><input type='number' id='pricewithgst' name='price'/></td>" + "<td><input type='number' id='priwithgst' placeholder='GST(Price with GST - Price) ' /></td>" + "<td> <input type='number' id='qty' name='qty' /></td> " + "<td><input type='number' id='discount' name='Discount' /></td>" + "<td><input type='number' id='totalgst' name='Total GST' /></td>" + "<td><input type='number' id='totalwithgstanddiscount' name='Total with GST and Discount' /></td>" + "<td><input type='button' id='rowdelete' name='Delete' value='Delete' /></td>" + "</tr>"
          //    $('#tblPage').append(tr);
          //});
          
          $('#addnewrow').click(function () {
              var row = $("#Trow").clone().appendTo("#tblPage");
              $(row).find("input").val('');
              $(row).removeClass('d-none');
          });

          $('tbody').on('click', '#rowdelete', function () {
              $(this).parent().parent().remove();
          }); 

          //$('#addnewrow').click(function () {
          //    var row_index = $(this).parent('table').index();
          //    alert(row_index);
          //});
      });

      function calc(v) {
          //var indexRow = $(v).parent().parent().index();
          //alert(indexRow);

          var GST = $(v).parent().parent().find("#gst").val();
          console.log(gst);

          var Price = $(v).parent().parent().find("#price").val();
          console.log(Price);

          var PricewithGST = Price + ((Price * GST) / 100);
          var Price = $(v).parent().parent().find("#pricewithgst").val(PricewithGST);
          console.log(PricewithGST);

          //var GST = Price_with_GST - Price;
          //$("#priwithgst").val(GST);
          ////console.log(GST)

          //var QTY = $("#qty").val(indexRow);
          //console.log(QTY);

          //var totalGst = $("#totalgst").val();
      };
    </script>
</html>

<%--var Price = 19;
var GST = 18;
var Price_with_GST = Price + ((Price * GST)/100);
console.log(Price_with_GST);--%>