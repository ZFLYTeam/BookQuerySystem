<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BookQuerySystem.index" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ZFLY图书查询系统</title>
    <link href="libs/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="libs/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="libs/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="shortcut icon" href="images/favicon.png" />
    <style type="text/css">
        .m-directory
        {
            width: 180px;
            height: 566px;
            background: #f4f2ef;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="span12">
			<div class="hero-unit">
				<h1>
                    Hello, world!
				</h1>
				<p>
					欢迎来到ZFLY图书查询系统,我们是有梦想的第五小组！！！
				</p>
			</div>
		</div>
	</div>
</div>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row-fluid">
            <div class="span12">
                <div class="navbar">
                    <div class="navbar-inner">
                 <div class="container-fluid">
                     <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                         <span class="icon-bar"></span></a>
                         <a href="index.aspx" class="brand">ZFLY</a>
                            <div class="nav-collapse collapse navbar-responsive-collapse">
                                <ul class="nav">
                                     <li class="divider-vertical"></li>
                                    <asp:TextBox ID="txtSearch" style="margin-top:5px;width:350px;" placeholder="搜索书名或作者..." class="input-medium search-query" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnSearch" class="btn btn-success" runat="server" Text="搜索" 
                                             onclick="btnSearch_Click" />
                                </ul>
                                <ul class="nav pull-right">
                                 <li class="divider-vertical"></li>
                                    <li><a class="fa fa-user" href="login.aspx" >管理员登录</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
	<div class="row">
		<div class="span2">
            <asp:Repeater ID="rptBookTypeList" runat="server" DataSourceID="SqlBookType">
                <HeaderTemplate>
                <div class="m-directory">
			    <ul class="nav nav-list">
				<li class="nav-header">
                    <br />
					<font style="font-size:23px;">图书分类</font>
                    <br />
				</li>
                </HeaderTemplate>
                <ItemTemplate>
                <div class="alert alert-info">
                <input id="checkbox" runat="server" type="checkbox" value="" />
                 <%#Eval("bookTypeName")%>
                <input type="hidden" id="HiddenID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "bookTypeName")%>' />
                </div>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
			<asp:SqlDataSource ID="SqlBookType" runat="server" 
                ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT [bookTypeId], [bookTypeName] FROM [t_bookType] WHERE bookTypeId >1">
            </asp:SqlDataSource>
            <asp:TextBox ID="txtBookTypeId" style="display:none;width:10px;" runat="server"></asp:TextBox>
		</div>
        <div class="span10">
        <div class="row">
        <!-----------------------------------showSlidesbegin --------------------------------------> 
		<div class="span8">
			<div class="carousel slide" id="carousel-994754">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-994754">
					</li>
					<li data-slide-to="1" data-target="#carousel-994754">
					</li>
					<li data-slide-to="2" data-target="#carousel-994754">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/slides/11.jpg" />
						<div class="carousel-caption">
							<h4>
								书籍
							</h4>
							<p>
								是培植智慧的工具，如果把生活比喻为创造的意境<br/>
                                那么阅读就像阳光
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/slides/22.jpg" />
						<div class="carousel-caption">
							<h4>
								阅读
							</h4>
							<p>
								阅读是一种理解，领悟，吸收，鉴赏，评价和探究文章的思维过程。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/slides/33.jpg" />
						<div class="carousel-caption">
							<h4>
								学习
							</h4>
							<p>
								通过阅读、听讲、研究、观察、实践等获得知识或技能的过程，是一种使个体可以得到持mar续变化（知识和技能，方法与过程，情感与价值的改善和升华）的行为方式。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-994754" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-994754" class="right carousel-control">›</a>
			</div>
		</div>
        <!-----------------------------------showSlidesEND -------------------------------------->
        
        <!-----------------------------------NewsListBegin -------------------------------------->
		<div class="span2">
            <asp:Repeater ID="rptNews" runat="server" DataSourceID="SqlNewList">
            <HeaderTemplate>
            <div class="alert alert-block">
            新闻中心
            <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <a href="newsDetail.aspx?newsId=<%#Eval("newsId")%>"><li><%#Eval("newsTitle")%></li></a>
            </ItemTemplate>
            <FooterTemplate>
            </ul>
            </div>
            </FooterTemplate>
            </asp:Repeater>
			<asp:SqlDataSource ID="SqlNewList" runat="server" 
                ConnectionString="Data Source=localhost;Initial Catalog=db_BQS;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT TOP 10 [newsTitle], [newsId] FROM [view_news] ORDER BY newsId DESC"></asp:SqlDataSource>
		</div>
        <!-----------------------------------NewsListEND -------------------------------------->
            <!--书籍展示部分 -->
            <div class="span9">
                <asp:Repeater ID="listBook" runat="server" onitemcommand="listBook_ItemCommand">
                    <HeaderTemplate>
                    <ul class="thumbnails">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <a href="bookDetail.aspx?bookId=<%#Eval("bookId")%>">
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
        </div>
	</div>
</div>
    </form>
        <div class="container" >
        <div class="row-fluid">
            <div class="span12">
                <div align="center">
                    Copyright © 2014-2015 ZFLY版权所有
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="libs/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="libs/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript" src="libs/modal/modal.js"></script>
</body>
</html>
