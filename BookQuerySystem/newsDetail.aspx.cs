using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
    /// <summary>
    /// 作者：张嘉
    /// 时间：2014年11月08
    /// 作用：前台显示新闻页面
    /// </summary>
    public partial class newsDetail : System.Web.UI.Page
    {
        //初始化一个NewsDao
        NewsDao newsDao = new NewsDao();
        News news = new News();
        protected void Page_Load(object sender, EventArgs e)
        {
            int newsId = Convert.ToInt32(Context.Request["newsId"]);
            //根据newsList页面传过来的newsId从数据库中获取news对象
            news = newsDao.findById(newsId);
            newsTitleLbl.Text = news.NewsTitle;
            userNameLbl.Text = Convert.ToString(news.UserId);
            newsRepTimeLbl.Text = news.NewsRepTime;
            newsBodyLbl.Text = news.NewsBody;
        }
    }
}