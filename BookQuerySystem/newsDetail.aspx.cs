using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookQuerySystem
{
    public partial class newsDetail : System.Web.UI.Page
    {
        //初始化一个NewsDao
        NewsDao newsDao = new NewsDao();
        News news = new News();
        //初始化一个userDao
        UserDao userDao = new UserDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            String newsId = Convert.ToString(Context.Request["newsId"]);
            //根据newsList页面传过来的newsId从数据库中获取news对象
            news = newsDao.findById(newsId);
            newsTitleLbl.Text = news.NewsTitle;
            string userId = news.UserId.ToString();
            userNameLbl.Text = userDao.findById(userId).UserName;
            newsRepTimeLbl.Text = news.NewsRepTime.Remove(12);
            newsBodyLbl.Text = news.NewsBody;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?str=" + txtSearch.Text);
        }
    }
}