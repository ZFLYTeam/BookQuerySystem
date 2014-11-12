<%@ Page Title="" Language="C#" MasterPageFile="~/BQS.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookQuerySystem.Default" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Twitter.Web.Controls" Namespace="Twitter.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPage" runat="server">
    <div class="defaultPage">
	<p>图书展示</p>
                <!--书籍展示部分 -->
            <div class="span9 offset1">
                <asp:Repeater ID="listBook" runat="server">
                    <HeaderTemplate>
                    <ul class="thumbnails">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <a href="bookDetails.aspx?bookId=<%#Eval("bookId")%>">
                        <li class="span3">
                            <div class="thumbnail" style="margin-top:20px">
                                <img alt="140x140" src="images/bookCover/<%#Eval("bookCover")%>"/>
                                <div class="caption">
                                    <h5>
                                    <%#Eval("bookName")%>&nbsp;&nbsp;
                                    <span style="color:Red"><li class="fa fa-cny"></li> <%#Eval("bookPrice")%></span>元
                                    </h5>
                                </div>
                            </div>
                        </li>
                        </a>
                    </ItemTemplate>
                    <FooterTemplate>
                    			</ul>
                    </FooterTemplate>
                </asp:Repeater>
            <div class="row" style="margin-top: 15px;">
                <div align="center">
                    <webdiyer:aspnetpager id="AspNetPagerBookList" runat="server" class="pagination"
                        pagingbuttonspacing="0px" firstpagetext="首页" lastpagetext="末页" nextpagetext="下页"
                        prevpagetext="上页" font-names="Arial" showinputbox="Always"
                        submitbuttontext="跳转" submitbuttonstyle="botton" layouttype="Div"
                        urlpaging="False" reverseurlpageindex="True" validaterequestmode="Inherit" 
                        showmorebuttons="False" onpagechanged="AspNetPagerBookList_PageChanged">
            </webdiyer:aspnetpager>
                </div>
            </div>
            </div>
            <!--书籍展示部分END -->
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="under_Form" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
