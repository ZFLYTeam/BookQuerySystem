<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="userModify.aspx.cs" Inherits="BookQuerySystem.userModify" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
<div class="row row-fluid">
    <cc1:Alert ID="AlertSuccess" runat="server" Visible="False" AlertType="Success">
        <h4>
            提示!
        </h4>
        密码修改成功
    </cc1:Alert>
        <cc1:Alert ID="Alertfail" runat="server" Visible="False" AlertType="Error">
        <h4>
            提示!
        </h4>
        原密码错误，请重填写！！！
    </cc1:Alert>
        <div class="span3"></div>
		<div class="span6">
			<div class="form-horizontal">
				<div class="control-group">
					 <label class="control-label" for="txtUserName">用户名</label>
					<div class="controls ">
						<asp:TextBox ID="txtUserName" class="span12" ReadOnly runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="txtOldPassword">原密码</label>
					<div class="controls ">
						<asp:TextBox ID="txtOldPassword" class="span12" placeholder="请输入原始秘密码" 
                            runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvdPassword" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtOldPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </div>
				</div>
                <div class="control-group">
                    <label class="control-label" for="txtOldPassword">
                        新密码</label>
                    <div class="controls ">
                        <asp:TextBox ID="txtNewPassword" class="span12" placeholder="请输入新密码" 
                            runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvdNewPassword" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtNewPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtOldPassword">
                        确认新密码</label>
                    <div class="controls ">
                        <asp:TextBox ID="txtNewPassword1" class="span12" placeholder="请重新输入新密码" 
                            runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvdNewPassword1" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtNewPassword1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToCompare="txtNewPassword" ControlToValidate="txtNewPassword1" ForeColor="#CC0000"></asp:CompareValidator>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls ">
                        <asp:Button ID="btnSave" class="btn btn-info span6" runat="server" Text="保存" 
                            onclick="btnSave_Click" />
                        <asp:Button ID="btnReset" class="btn btn-info span6" runat="server" Text="重置" 
                            CausesValidation="False" onclick="btnReset_Click" />
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
