﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsAdd.aspx.cs" Inherits="BookQuerySystem.newsAdd" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    
    <cc1:alert ID="Alertfail" runat="server" Visible="False" 
    AlertType="Warning">
        <h4>
            提示!
        </h4>
        新闻添加失败(┬＿┬)
    </cc1:alert>
    <div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span2">
				</div>
				<div class="span6">
					<div class="form-horizontal">
						<div class="control-group">
							 <label class="control-label" for="tb_newsTitle">标题</label>
							<div class="controls">
                            <asp:TextBox ID="tb_newsTitle" required class="form" runat="server" Width="205px"></asp:TextBox>
							</div>
						</div>
                     <div class="control-group">
					 <label class="control-label" for="tb_userId">作者</label>
                    
					 <asp:SqlDataSource ID="SqlDataSource1"  runat="server" 
                         ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                         ProviderName="System.Data.SqlClient" 
                         SelectCommand="SELECT [userId], [userName] FROM [t_user]">
                     </asp:SqlDataSource>
					<div class="controls ">
                    <asp:DropDownList ID="userDdl" class="selectpicker" data-style="btn-info" runat="server" DataSourceID="SqlDataSource1" 
                         DataTextField="userName" DataValueField="userId">
                    </asp:DropDownList>
					</div>
				</div>
						<div class="control-group">
							  <label class="control-label" for="tb_newsBody">正文</label>
							<div class="controls">
                            <asp:TextBox ID="tb_newsBody" required class="form" TextMode="MultiLine" 
                            style="height:100px"  runat="server" Width="500px"></asp:TextBox>
							</div>
						</div>
                       
                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <asp:Button ID="bt_newsAdd" class="btn btn-primary span5"  runat="server" Text="保存"
                                    OnClick="bt_newsAdd_Click"/>
                                <input id="returnBackBtn" class="btn btn-success span5" onclick="javascript:window.location.href='newsList.aspx'" type="button" value="返回" "/>                           
                            </div>
                        </div>
					</div>
				</div>
				<div class="span4">
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
