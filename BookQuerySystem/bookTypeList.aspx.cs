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
   * 时间:2014/10/2 9:35
   * 作用:Book的增删改查
   */
    public partial class bookTypeList: System.Web.UI.Page
    {
        BookTypeDao bookTypeDao = new BookTypeDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            int flag = Convert.ToInt32(Context.Request["flag"]);
            if (flag == 1) {
                Alertsuccess.Visible = true;
            }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void bookAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookSave.aspx");
        }

        protected void AspNetPagerBookTypeList_PageChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerBookTypeList.RecordCount = bookTypeDao.GetAllCount();
            int pageIndex = this.AspNetPagerBookTypeList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerBookTypeList.PageSize = 5;
            listBookType.DataSource = bookTypeDao.getBookType(pageIndex, pageSize);
            listBookType.DataBind();
        }
        protected void listBookType_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //点击删除按钮，删除对应一条的信息
            if (e.CommandName == "delete")
            {
                int bookTypeId = Convert.ToInt32(e.CommandArgument.ToString());
                BookType bookType = new BookType();
                bookType.BookTypeId = bookTypeId;
                bool b = bookTypeDao.bookTypeDelete(bookType);
                if (b)
                {
                    Response.Redirect("bookTypeList.aspx");
                }
            }
            //点击修改，跳转到bookTypeModify,并且将bokTypeId作为参数传过去
            else if (e.CommandName == "modify")
            {
                string url;
                url = "bookTypeSave.aspx?bookTypeId=" + e.CommandArgument;
                Response.Redirect(url);
            }
        }

        protected void bookTypeAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookTypeSave.aspx");
        }

        
    }
}