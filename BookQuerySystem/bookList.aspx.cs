using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;
using System.IO;
using System.Web.UI.HtmlControls;


namespace BookQuerySystem
{
    /*
    * author:zhangjia
    * 时间:2014/10/10 14:35
    * 作用:Book的增删改查
    */
    public partial class bookList : System.Web.UI.Page
    {
        BookDao bookDao = new BookDao();
        //初始化查询语句
        string sql = "select * from view_book where bookId > 0";//查询语句
        string sqlCount = "select count(*) as COUNT from view_book where bookId >0";//查询总数量语句
        protected void Page_Load(object sender, EventArgs e)
        {
            //根据参数flag判断状态是什么，显示相应的alert
            if (Session["flag"] == null) { }
            else if (Session["flag"].ToString() == "addSuccess")
            {
                AlertAddSuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "modifySuccess")
            {
                AlertModifySuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "delSuccess")
            {
                AlertDeleteSuccess.Visible = true;
                Session.Remove("flag");
            }
            else if (Session["flag"].ToString() == "delFailure")
            {
                AlertDeleteFalure.Visible = true;
                Session.Remove("flag");
            }
            //判断是否输入作者
            if (txtAuthor.Text != "")
            {
                sql += " and bookAuthor like '%" + txtAuthor.Text + "%'";
                sqlCount += " and bookAuthor like '%" + txtAuthor.Text + "%'";
            }
            //判断是否输入书名
            if (txtBookName.Text != "") {
                sql += " and bookName like '%" + txtBookName.Text + "%'";
                sqlCount += " and bookName like '%" + txtBookName.Text + "%'";
            }
            //判断是否选择了书籍类别
            
            try
            {
                if (ddlBookType.SelectedItem.Text.ToString() != "请选择") 
                {
                sql += " and bookTypeName like '%" + ddlBookType.SelectedItem.Text + "%'";
                sqlCount += " and bookTypeName like '%" + ddlBookType.SelectedItem.Text + "%'";
                }
            }
            catch { }
                
            //判断是否选择了出版社
            try
            {
                if (ddlPublish.SelectedItem.Text.ToString()!="请选择")
                {
                    sql += " and bookPublish like '%" + ddlPublish.SelectedItem.Text + "%'";
                    sqlCount += " and bookPublish like '%" + ddlPublish.SelectedItem.Text + "%'";
                }
            }
            catch { }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void listBook_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //点击修改，跳转到bookModify,并且将bookId作为参数传过去
            if (e.CommandName == "modify")
            {
                string url;
                url = "bookSave.aspx?bookId=" + e.CommandArgument;
                Response.Redirect(url);
            }
            else if (e.CommandName == "details")
            {
                string url;
                url = "bookDetails.aspx?bookId=" + e.CommandArgument;
                Response.Redirect(url);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //根据id获取书籍信息
            Book book = bookDao.findById(txtBookId.Text);
            bool b = bookDao.bookDelete(txtBookId.Text);
            if (b)
            {
                //删除书籍封面
                DeleteDiskFile(book.BookCover);
                Session["flag"] = "delSuccess";
                Response.Redirect("bookList.aspx");
            }
            else
            {
                Session["flag"] = "delFailure";
                Response.Redirect("bookList.aspx");
            }
        }

        protected void btnBookAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookSave.aspx");
        }

        protected void AspNetPagerBookList_PageChanged(object sender, EventArgs e)
        {
            //各种提示不可视
            AlertAddSuccess.Visible = false;
            AlertModifySuccess.Visible = false;
            AlertDeleteSuccess.Visible = false;
            AlertDeleteFalure.Visible = false;
            BindGrid();
        }

        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerBookList.RecordCount = bookDao.GetAllCount(sqlCount);
            int pageIndex = this.AspNetPagerBookList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerBookList.PageSize = 5;
            listBook.DataSource = bookDao.getBook(sql,pageIndex, pageSize);
            listBook.DataBind();
        }

        //点击查询按钮，设置提示不可视，同时重新绑定数据源
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //各种提示不可视
            AlertAddSuccess.Visible = false;
            AlertModifySuccess.Visible = false;
            AlertDeleteSuccess.Visible = false;
            AlertDeleteFalure.Visible = false;
            BindGrid();
        }

        //检索书籍的时候重置按钮
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtAuthor.Text = "";
            txtBookName.Text = "";
            ddlBookType.ClearSelection();
            ddlPublish.ClearSelection();
        }

        //删除图片
        public void DeleteDiskFile(string ImageUrl)
        {
            try
            {
                string FilePath = Server.MapPath("images/bookCover/" + ImageUrl);//转换物理路径
                File.Delete(FilePath);//执行IO文件删除,需引入命名空间System.IO;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}