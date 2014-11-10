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
     * Author:Yangjing
     * Time:2014/10/27
     * Function:news的详情
     */

    public partial class newsDetails : System.Web.UI.Page
    {
        //初始化一个NewsDao
        NewsDao newsDao = new NewsDao();
        News news = new News();
        protected void Page_Load(object sender, EventArgs e)
        {
            String newsId = Convert.ToString(Context.Request["newsId"]);
            //根据newsList页面传过来的newsId从数据库中获取news对象
            news = newsDao.findById(newsId);
            newsTitleLbl.Text = news.NewsTitle;
            userNameLbl.Text = Convert.ToString(Context.Request["newsId"]);
            newsRepTimeLbl.Text = news.NewsRepTime;
            newsBodyLbl.Text = news.NewsBody;    
        }
    }
}