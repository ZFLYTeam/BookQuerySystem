<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsList.aspx.cs" Inherits="BookQuerySystem.newsList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:alert ID="AlertAddSuccess" runat="server" Visible="False" 
    AlertType="Success" Width="200px">
        <h4>
            提示!
        </h4>
        新闻添加成功(*^__^*)
    </cc1:alert>
    <cc1:alert ID="AlertModifySuccess" runat="server" Visible="False" 
    AlertType="Success" Width="200px">
        <h4>
            提示!
        </h4>
        新闻修改成功(*^__^*)
    </cc1:alert>
    <cc1:alert ID="AlertDeleteSuccess" runat="server" Visible="False" 
    AlertType="Success" Width="200px">
        <h4>
            提示!
        </h4>
        新闻删除成功(*^__^*)
    </cc1:alert>
    <cc1:alert ID="AlertDeleteFalure" runat="server" Visible="False" 
    AlertType="Error" Width="200px">
        <h4>
            提示!
        </h4>
        新闻删除失败(┬＿┬)
    </cc1:alert>
    <div align="right" style="padding-top:25px">
        <asp:Button ID="newsAddBtn" class="btn btn-sm btn-primary" runat="server" Text="添加" 
            onclick="newsAddBtn_Click" />
    </div>
        <div style="padding-top:25px">
            <asp:Repeater ID="listNews" runat="server" 
                onitemcommand="listNews_ItemCommand" >
                <HeaderTemplate>
                    <div class="data_content">
                        <table class="table table-bordered table-hover" style="table-layout:fixed;align:center;">
                            <tr>
                                <th width="13%">
                                    标题
                                </th>
                                <th width="7%">
                                    作者
                                </th>
                                <th  width="17%">
                                    发布时间
                                </th>
                                <th width="17%">
                                    修改时间
                                </th>
                                <th width="31%">
                                    正文
                                </th>
                                <th width="15%">
                                    操作
                                </th>
                            </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="autocut">
                            <%#Eval("newsTitle")%>
                        </td>
                        <td >
                            <%#Eval("userName")%>
                        </td>
                        <td>
                            <%#Eval("newsRepTime")%>
                        </td>
                        <td>
                            <%#Eval("newsModifyTime")%>
                        </td>
                        <td class="autocut">
                            <%#Eval("newsBody")%>
                        </td>
                        <td>
                            <input id="newsDeleteBtn" type="button" class="btn btn-mini  btn-danger" onclick='<%#Eval("newsId", "confirm(\"{0}\")")%>'  value="删除" />
                            <asp:Button ID="btnNewsModify" class="btn btn-mini  btn-info" CommandArgument='<%#Eval("newsId")%>' CommandName="modify" runat="server" Text="修改" />
                            <asp:Button ID="btnNewsDetails" class="btn btn-mini  btn-info" CommandArgument='<%#Eval("newsId")%>' CommandName="details" runat="server" Text="详情" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="row" style="margin-top: 15px;">
            <div align="center">
                <webdiyer:AspNetPager ID="AspNetPagerNewsList" runat="server" class="pagination"
                PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" ShowInputBox="Always"
                SubmitButtonText="跳转" SubmitButtonStyle="botton" LayoutType="Div" OnPageChanged="AspNetPagerNewsList_PageChanged"
                UrlPaging="False" ReverseUrlPageIndex="True" ValidateRequestMode="Inherit" ShowMoreButtons="False">
            </webdiyer:AspNetPager>
            </div>
        </div>
     <!-- 删除新闻用的两个控件，在单击repeater里面的删除按钮，调用confirm()的js函数，将参数bookId传到txtBookId中，然后再触发按钮btnDelete-->
    <div>
        <asp:Button ID="deleteBtn" runat="server" Text="删除" hidden="hidden" 
            onclick="deleteBtn_Click"/>
        <asp:TextBox ID="newsIdTxt" runat="server" style="display:none" ></asp:TextBox>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function confirm(str) {
            Modal.confirm(
            { msg: "确定删除该新闻？" }).on(
            function (e) {
                if (e) {
                    document.getElementById("<%=newsIdTxt.ClientID %>").value = str;
                    document.getElementById("<%=deleteBtn.ClientID %>").click();
                }
            }
            );
        }
    </script>
</asp:Content>
