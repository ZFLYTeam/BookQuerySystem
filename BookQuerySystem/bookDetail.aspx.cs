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
    /// 时间：2014/11/11
    /// 作用：前台显示书籍详情页
    /// </summary>
    public partial class bookDetail : System.Web.UI.Page
    {
        //初始化一个bookDao
        BookDao bookDao = new BookDao();
        Book book = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(Context.Request["bookId"]);
            //根据bookList页面传过来的bookId从数据库中获取book对象
            book = bookDao.findById(bookId.ToString());
            imgBookCover.ImageUrl = "images/bookCover/" + book.BookCover;
            lblPrice.Text = book.BookPrice;
            lblAuthor.Text = book.BookAuthor;
            lblBookName.Text = book.BookName;
            lblPublish.Text = book.BookPublish;
            lblDesc.Text = book.BookDesc;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?str="+txtSearch.Text);
        }
    }
}