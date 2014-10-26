<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="datadicTypeList.aspx.cs" Inherits="BookQuerySystem.datadicTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainPage" runat="server">
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
                            <asp:Button ID="datadicTypeDelete" class="btn btn-mini btn-danger" CommandArgument='<%#Eval("ddTypeId")%>' CommandName="delete" runat="server" Text="删除" />
                            <asp:Button ID="datadicTypeModify" class="btn btn-mini btn-info" CommandArgument='<%#Eval("ddTypeId")%>' CommandName="modify" runat="server" Text="修改" />
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
