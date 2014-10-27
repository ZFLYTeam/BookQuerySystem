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
                                    你确定要删除该条信息？</p>
                            </div>
                            <div class="modal-footer">
                            <asp:Button ID="datadicTypeDelete" class="btn btn-success" CommandArgument='<%#Eval("ddTypeId")%>' CommandName="delete" runat="server" Text="确定" />
                                <button class="btn" data-dismiss="modal" aria-hidden="true">
                                    取消</button>
                            </div>
                        </div>
                            
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
