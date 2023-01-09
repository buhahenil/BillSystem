<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
        <div>
            <button type="button" id="btnAddnew">Add New</button>
            <table border="2">
                <tr>
                    <th>SrNo</th>
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
                    <th>Update</th>
                    <th>Delete</th>

                </tr>
            </table>
        </div>

        <br />
        <br />

        <table id="tblForm" border="1">
            <tr>
                <td>
                    <label>name</label>
                </td>
                <td>
                    <input id="txtItemCode" type="text" name="Item Name" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
