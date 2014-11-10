<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicTypeList.aspx.cs" Inherits="BookQuerySystem.datadicTypeList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:alert ID="AlertAddSuccess" runat="server" AlertType="Success" 
        Visible="False">
        <h4>
            提示!
        </h4>
        数据添加成功！！！
    </cc1:alert>
    <cc1:alert ID="AlertModifySuccess" runat="server" Visible="False" 
        AlertType="Success">
        <h4>
            提示!
        </h4>
       数据修改成功！！！
    </cc1:alert>
    <cc1:alert ID="AlertDeleteSuccess" runat="server" Visible="False" 
        AlertType="Success">
        <h4>
            提示!
        </h4>
        数据删除成功！！！
    </cc1:alert>
    <cc1:alert ID="AlertDeleteFalure" runat="server" Visible="False" 
        AlertType="Error">
        <h4>
            提示!
        </h4>
        数据删除失败！！！
    </cc1:alert>
    <div align="right" style="padding-top:25px">
            <asp:Button ID="datadicTypeAdd" class="btn btn-primary" runat="server" 
                Text="添加" onclick="datadicTypeAdd_Click" 
                />
        </div>
        <div style="padding-top:25px">
            <asp:Repeater ID="listDatadicType" runat="server" 
                onitemcommand="listDatadicType_ItemCommand">
                <HeaderTemplate>
                    <div class="data_content">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>
                                    数据字典类别
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
                            <%#Eval("ddTypeName")%>
                        </td>
                        <td>
                            <%#Eval("ddTypeDesc")%>
                        </td>
                        <td>
                             <input id="btnBookDelete" type="button" class="btn btn-mini  btn-danger" onclick='<%#Eval("ddTypeId", "confirm(\"{0}\")")%>'  value="删除" />
                            <asp:Button ID="datadicTypeModify" class="btn btn-mini btn-info" CommandArgument='<%#Eval("ddTypeId")%>' CommandName="modify" runat="server" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            <div>
        <asp:Button ID="btnDelete" runat="server" Text="删除" hidden="hidden" 
                    onclick="btnDelete_Click"/>
        <asp:TextBox ID="txtddTyId" runat="server" style="display:none" ></asp:TextBox>
    </div>
        </div>
         <div align="center">
         <webdiyer:AspNetPager ID="AspNetPagerDatadicTypeList" runat="server" class="pagination"
                PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" ShowInputBox="Always"
                SubmitButtonText="跳转" SubmitButtonStyle="botton" LayoutType="Div" onpagechanged="AspNetPagerDatadicTypeList_PageChanged"
                UrlPaging="False" ReverseUrlPageIndex="True" ValidateRequestMode="Inherit" ShowMoreButtons="False">
            </webdiyer:AspNetPager>
        </div>
            <script type="text/javascript">
                function confirm(str) {
                    Modal.confirm(
            { msg: "确定删除该数据？" }).on(
            function (e) {
                if (e) {
                    document.getElementById("<%=txtddTyId.ClientID %>").value = str;
                    document.getElementById("<%=btnDelete.ClientID %>").click();
                }
            }
            );
                }
    </script>
</asp:Content>
