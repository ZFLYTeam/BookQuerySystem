<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bootstrap.aspx.cs" Inherits="BookQuerySystem.Bootstrap" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link  href="libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
<div class=container>
    <form id="form1" runat="server">
    <div>
        <cc1:Alert ID="Alert1" runat="server" CssClass="alert-danger" Visible="False">
        文字
        </cc1:Alert>
        <asp:Button ID="bt_comfirm" runat="server" Text="Button" 
            onclick="bt_comfirm_Click" />
    </div>
    </form>
    </div>
     <script type="text/javascript" src="libs/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
