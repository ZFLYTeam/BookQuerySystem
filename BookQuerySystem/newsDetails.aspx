<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsDetails.aspx.cs" Inherits="BookQuerySystem.newsDetails" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <table width="100%">
    <tr >
    <td align="center" colspan="3" style="width:100%;valign:top;">
    <h1>
        <asp:Label ID="newsTitleLbl" runat="server"  align="center"></asp:Label>
    </h1>
    </td>
    </tr>
    <tr>
    <td align="right" colspan="2" style="width:100%;valign:top;">
    <h3>
        <asp:Label ID="userNameLbl" runat="server" align="right"></asp:Label>
        <asp:Label ID="newsRepTimeLbl" runat="server"></asp:Label>
    </h3>
    </td>
    </tr>
    <tr>
    <td style="width:20%">
    </td>
    <td style="width:60%;valign:top;">
        <p>
        <asp:Label ID="newsBodyLbl" runat="server"></asp:Label></br>
        </p>
    </td>
    <td style="width:20%">
        <div class="span2">
            <asp:Repeater ID="rptNews" runat="server" DataSourceID="SqlNewList">
            <HeaderTemplate>
            最近要闻
            <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <a href="newsDetails.aspx?newsId=<%#Eval("newsId")%>"><li><%#Eval("newsTitle")%></li></a>
            </ItemTemplate>
            <FooterTemplate>
            </ul>
            </FooterTemplate>
            </asp:Repeater>
			<asp:SqlDataSource ID="SqlNewList" runat="server" 
                ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT TOP 10 [newsTitle], [newsId] FROM [view_news] ORDER BY newsId DESC"></asp:SqlDataSource>
		</div>
    </td>
    </tr>
    </table>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
