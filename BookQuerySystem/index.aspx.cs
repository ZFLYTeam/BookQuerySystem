using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookQuerySystem
{
    /// <summary>
    /// 作者：张嘉
    /// 时间：2014/11/08
    /// 作用：首页展示书籍，搜索书籍
    /// </summary>
    public partial class index : System.Web.UI.Page
    {
        BookDao bookDao = new BookDao();
        //初始化查询语句
        string sql = "select * from view_book where bookId > 0";//查询语句
        string sqlCount = "select count(*) as COUNT from view_book where bookId >0";//查询总数量语句
        protected void Page_Load(object sender, EventArgs e)
        {
            ///退出就跳转到这里，同时删除所有session
            if (Session["user"] != null)
            {
                Session.RemoveAll();
            }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerBookList.RecordCount = bookDao.GetAllCount(sqlCount);
            int pageIndex = this.AspNetPagerBookList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerBookList.PageSize = 6;
            listBook.DataSource = bookDao.getBook(sql, pageIndex, pageSize);
            listBook.DataBind();
        }

        protected void AspNetPagerBookList_PageChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void listBook_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}