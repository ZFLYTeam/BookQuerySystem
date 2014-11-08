<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicList.aspx.cs" Inherits="BookQuerySystem.datadicList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
 <div align="right" style="padding-top:25px">
     <asp:Button ID="datadicAdd" runat="server" Text="添加" onclick="datadicAdd_Click" />
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
                                    你确定要删除该条信息？</p>
                            </div>
                            <div class="modal-footer">    
                            <asp:Button ID="datadicDelete" class="btn btn-success" CommandArgument='<%#Eval("ddId")%>' CommandName="delete" runat="server" Text="确定" />
                                <button class="btn" data-dismiss="modal" aria-hidden="true">
                                    取消</button>
                            </div>
                        </div>
                            <asp:Button ID="datadicModify" class="btn btn-mini btn-info" CommandArgument='<%#Eval("ddId")%>' CommandName="modify" runat="server" Text="修改" />
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
         <webdiyer:AspNetPager ID="AspNetPagerDatadicList" runat="server" class="pagination"
                PagingButtonSpacing="0px" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                PrevPageText="上页" Font-Names="Arial" AlwaysShow="true" ShowInputBox="Always"
                SubmitButtonText="跳转" SubmitButtonStyle="botton" LayoutType="Div" onpagechanged="AspNetPagerDatadicList_PageChanged"
                UrlPaging="False" ReverseUrlPageIndex="True" ValidateRequestMode="Inherit" ShowMoreButtons="False">
            </webdiyer:AspNetPager>
        </div>
</asp:Content>
