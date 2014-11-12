using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookQuerySystem
{
    public partial class Default : System.Web.UI.Page
    {
        BookDao bookDao = new BookDao();
        //初始化查询语句
        string sql = "select * from view_book where bookId > 0";//查询语句
        string sqlCount = "select count(*) as COUNT from view_book where bookId >0";//查询总数量语句
        protected void Page_Load(object sender, EventArgs e)
        {
            //第一次加载时执行
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        //分页事件
        protected void AspNetPagerBookList_PageChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerBookList.RecordCount = bookDao.GetAllCount(sqlCount);
            int pageIndex = this.AspNetPagerBookList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerBookList.PageSize = 12;
            listBook.DataSource = bookDao.getBook(sql, pageIndex, pageSize);
            listBook.DataBind();
        }
    }
}