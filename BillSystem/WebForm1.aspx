<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BillSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<input type="button" id="btnAddnew" value="Add New" style="background-color: MediumSlateBlue; color: white" />--%>
        
        <input type="search" id="searchBox" name="searchbox" placeholder="Search Box">

    </form>   
</body>
    <script src="Scripts/jquery-3.6.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#searchBox").on("keyup", function () {
                var value = $(this).val();
                value
                $ajax({
                    url: "/WebForm1.aspx/getRecord",
                    type: "POST",
                    datatype: "json",
                    ContentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (data) {
                        console.log();
                    },
                    error: function (err) {
                        //debugger;
                        console.log(err);
                    }
                });
            });
        });
    </script>
</html>
