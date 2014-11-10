using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;
using System.IO;
using System.Web.UI.HtmlControls;

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
            //根据参数flag判断状态是什么，显示相应的alert
            if (Session["flag"] == null) { }
            else if (Session["flag"].ToString() == "addSuccess")
            {
                AlertAddSuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "modifySuccess")
            {
                AlertModifySuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "delSuccess")
            {
                AlertDeleteSuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "delFailure")
            {
                AlertDeleteFalure.Visible = true;
                Session.Remove("flag");
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

        protected void newsAddBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("newsAdd.aspx");
        }

        protected void AspNetPagerNewsList_PageChanged(object sender, EventArgs e)
        {
            //各种提示不可视
            AlertAddSuccess.Visible = false;
            AlertModifySuccess.Visible = false;
            AlertDeleteSuccess.Visible = false;
            AlertDeleteFalure.Visible = false;
            BindGrid();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            //根据id获取书籍信息
            News news = newsDao.findById(newsIdTxt.Text.ToString());
            bool b = newsDao.newsDelete(newsIdTxt.Text);
            if (b)
            {
                Session["flag"] = "delSuccess";
                Response.Redirect("newsList.aspx");
            }
            else
            {
                Session["flag"] = "delFailure";
                Response.Redirect("newsList.aspx");
            }
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