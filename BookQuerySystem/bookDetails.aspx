<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookDetails.aspx.cs" Inherits="BookQuerySystem.bookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
	<div class="row-fluid">
		<div class="span2">
		</div>
		<div class="span3">
        <asp:Image ID="imgBookCover" class="img-polaroid"  runat="server" />
		</div>
		<div class="span6">
        <h1><asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label></h1><br />
		书名：<asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label><br />
        作者：<asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label><br />
        价格：<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label><br />
        出版社：<asp:Label ID="lblPublish" runat="server" Text="Label"></asp:Label><br />
        
		</div>
        <div class="span1"></div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
