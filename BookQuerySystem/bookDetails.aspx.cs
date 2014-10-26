using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
 /*
  * author:zhangjia
  * 时间:2014/10/20 11:35
  * 作用:Book的详情页
  */
    public partial class bookDetails : System.Web.UI.Page
    {
        //初始化一个bookDao
        BookDao bookDao = new BookDao();
        Book book = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(Context.Request["bookId"]);
            //根据bookList页面传过来的bookId从数据库中获取book对象
            book = bookDao.findById(bookId);
            imgBookCover.ImageUrl = "images/bookCover/" + book.BookCover;
            lblPrice.Text = book.BookPrice;
            lblAuthor.Text = book.BookAuthor;
            lblBookName.Text = book.BookName;
            lblPublish.Text = book.BookPublish;
            lblDesc.Text = book.BookDesc;
        }
    }
}