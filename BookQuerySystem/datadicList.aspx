<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicList.aspx.cs" Inherits="BookQuerySystem.datadicList" %>
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
                                   数据字典价格
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
                            <asp:Button ID="datadicDelete" class="btn btn-mini btn-danger" CommandArgument='<%#Eval("ddId")%>' CommandName="delete" runat="server" Text="删除" />
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
</asp:Content>
