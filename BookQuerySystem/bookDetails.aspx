<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookDetails.aspx.cs" Inherits="BookQuerySystem.bookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .bookName
    {
        height:30px;
        margin-top:30px;
        font-size:22px;
        font-family:Microsoft YaHei UI;
        padding-bottom:30px;
    }
    #author,#publish
    {
        font-size:14px; 
        font-family:Microsoft YaHei UI;  
    }
    #price
    {
        font-size:14px;
        font-family:Microsoft YaHei UI;
        color:#9a8069;
        }
    #bookDesc
    {
        font-size:14px;
        font-family:Microsoft YaHei UI;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
	<div class="row-fluid">
		<div class="span2">
		</div>
        <div class="span10">
		<div class="span3">
        <asp:Image ID="imgBookCover" class="img-polaroid"  runat="server" />
		</div>
		<div class="span6">
        <br /><br /><br /><br />
		<span class="bookName"><asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label><br /></span><br/><br />
        <span id="author" style="padding-top:30px;">作者：<asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label><br /></span>
        <span id="publish">出版社：<asp:Label ID="lblPublish" runat="server" Text="Label"></asp:Label><br /></span>
        <span id="price"><li class="fa fa-cny"></li>：<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label><br /></span>
		</div>
        <div class="span1"></div>
        <div class="span10">
        <h1 style="font-family:楷体">书籍简介</h1>
         <p id="bookDesc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label></p><br />
        </div>
        </div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
