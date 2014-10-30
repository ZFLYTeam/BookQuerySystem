<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookTypeList.aspx.cs" Inherits="BookQuerySystem.bookTypeList" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
<cc1:Alert ID="Alertsuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        书籍类别保存成功
    </cc1:Alert>
    <cc1:Alert ID="AlertFailure" runat="server" Visible="False" AlertType="Error">
        <h4>
            提示!
        </h4>
        该类别下有书籍不能删除！！！
    </cc1:Alert>
 <div align="right">
            <asp:Button ID="bookTypeAdd" class="btn btn-primary" runat="server" Text="添加" 
                onclick="bookTypeAdd_Click"/>
        </div>
        <div style="padding-top:25px">
            <asp:Repeater ID="listBookType" runat="server" 
                onitemcommand="listBookType_ItemCommand">
                <HeaderTemplate>
                    <div class="data_content">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>
                                    书籍类别
                                </th>
                                <th>
                                    类别描述
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#Eval("bookTypeName")%>
                        </td>
                        <td>
                            <%#Eval("bookTypeDesc")%>
                        </td>
                        <td>
                        <button href="#alert" data-toggle="modal" class="btn btn-mini  btn-danger">
                            删除</button>
                        <div id="alert" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×</button>
                                <h3 id="myModalLabel">
                                    提示
                                </h3>
                            </div>
                            <div class="modal-body">
                                <p>
                                    你确定要删除该条书籍类别信息？</p>
                            </div>
                            <div class="modal-footer">
                    <asp:Button ID="bookTypeDelete" class="btn btn-success" CommandArgument='<%#Eval("bookTypeId")%>' CommandName="delete" runat="server" Text="删除" />
                                <button class="btn" data-dismiss="modal" aria-hidden="true">
                                    取消</button>
                            </div>
                        </div>
                            
                            <asp:Button ID="bookTypeModify" class="btn btn-mini btn-info" CommandArgument='<%#Eval("bookTypeId")%>' CommandName="modify" runat="server" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div align="center">
            <webdiyer:AspNetPager ID="AspNetPagerBookTypeList" runat="server" class="pagination" 
                onpagechanged="AspNetPagerBookTypeList_PageChanged" PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" 
                 NextPageText="下页" PrevPageText="上页">
            </webdiyer:AspNetPager>
        </div>
</asp:Content>
