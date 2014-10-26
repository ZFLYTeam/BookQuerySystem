<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookDetails.aspx.cs" Inherits="BookQuerySystem.bookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
<div class="row">
    <div class="span2">
    </div>
    <div class="span8">
        <asp:Image ID="imgBookCover" runat="server" />
        书名：<asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label>
        作者：<asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label>
        价格：<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
        出版社：<asp:Label ID="lblPublish" runat="server" Text="Label"></asp:Label>
        描述：<asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="span2"></div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
