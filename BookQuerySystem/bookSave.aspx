<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookSave.aspx.cs" Inherits="BookQuerySystem.bookSave" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:Alert ID="Alertfail" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书籍保存失败
    </cc1:Alert>
    <cc1:Alert ID="AlertExist" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书籍已经存在,请不要重复添加
    </cc1:Alert>
      <cc1:Alert ID="AlertIsEmpty" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书名不能为空！！！请重新输入
    </cc1:Alert>
    <div>
        <table align="center">
            <tr>
                <td width="10%" align="right">
                    书名：
                </td>
                <td width="30%">
                    <asp:TextBox ID="tb_bookName" required runat="server"></asp:TextBox>
                </td>
                <td width="10%" align="right">
                    类别：
                </td>
                <td width="30%">
                    <asp:DropDownList ID="ddlBookTypeSelect" class="selectpicker" data-style="btn-primary"
                        runat="server" DataSourceID="sqsBookTypeName" DataTextField="bookTypeName" DataValueField="bookTypeId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqsBookTypeName" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [bookTypeName], [bookTypeId] FROM [t_bookType]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right">
                    作者：
                </td>
                <td>
                    <asp:TextBox ID="tb_bookAuthor" runat="server"></asp:TextBox>
                </td>
                <td align="right">
                    价格：
                </td>
                <td>
                    <asp:TextBox ID="tb_bookPrice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    出版社：
                </td>
                <td>
                    <asp:DropDownList ID="ddlPublish" runat="server" class="selectpicker" data-style="btn-primary"
                        DataSourceID="SqlDataSourceforView_publish" DataTextField="ddValue" 
                        DataValueField="ddValue">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceforView_publish" runat="server" 
                        ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                        ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [ddValue], [ddId] FROM [view_publish]">
                    </asp:SqlDataSource>
                </td>
                <td align="right">
                    封面：
                </td>
                <td>
                    <asp:FileUpload ID="fldCover" runat="server" />
                    <asp:TextBox ID="tb_bookCover" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    描述：
                </td>
                <td colspan="3">
                    <asp:TextBox ID="tb_bookDesc" runat="server" Height="103px" TextMode="MultiLine"
                        Width="83%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td>
                    <asp:Button ID="bt_bookSave" class="btn btn-success" style="width: 66%" runat="server" Text="确定" OnClick="bt_bookSave_Click" />
                </td>
                <td align="right">
                </td>
                <td>
                     <input id="btnReturn" class="btn btn-success" style="width: 66%"  onclick="javascript:window.location.href='bookList.aspx'" type="button" value="返回" />  
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
