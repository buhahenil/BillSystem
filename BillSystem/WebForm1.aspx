<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="2" align="center">
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
                        <%--<th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>--%>
                    </tr>
            </table>
        </div>
    </form>
</body>
</html>
