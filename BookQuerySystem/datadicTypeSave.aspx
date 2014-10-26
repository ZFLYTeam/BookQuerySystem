<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true"
    CodeBehind="datadicTypeSave.aspx.cs" Inherits="BookQuerySystem.datadicTypeSave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <h2 class="page-header">
        数据字典类别修改</h2>
    <div class="form-group">
        <div class="span3">
            
        </div>
        <asp:Label ID="lbl2" runat="server" Text="数据字典类别"></asp:Label>
        <asp:TextBox ID="tb_ddTypeName" class="form" runat="server" 
                ></asp:TextBox>
        <div class="span3">
            <asp:Label ID="lbl3" runat="server" Text="数据字典描述"></asp:Label>
            <asp:TextBox ID="tb_ddTypeDesc" class="form" runat="server"></asp:TextBox>
        </div>
        <div class="span3">
            <asp:Button ID="btn_modify" class="btn btn-primary" runat="server" Text="保存" OnClick="btn_modify_Click" />
            <asp:Button ID="btn_return" runat="server" Height="36px" 
                onclick="btn_return_Click" Text="返回" Width="65px" />
        </div>
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
