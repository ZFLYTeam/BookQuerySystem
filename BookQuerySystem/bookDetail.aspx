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
      #bookName
      {
          font-size: 22px;
          font-family: Microsoft YaHei UI;
          padding-bottom: 30px;
      }
      #author, #publish
      {
          font-size: 14px;
          font-family: Microsoft YaHei UI;
      }
      #price
      {
          font-size: 14px;
          font-family: Microsoft YaHei UI;
          color: #9a8069;
      }
      #bookDesc
      {
          font-size: 14px;
          font-family: Microsoft YaHei UI;
      }
  </style>
</head>
<body>
<div class="container">
    <div>
        <h1>ZFLY图书查询系统</h1>
    </div>
<div style="height:auto; min-height:500px; _height:500px;">
    <form id="form1" runat="server">
        <div class="row-fluid"  style="padding-top:20px;">
            <div class="span12">
                <div class="navbar">
                    <div class="navbar-inner">
                 <div class="container-fluid">
                     <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                         <span class="icon-bar"></span></a>
                         <a href="index.aspx" class="brand">ZFLY</a>
                            <div class="nav-collapse collapse navbar-responsive-collapse">
                                <ul class="nav">
                                     <li class="divider-vertical"></li>
                                    <asp:TextBox ID="txtSearch" style="margin-top:5px;width:350px;" placeholder="搜索书名或作者..." class="input-medium search-query" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnSearch" class="btn btn-success" runat="server" Text="搜索" 
                                             onclick="btnSearch_Click" />
                                </ul>
                                <ul class="nav pull-right">
                                 <li class="divider-vertical"></li>
                                    <li><a class="fa fa-user" href="login.aspx" >管理员登录</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb" PathSeparator="&nbsp;/&nbsp;&nbsp;">
        </asp:SiteMapPath>
        </div>
    <div class="row-fluid" style="padding-top:30px;">
        <div class="span3">
            <asp:Repeater ID="rptBookList" runat="server" DataSourceID="SqlBookList">
                <HeaderTemplate>
                    <div class="well">
                        新书推荐
                        <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <a href="bookDetail.aspx?bookId=<%#Eval("bookId")%>">
                            <div class="thumbnail" style="margin-top: 20px">
                                <img alt="50x50" src="images/bookCover/<%#Eval("bookCover")%>" />
                                <div class="caption">
                                    <h5>
                                        <%#Eval("bookName")%>&nbsp;&nbsp; <span style="color: Red">
                                            <li class="fa fa-cny"></li>
                                            <%#Eval("bookPrice")%></span>元
                                    </h5>
                                </div>
                            </div>
                    </a>
                </ItemTemplate>
                <FooterTemplate>
                    </ul> </div>
                </FooterTemplate>
            </asp:Repeater>
			<asp:SqlDataSource ID="SqlBookList" runat="server" 
                ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT TOP 3 [bookId], [bookName],[bookPrice],[bookCover] FROM [t_book] ORDER BY bookId DESC"></asp:SqlDataSource>
        </div>
        <div class="span8 offset1">
            <div class="span3">
                <asp:Image ID="imgBookCover" class="img-polaroid" runat="server" />
            </div>
            <div class="span5">
                <span id="bookName">
                 <br /><br /><br /><br /><br />
                    <asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label><br />
                </span>
                <br />
                <br />
                <span id="author">作者：<asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label><br />
                </span><span id="publish">出版社：<asp:Label ID="lblPublish" runat="server" Text="Label"></asp:Label><br />
                </span><span id="price">
                    <li class="fa fa-cny"></li>
                    ：<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label><br />
                </span>
            </div>
            <div class="span10">
                <h1 style="font-family: 楷体">
                    书籍简介</h1>
                <p id="bookDesc">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDesc" runat="server"
                        Text="Label"></asp:Label></p>
                <br />
            </div>
        </div>
    </div>
    </form>
    </div>
        <div class="container" >
        <div class="row-fluid">
            <div class="span12">
                <div align="center">
                    Copyright © 2014-2015 ZFLY版权所有
                </div>
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
