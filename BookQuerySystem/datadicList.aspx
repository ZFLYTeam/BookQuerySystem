<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicList.aspx.cs" Inherits="BookQuerySystem.datadicList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
   <cc1:Alert ID="AlertAddSuccess" runat="server" AlertType="Success" Visible="False">
        <h4>
            提示!
        </h4>
        s数据添加成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertModifySuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        数据修改成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertDeleteSuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        数据删除成功！！！
    </cc1:Alert>
    <cc1:Alert ID="AlertDeleteFalure" runat="server" Visible="False" AlertType="Error">
        <h4>
            提示!
        </h4>
        数据删除失败！！！
    </cc1:Alert>
 <div align="right" style="padding-top:25px">
     <asp:Button ID="datadicAdd" class="btn btn-info" runat="server" Text="添加" onclick="datadicAdd_Click" />
 </div>

  <div style="padding-top:25px">
  <asp:Repeater ID="listDatadic" runat="server" 
          onitemcommand="listDatadic_ItemCommand" >
                <HeaderTemplate>
                    <div class="data_content">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>
                                   数据字典类型名
                                </th>   
                                <th>
                                   数据字典值
                                </th>                           
                                <th>
                                    数据字典描述
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#Eval("ddTypeId")%>
                        </td>
                        <td>
                            <%#Eval("ddValue")%>
                        </td>
                        <td>
                            <%#Eval("ddDesc")%>
                        </td>
                        <td>
                            <input id="newsDeleteBtn" type="button" class="btn btn-mini  btn-danger" onclick='<%#Eval("ddId", "confirm(\"{0}\")")%>'  value="删除" />
                            <asp:Button ID="datadicModify" class="btn btn-mini btn-info" CommandArgument='<%#Eval("ddId")%>' CommandName="modify" runat="server" Text="修改" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    </div>
                </FooterTemplate>
  </asp:Repeater>
  <div>
        <asp:Button ID="deleteBtn" runat="server" Text="删除" hidden="hidden" 
            onclick="deleteBtn_Click"/>
        <asp:TextBox ID="ddIdTxt" runat="server" style="display:none" ></asp:TextBox>
    </div>
  </div>
  
         <div align="center">
         <webdiyer:AspNetPager ID="AspNetPagerDatadicList" runat="server" class="pagination"
                PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" ShowInputBox="Always"
                SubmitButtonText="跳转" SubmitButtonStyle="botton" LayoutType="Div" onpagechanged="AspNetPagerDatadicList_PageChanged"
                UrlPaging="False" ReverseUrlPageIndex="True" ValidateRequestMode="Inherit" ShowMoreButtons="False">
            </webdiyer:AspNetPager>
        </div>
            <script type="text/javascript">
                function confirm(str) {
                    Modal.confirm(
            { msg: "确定删除该数据？" }).on(
            function (e) {
                if (e) {
                    document.getElementById("<%=ddIdTxt.ClientID %>").value = str;
                    document.getElementById("<%=deleteBtn.ClientID %>").click();
                }
            }
            );
                }
    </script>
</asp:Content>
