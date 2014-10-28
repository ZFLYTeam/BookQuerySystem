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
   * author:zhangjia
   * 时间:2014/10/2 14:35
   * 作用:BookType的保存
   */
    public partial class bookTypeSave: System.Web.UI.Page
    {
        //初始化一个bookTypeDao
        BookTypeDao bookTypeDao = new BookTypeDao();
        BookType bookType = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookTypeId = Convert.ToInt32(Context.Request["bookTypeId"]);
            //根据bookTypeList页面传过来的bookTypeId从数据库中获取bookType对象
            bookType = bookTypeDao.findById(bookTypeId);
            if (!IsPostBack)
            {
                if (Context.Request["bookTypeId"] == null)
                {
                    tb_bookTypeDesc.Text = "";
                    tb_bookTypeName.Text = "";
                }
                else
                {
                    tb_bookTypeName.Text = bookType.BookTypeName;
                    tb_bookTypeDesc.Text = bookType.BookTypeDesc;
                }
            }
        }

        protected void btnBookTypeSave_Click(object sender, EventArgs e)
        {

            bool b;
            if (Context.Request["bookTypeId"] != null)
            {
                bookType.BookTypeId = Convert.ToInt32(Context.Request["bookTypeId"]);
                bookType.BookTypeName = tb_bookTypeName.Text;
                bookType.BookTypeDesc = tb_bookTypeDesc.Text;
                b = bookTypeDao.bookTypeUpdate(bookType);
            }
            else
            {
                bookType = new BookType();
                bookType.BookTypeName = tb_bookTypeName.Text;
                bookType.BookTypeDesc = tb_bookTypeDesc.Text;
                b = bookTypeDao.bookTypeAdd(bookType);
            }
            if (b)
            {
                Response.Redirect("bookTypeList.aspx?flag=" + 1);
            }
            else
            {
                Alertfail.Visible = true;
            }
        }
    }
}