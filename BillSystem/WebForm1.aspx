<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Customer">
            <table border="2" id="tblForm1">
                <tr>
                    <td>
                        <span id="lblFirstName">Customer FirstName</span>
                    </td>
                    <td>
                        <select name="Country" id="ddlCountry">
                            <option value="0">--Select Country--</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>

        <div id="Item">
            <table border="2" id="tblForm2">
                <tr>
                    <td>
                        <span id="lblFirstName">Customer FirstName</span>
                    </td>
                    <td>
                        <select name="Country" id="ddlCountry">
                            <option value="0">--Select Country--</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
    <script src="Scripts/jquery-3.6.3.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

    });
</script>
</html>
