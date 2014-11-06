<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookList.aspx.cs" Inherits="BookQuerySystem.bookList" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:Alert ID="AlertAddSuccess" runat="server" AlertType="Success" Visible="False">
        <h4>
            提示!
        </h4>
        书籍添加成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertModifySuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        书籍修改成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertDeleteSuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        书籍删除成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertDeleteFalure" runat="server" Visible="False" AlertType="Error">
        <h4>
            提示!
        </h4>
        书籍删除失败！！！
    </cc1:Alert>
    <div>
        <table align="center">
            <tr >
                <td width="10%" align="right">
                书名：
                </td>
                <td width="30%">
                    <asp:TextBox ID="txtBookName" runat="server"></asp:TextBox>
                </td>
                <td width="10%" align="right">
                作者：
                </td>
                <td width="30%">
                    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="10%" align="right">
                书籍类别：
                </td>
                <td width="30%">
                    <asp:DropDownList ID="ddlBookType" class="selectpicker" data-style="btn-info"
                        runat="server" DataSourceID="SqlGetBookType" DataTextField="bookTypeName" DataValueField="bookTypeId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlGetBookType" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [bookTypeName], [bookTypeId] FROM [t_bookType]">
                    </asp:SqlDataSource>
                </td>
                <td width="10%" align="right">
                出版社：
                </td>
                <td width="30%">
                    <asp:DropDownList ID="ddlPublish" class="selectpicker" data-style="btn-info" runat="server" DataSourceID="SqlGetPublish" 
                        DataTextField="ddValue" DataValueField="ddValue">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlGetPublish" runat="server" 
                        ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                        ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [ddValue] FROM [view_publish]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td width="10%" align="right">
                </td>
                <td width="30%">
                       <asp:Button ID="btnSearch" style="width:80%" class="btn btn-success" runat="server" Text="查询" OnClick="btnSearch_Click" />
                </td>
                <td width="10%" align="right">
                </td>
                <td width="30%">
                    <asp:Button ID="btnReset" style="width:80%" class=" btn btn-warning"
                        runat="server" Text="重置" onclick="btnReset_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div align="right" style="padding-top: 25px">
        <asp:Button ID="btnBookAdd" class="btn btn-sm btn-primary" runat="server" Text="添加"
            OnClick="btnBookAdd_Click" />
    </div>
    <div style="padding-top: 25px">
        <asp:Repeater ID="listBook" runat="server" OnItemCommand="listBook_ItemCommand">
            <HeaderTemplate>
                <div class="data_content">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th>
                                书名
                            </th>
                            <th>
                                作者
                            </th>
                            <th>
                                价格
                            </th>
                            <th>
                                出版社
                            </th>
                            <th>
                                描述
                            </th>
                            <th>
                                类别
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%#Eval("bookName")%>
                    </td>
                    <td>
                        <%#Eval("bookAuthor")%>
                    </td>
                    <td>
                        <%#Eval("bookPrice")%>元
                    </td>
                    <td>
                        <%#Eval("bookPublish")%>
                    </td>
                    <td>
                        <%#Eval("bookDesc")%>
                    </td>
                    <td>
                        <%#Eval("bookTypeName")%>
                    </td>
                    <td>
                        <input id="btnBookDelete" type="button" class="btn btn-mini  btn-danger" onclick='<%#Eval("bookId", "confirm(\"{0}\")")%>'  value="删除" />
                        <asp:Button ID="btnBookModify" class="btn btn-mini  btn-info" CommandArgument='<%#Eval("bookId")%>'
                            CommandName="modify" runat="server" Text="修改" />
                        <asp:Button ID="btnBookDetails" class="btn btn-mini  btn-info" CommandArgument='<%#Eval("bookId")%>'
                            CommandName="details" runat="server" Text="书籍详情" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table> </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <div class="row" style="margin-top: 15px;">
        <div align="center">
            <webdiyer:AspNetPager ID="AspNetPagerBookList" runat="server" class="pagination"
                PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" ShowInputBox="Always"
                SubmitButtonText="跳转" SubmitButtonStyle="botton" LayoutType="Div" OnPageChanged="AspNetPagerBookList_PageChanged"
                UrlPaging="False" ReverseUrlPageIndex="True" ValidateRequestMode="Inherit" ShowMoreButtons="False">
            </webdiyer:AspNetPager>
        </div>
    </div>

    <!-- 删除书籍用的两个控件，在单击repeater里面的删除按钮，调用confirm()的js函数，将参数bookId传到txtBookId中，然后再触发按钮btnDelete-->
    <div>
        <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_Click" hidden="hidden"/>
        <asp:TextBox ID="txtBookId" runat="server" style="display:none" ></asp:TextBox>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function confirm(str) {
            Modal.confirm(
            { msg: "确定删除该书籍？" }).on(
            function (e) {
                if (e) {
                    document.getElementById("<%=txtBookId.ClientID %>").value = str;
                    document.getElementById("<%=btnDelete.ClientID %>").click();
                }
            }
            );
        }
    </script>
</asp:Content>
