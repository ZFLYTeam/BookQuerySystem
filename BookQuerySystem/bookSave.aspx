<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="bookSave.aspx.cs" Inherits="BookQuerySystem.bookSave" %>

<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <cc1:Alert ID="Alertfail" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书籍保存失败
    </cc1:Alert>
    <cc1:Alert ID="AlertExist" runat="server" Visible="False" AlertType="Warning">
        <h4>
            提示!
        </h4>
        书籍已经存在,请不要重复添加
    </cc1:Alert>
    <div class="row-fluid">
		<div class="span8">
			<div class="form-horizontal">
				<div class="control-group">
					 <label class="control-label" for="tb_bookName">书名</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookName"  runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookType">类别</label>
					<div class="controls ">
                        <asp:DropDownList ID="ddlBookTypeSelect" class="selectpicker" data-style="btn-primary" runat="server" 
                            DataSourceID="sqsBookTypeName" DataTextField="bookTypeName" 
                            DataValueField="bookTypeId">
                        </asp:DropDownList>
					    <asp:SqlDataSource ID="sqsBookTypeName" runat="server" 
                            ConnectionString="Data Source=IHUEIJ-PC\SQLEXPRESS;Initial Catalog=db_BQS;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT [bookTypeName], [bookTypeId] FROM [t_bookType]">
                        </asp:SqlDataSource>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookAuthor">作者</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookAuthor" class="span12"  runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookPrice">价格</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookPrice" class="span12"  runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookPublish">出版社</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookPublish" class="span12"  runat="server"></asp:TextBox>
					</div>
				</div>
                 <div class="control-group">
					 <label class="control-label" for="tb_bookDesc">描述</label>
					<div class="controls ">
						<asp:TextBox ID="tb_bookDesc" class="span12" TextMode="MultiLine" style="height:100px"  runat="server"></asp:TextBox>
					</div>
				</div>
                <div class="control-group">
					 <label class="control-label" for="tb_bookCover">封面</label>
                    <div class="controls ">
                        <asp:FileUpload ID="fldCover" runat="server" />
                        <asp:TextBox ID="tb_bookCover" class="span12" runat="server" Visible="False"></asp:TextBox>
                    </div>
				</div>
                <div class="control-group">
					<div class="controls ">
                    <a href="#alert" class="btn btn-info span12"  data-toggle="modal" >保存</a>
					</div>
				</div>
			</div>

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
                       <p>你确定要保存书籍信息？</p>
                    </div>
                    <div class="modal-footer">
                    <asp:Button ID="bt_bookSave" class="btn btn-info" runat="server" Text="确定" 
                            onclick="bt_bookSave_Click" />
                        <button class="btn" data-dismiss="modal" aria-hidden="true">
                            取消</button>
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
 <script type="text/javascript">
     window.onload = function () {
         $('.selectpicker').selectpicker();
     };
    </script>
</asp:Content>
