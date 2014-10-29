<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsDetails.aspx.cs" Inherits="BookQuerySystem.newsDetails" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    
    <asp:Label ID="newsTitleLbl" runat="server"  align="center"></asp:Label></br>
    <asp:Label ID="userNameLbl" runat="server" align="right"></asp:Label>
    <asp:Label ID="newsRepTimeLbl" runat="server"></asp:Label></br>
    <asp:Label ID="newsBodyLbl" runat="server"></asp:Label></br>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
