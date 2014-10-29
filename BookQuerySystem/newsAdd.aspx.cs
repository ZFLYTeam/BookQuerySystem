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
     * Function: news的添加保存
     */

    public partial class newsAdd : System.Web.UI.Page
    {
        //初始化一个NewsDao
        NewsDao newsDao = new NewsDao();
        News news = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int newsId = Convert.ToInt32(Context.Request["newsId"]);
            //根据newsList页面传过来的newsId从数据库中获取news对象
            news = newsDao.findById(newsId);
            if (!IsPostBack)
            {
                if (Context.Request["newsId"] == null)
                {
                    tb_newsTitle.Text = "";
                    tb_newsBody.Text = "";
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
                b = newsDao.newsModify(news);
            }
            else 
            {
                news = new News();
                news.NewsTitle = tb_newsTitle.Text;
                news.UserId = Convert.ToInt32(userDdl.SelectedValue);
                news.NewsBody = tb_newsBody.Text;
                news.NewsRepTime = DateTime.Now.ToString("yyyy年MM月dd日 hh:mm:ss");
                news.NewsModifyTime = " ";
                b = newsDao.newsAdd(news);
            }
            if (b)
            {
                Session["flag"] = "success";
                Response.Redirect("newsList.aspx");
            }
            else
            {
                Alertfail.Visible = true;
            }
 
        }
        
    }
}