<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="newsAdd.aspx.cs" Inherits="BookQuerySystem.newsAdd" %>

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
        <div class="row row-fluid">
		<div class="span8">
			<div class="form-horizontal">
				<div class="control-group">
					 <label class="control-label" for="tb_newsTitle">标题</label>
					<div class="controls ">
						<asp:TextBox ID="tb_newsTitle" class="span12" runat="server" Width="250px"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_userId">作者</label>
                    
					 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                         ProviderName="System.Data.SqlClient" 
                         SelectCommand="SELECT [userId], [userName] FROM [t_user]">
                     </asp:SqlDataSource>
					<div class="controls ">
                    <asp:DropDownList ID="userDdl" runat="server" DataSourceID="SqlDataSource1" 
                         DataTextField="userName" DataValueField="userId">
                    </asp:DropDownList>
					</div>
				</div>
                 <div class="control-group">
					 <label class="control-label" for="tb_newsBody">正文</label>
					<div class="controls ">
						<asp:TextBox ID="tb_newsBody" class="span12" TextMode="MultiLine" 
                            style="height:100px"  runat="server" Width="600px"></asp:TextBox>
					</div>
				</div> 
                <div class="control-group">
					<div class="controls ">
                    <asp:Button ID="bt_newsAdd" class="btn btn-info span12" runat="server" 
                            Width="200px" Text="保存" onclick="bt_newsAdd_Click" />
                     <asp:Button ID="bt_newsReset" class="btn btn-info span12" runat="server" 
                            Width="200px" Text="返回" onclick="bt_newsReset_Click" />
					</div>
				</div>
			</div>
		</div>
		<div class="span3">
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
