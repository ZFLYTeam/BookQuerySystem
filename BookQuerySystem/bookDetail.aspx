<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookDetail.aspx.cs" Inherits="BookQuerySystem.bookDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>书籍详情</title>
    <link href="libs/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="libs/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    
    </form>
        <div class="container" >
        <div class="row-fluid">
            <div class="span12">
                <div align="center">
                    Copyright © 2014-2015 ZFLY版权所有
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="libs/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript" src="libs/modal/modal.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            $('.selectpicker').selectpicker();
        });
        function logOut() {
            window.location.href = "login.aspx";
        }
    </script>
</body>
</html>
