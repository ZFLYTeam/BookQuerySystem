using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;

namespace BookQuerySystem
{
    /*
     * Author:Youye
     * Time:2014/10/17
     * Function:news的增删改查
     */
    public partial class newsList : System.Web.UI.Page
    {
        NewsDao newsDao = new NewsDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["flag"] == null)
            { 
            }
            else if (Session["flag"].ToString() == "success")
            {
                Alertsuccess.Visible = true;
            }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void listNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //点击修改，跳转到newsModify,并且将newsId作为参数传过去
            if (e.CommandName == "modify")
            {
                string url;
                url = "newsAdd.aspx?newsId=" + e.CommandArgument;
                Response.Redirect(url);
            }
            else if (e.CommandName == "delete")
            {
                bool b = newsDao.newsDelete((string)e.CommandArgument);
                if (b) {
                    Response.Redirect("newsList.aspx");
                }
            }
            else if (e.CommandName == "details")
            {
                string url= "newsDetails.aspx?newsId=" + e.CommandArgument;
                Response.Redirect(url);
            }
        }

        protected void btnNewsAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("newsAdd.aspx");
        }

        protected void AspNetPagerNewsList_PageChanged(object sender, EventArgs e)
        {
            Alertsuccess.Visible = false;
            BindGrid();
        }

        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerNewsList.RecordCount = newsDao.GetAllCount();
            int pageIndex = this.AspNetPagerNewsList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerNewsList.PageSize = 5;
            listNews.DataSource = newsDao.getNews(pageIndex, pageSize);
            listNews.DataBind();
           
        }
    }
}