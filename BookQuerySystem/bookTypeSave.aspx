<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true"
    CodeBehind="bookTypeSave.aspx.cs" Inherits="BookQuerySystem.bookTypeSave" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:Alert ID="Alertfail" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书籍类别保存失败
    </cc1:Alert>
        <div class="row row-fluid">
        <div class="span3"></div>
		<div class="span6">
			<div class="form-horizontal">
				<div class="control-group">
					 <label class="control-label" for="tb_bookTypeName">类别名称</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookTypeName" class="span12" required runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookTypeDesc">类别描述</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookTypeDesc" class="span12" runat="server"></asp:TextBox>
                    </div>
				</div>
                <div class="control-group">
					<div class="controls ">
                    <asp:Button ID="btnBookTypeSave" class="btn btn-info span6" runat="server" 
                            Text="保存" onclick="btnBookTypeSave_Click" />
                    <input id="btnReturn" class="btn btn-info span6" onclick="javascript:window.location.href='bookTypeList.aspx'" type="button" value="返回" />  
					</div>
				</div>
			</div>
		</div>
		<div class="span3">
		</div>
	</div>
</asp:Content>
