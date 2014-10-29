﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BookQuerySystem.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="libs/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="libs/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />
     <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="form-signin">
        <h2 class="form-signin-heading" align="center">
            登录 ZFLY</h2>
        <asp:TextBox ID="txtUserName" class="input-block-level" placeholder="请输入用户名" required runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPassword" class="input-block-level" placeholder="请输入密码" required runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnLogin" class="btn btn-large btn-primary" style="width:140px" 
            runat="server" Text="登录" onclick="btnLogin_Click" />
        <input id="btnReturn" class="btn btn-large btn-primary" style="width:140px;margin-left:15px" onclick="javasclript:window.location.href='registration.aspx'" type="button" value="注册" />  
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>              
    </div>
    </form>
    <script type="text/javascript" src="libs/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            $('.selectpicker').selectpicker();
        });
    </script>
</body>
</html>
