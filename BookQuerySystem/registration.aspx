<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="BookQuerySystem.registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            管理员注册</h2>
        <asp:TextBox ID="txtUserName" class="input-block-level" placeholder="请输入用户名"  runat="server" CausesValidation="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTxtUserName" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtPassword" class="input-block-level" placeholder="请输入密码"  runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTxtPassword" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtPasswordAgain" class="input-block-level" placeholder="请再次输入密码"   runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致，请重新输入" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain"></asp:CompareValidator>
        <asp:Button ID="btnSignUp" class="btn btn-large btn-primary" style="width:140px" 
            runat="server" Text="注册" onclick="btnSignUp_Click" CausesValidation="True" />
        <input id="btnReturn" class="btn btn-large btn-primary" style="width:140px;margin-left:15px" onclick="javasclript:window.location.href='login.aspx'" type="button" value="返回" />   
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
