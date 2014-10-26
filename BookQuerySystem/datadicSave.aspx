<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicSave.aspx.cs" Inherits="BookQuerySystem.datadicSave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <asp:TextBox ID="tb_ddTypeId" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="tb_ddVale" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="tb_ddDesc" runat="server"></asp:TextBox>
      <br />
    
<asp:Button ID="btn_modify" runat="server" Text="保存" 
        onclick="btn_modify_Click" />
</asp:Content>