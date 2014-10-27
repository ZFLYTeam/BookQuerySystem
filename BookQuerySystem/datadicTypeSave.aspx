<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true"
    CodeBehind="datadicTypeSave.aspx.cs" Inherits="BookQuerySystem.datadicTypeSave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span2">
				</div>
				<div class="span6">
					<div class="form-horizontal">
						<div class="control-group">
							 <label class="control-label" for="tb_ddTypeName">数据字典类别</label>
							<div class="controls">
								<asp:TextBox ID="tb_ddTypeName" class="form" runat="server" 
                required Width="300px" ></asp:TextBox>
							</div>
						</div>
						<div class="control-group">
							 <label class="control-label" for="tb_ddTypeDesc">数据字典描述</label>
							<div class="controls">
								<asp:TextBox ID="tb_ddTypeDesc" class="form" runat="server" required 
                                    Width="300px"></asp:TextBox>
							</div>
						</div>
                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <asp:Button ID="btn_modify" class="btn btn-primary span5"  runat="server" Text="保存"
                                    OnClick="btn_modify_Click" />
                                <input id="btnReturn" class="btn btn-success span5" onclick="javascript:window.location.href='datadicTypeList.aspx'" type="button" value="返回" />                           
                            </div>
                        </div>
					</div>
				</div>
				<div class="span4">
				</div>
			</div>
		</div>
	</div>
    <div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
