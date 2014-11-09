using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;
using System.IO;

namespace BookQuerySystem
{
    /*
     * Author:Youye
     * Time:2014/10/17
     * Function: news的添加保存
     */

    public partial class newsAdd : System.Web.UI.Page
    {
        //初始化一个NewsDao
        NewsDao newsDao = new NewsDao();
        News news = null;
        String s;//暂存用户名
        User user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //根据session获取当前用户
            if (Session["user"] != null)
            {
                user = (User)Session["user"];
                s = Convert.ToString(user.UserId);
            }
            //如果传过来的newsID不为空就去获取新闻信息
            if (Context.Request["newsId"] != null)
            {
                string newsId = Convert.ToString(Context.Request["newsId"]);
                //根据newsList页面传过来的newsId从数据库中获取news对象
                news = newsDao.findById(newsId);
            }
            if (!IsPostBack)
            {
                if (Context.Request["newsId"] == null)
                {
                    tb_newsTitle.Text = "";
                    tb_newsBody.Text = "";
                    //根据当前用户初始化下拉框选项
                    userDdl.SelectedValue = s;
                }
                else
                {
                    tb_newsTitle.Text = news.NewsTitle;
                    userDdl.SelectedValue = Convert.ToString(news.UserId);
                    tb_newsBody.Text = news.NewsBody;
                }
            }
        }

        protected void bt_newsAdd_Click(object sender, EventArgs e)
        {
            bool b;
            if (Context.Request["newsId"] != null)
            {
                news.NewsId = Convert.ToInt32(Context.Request["newsId"]);
                news.NewsTitle = tb_newsTitle.Text;
                news.UserId = Convert.ToInt32(userDdl.SelectedValue);
                news.NewsModifyTime = DateTime.Now.ToString("yyyy年MM月dd日 hh:mm:ss");
                news.NewsBody = tb_newsBody.Text;

                try
                {
                    newsDao.newsModify(news);
                    Session["flag"] = "modifySuccess";
                    Response.Redirect("newsList.aspx");
                }
                catch
                {
                    Alertfail.Visible = true;
                }
            }
            else
            {
                news = new News();
                news.NewsTitle = tb_newsTitle.Text;
                news.UserId = Convert.ToInt32(userDdl.SelectedValue);
                news.NewsBody = tb_newsBody.Text;
                news.NewsRepTime = DateTime.Now.ToString("yyyy年MM月dd日 hh:mm:ss");
                news.NewsModifyTime = " ";
                try
                {
                    newsDao.newsAdd(news);
                    //跳转到本页面，同时激活alertsuccess
                    Session["flag"] = "addSuccess";
                    Response.Redirect("newsList.aspx");
                }
                catch
                {
                    Alertfail.Visible = true;
                }
            }
        }

    }
}