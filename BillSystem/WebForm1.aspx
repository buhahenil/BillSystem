<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Customer" align="center">
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
            <h3>Item</h3>
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
                        <th><input type="button" id="addnewrow" value="Add New Row" /></th>
                    </tr>
                </thead>
                <tbody id="tblPage">
                    <tr>
                        <td>
                            <input type="text" placeholder="Search" id="itemcode" onkeyup="filterFunction()"/>
                        </td>

                        <td>
                            <input type="text" placeholder="Search" id="itemname" onkeyup="filterFunction()"/>
                        </td>

                        <td>
                            <select id="gdt">
                                <option value="5%">5%</option>
                                <option value="12%">12%</option>
                                <option value="18%">18%</option>
                                <option value="28%">28%</option>
                            </select>
                        </td>

                        <td>
                            <input type="text" id="price" name="price" />
                        </td>

                        <td>
                            <input type="text" id="pricewithgst" name="price" />
                        </td>

                        <td>
                            <input type="text" id="priwithgst" placeholder="GST(Price with GST - Price)" />
                        </td>

                        <td>
                            <input type="text" id="qty" name="qty" />
                        </td>

                        <td>
                            <input type="text" id="discount" name="Discount" />
                        </td>

                        <td>
                            <input type="text" id="totalgst" name="Total GST" />
                        </td>

                        <td>
                            <input type="text" id="totalwithgstanddiscount" name="Total with GST and Discount" />
                        </td>

                        <td>
                            <input type="button" id="rowdelete" name="Delete" value="Delete" />
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
                        <input type="text" id="txtTotal" name="total" placeholder="Total Amount"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span id="lblAdjustment">Adjustment Discount Type</span>
                    </td>
                    <td>
                        <input type="text" id="txtAdjustmentType" name="total" placeholder="Adjustment Discount Type"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span id="lblAdjustmentDiscount">Adjustment Discount</span>
                    </td>
                    <td>
                        <input type="text" id="txtAdjDiscount" name="total" placeholder="Adjustment Discount"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span id="lblGSTAmount">GST Amount</span>
                    </td>
                    <td>
                        <input type="text" id="txtGSTAmount" name="total" placeholder="GST Amount"/>
                    </td>
                </tr>       
                
                <tr>
                    <td>
                        <span id="lblBillableAmount">Billable Amount</span>
                    </td>
                    <td>
                        <input type="text" id="txtBillableAmount" name="total" placeholder="Billable Amount"/>
                    </td>
                </tr> 
            </table>
        </div>
        <br /><br />
        <div align="center">
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
            source: 'Customer.asmx/spSelectAllCustomers'
          });
          //add button click than row
          $('thead').on('click', '#addnewrow', function () {
              var tr = "<tr>" + "<td><input type='text' placeholder='Search' id='itemcode' onkeyup='filterFunction()' /></td>" + "<td><input type='text' placeholder='Search' id='itemname' onkeyup='filterFunction()'/></td> " + " <td><select id='gdt'> " + " <option value='5 % '>5%</option> " + " <option value='12 % '>12%</option>" + "<option value='18 %'>18%</option>" + "<option value='28 % '>28%</option>" + "</select>" + "</td>" + "<td><input type='text' id='price' name='price' /></td>" + "<td><input type='text' id='pricewithgst' name='price'/></td>" + "<td><input type='text' id='priwithgst' placeholder='GST(Price with GST - Price) ' /></td>" + "<td> <input type='text' id='qty' name='qty' /></td> " + "<td><input type='text' id='discount' name='Discount' /></td>" + "<td><input type='text' id='totalgst' name='Total GST' /></td>" + "<td><input type='text' id='totalwithgstanddiscount' name='Total with GST and Discount' /></td>" + "<td><input type='button' id='rowdelete' name='Delete' value='Delete' /></td>" + "</tr>"
              $('#tblPage').append(tr);
          });
          $('tbody').on('click', '#rowdelete', function () {
              $(this).parent().parent().remove();
          });
      });
    </script>
</html>
