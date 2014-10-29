<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsList.aspx.cs" Inherits="BookQuerySystem.newsList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.easypager { font: 11px Arial, Helvetica, sans-serif;padding:10px 20px 10px 0; margin: 0px;}
.easypager a {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;margin-right:2px}
.easypager a:visited {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;}
.easypager .cpb {padding: 1px 6px;font-weight: bold; font-size: 13px;border:none}
.easypager a:hover {color: #fff; background: #ffa501;border-color:#ffa501;text-decoration: none;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
<cc1:alert ID="Alertsuccess" runat="server" Visible="False" 
    AlertType="Success" Width="200px">
        <h4>
            提示!
        </h4>
        新闻添加成功(*^__^*)
    </cc1:alert>
  <div align="right" style="padding-top:25px">
        </div>
        <div style="padding-top:25px">
            <asp:Repeater ID="listNews" runat="server" 
                onitemcommand="listNews_ItemCommand" >
                <HeaderTemplate>
                    <div class="data_content">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th width="10%">
                                    标题
                                </th>
                                <th width="5%">
                                    作者
                                </th>
                                <th width="20%">
                                    发布时间
                                </th>
                                <th width="20%">
                                    修改时间
                                </th>
                                <th width="30%">
                                    正文
                                </th>
                                <th width="15%">
                                    操作
                                </th>
                            </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td >
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
                        <td>
                            <%#Eval("newsBody")%>
                        </td>
                        <td>
                            <asp:Button ID="btnNewsDelete" class="btn btn-mini  btn-danger" CommandArgument='<%#Eval("newsId")%>' CommandName="delete" runat="server" Text="删除" />
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
                <div style='font-size:14px;' class="span4">
                    <label style="color:#20A8D8; font-size:14px; width: 300px;">共<%=this.AspNetPagerNewsList.RecordCount%>条记录</label> 
                </div>
            <div align="right">
                <webdiyer:AspNetPager ID="AspNetPagerNewsList" runat="server" CssClass="easypager" CurrentPageButtonClass="cpb" Width="100%"
                 NumericButtonTextFormatString={0} FirstPageText="首页" LastPageText="末页" 
                 NextPageText="下页" PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" 
                 ShowInputBox="Always" SubmitButtonText="跳转" SubmitButtonStyle="botton" 
                 LayoutType="Div" onpagechanged="AspNetPagerNewsList_PageChanged">
                </webdiyer:AspNetPager>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
