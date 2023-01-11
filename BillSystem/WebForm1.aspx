<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Customer" align="center">
            <table border="2" id="tblForm1">
                <tr>
                    <td>
                        <span id="lblFirstName">Customer</span>
                    </td>
                    <td>
                        <select name="CustomerFirstName" id="cusFirstName">
                            <option value="0">--Customer FirstName--</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Item" align="center">
            <h3>Item</h3>
            <table width="100%" id="tblForm2">
                <tr>
                    <td>Item Code</td>
                    <td>Item Name</td>
                    <td>GST</td>
                    <td>Price</td>
                    <td>Price with GST</td>
                    <td>GST</td>
                    <td>Qty</td>
                    <td>Discount</td>
                    <td>Total GST</td>
                    <td>Total with GST and Discount</td>
                    <td>Add New Row</td>
                </tr>
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
                        <input type="text" id="price" name="price"/>
                    </td>

                    <td>
                        <input type="text" id="pricewithgst" name="price">
                    </td>

                    <td>
                        <input type="text" id="priwithgst" placeholder="GST(Price with GST - Price)"/>
                    </td>

                    <td>
                        <input type="text" id="qty" name="qty"/>
                    </td>

                    <td>
                        <input type="text" id="discount" name="Discount"/>
                    </td>

                    <td>
                        <input type="text" id="totalgst" name="Total GST"/>
                    </td>

                    <td>
                        <input type="text" id="totalwithgstanddiscount" name="Total with GST and Discount"/>
                    </td>

                    <td>
                        <input type="button" id="newrow" name="AddNewRow" value="Add New Row"/>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <%--<div align="center">
            <input type="submit" id="btnSubmit" value="Submit" />
        </div>--%>
    </form>
</body>
    <script src="Scripts/jquery-3.6.3.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        
        
    });
</script>
</html>
