using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;
using System.IO;

namespace BookQuerySystem
{
 /*
  * author:zhangjia
  * 时间:2014/10/2 14:35
  * 作用:Book的保存
  */
    public partial class bookSave : System.Web.UI.Page
    {
        //初始化一个bookDao
        BookDao bookDao = new BookDao();
        Book book = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["flag"] == null) { }
            else if (Session["flag"].ToString() == "exist")
            {
                AlertExist.Visible = true;
            }
            else if (Session["flag"].ToString() == "isEmpty")
            {
                AlertIsEmpty.Visible = true;
            }
            Session.Remove("flag");
            int bookId = Convert.ToInt32(Context.Request["bookId"]);
            //根据bookList页面传过来的bookId从数据库中获取book对象
            book = bookDao.findById(bookId);
            if (!IsPostBack)
            {
                if (Context.Request["bookId"] == null)
                {
                    tb_bookName.Text = "";
                    tb_bookAuthor.Text = "";
                    tb_bookPrice.Text = "";
                    tb_bookDesc.Text = "";
                    tb_bookCover.Text = "";
                }
                else
                {
                    tb_bookName.Text = book.BookName;
                    ddlBookTypeSelect.SelectedValue = book.BookTypeId.ToString();
                    tb_bookAuthor.Text = book.BookAuthor;
                    tb_bookPrice.Text = book.BookPrice;
                    ddlPublish.SelectedValue = book.BookPublish.ToString();
                    tb_bookDesc.Text = book.BookDesc;
                    tb_bookCover.Text = book.BookCover;
                }
            }
        }

        protected void bt_bookSave_Click(object sender, EventArgs e)
        {
            if (tb_bookName.Text == "") {
                Session["flag"] = "isEmpty";
                Response.Redirect("bookSave.aspx");
            }
             else if (Context.Request["bookId"] != null)
            {
                book.BookId = Convert.ToInt32(Context.Request["bookId"]);
                book.BookTypeId = Convert.ToInt32(ddlBookTypeSelect.SelectedValue);
                book.BookName= tb_bookName.Text;
                book.BookAuthor = tb_bookAuthor.Text;
                book.BookPrice = tb_bookPrice.Text;
                book.BookPublish = ddlPublish.SelectedItem.Text;
                book.BookDesc = tb_bookDesc.Text;
                //判断修改的时候是否修改图片
                if (upLoadImage() != "")
                {
                    book.BookCover = upLoadImage();
                    try {
                        DeleteDiskFile(tb_bookCover.Text);
                    }//修改之后上新图片到服务器，删除旧图片 
                    catch{}
                }
                else {
                    book.BookCover = tb_bookCover.Text;
                }
                try
                {
                    bookDao.bookUpdate(book);
                    Session["flag"] = "modifySuccess";
                    Response.Redirect("bookList.aspx");
                }
                catch {
                    Alertfail.Visible = true;
                }
                
            }
            else
            {
                book = new Book();
                book.BookTypeId = Convert.ToInt32(ddlBookTypeSelect.SelectedValue);
                book.BookName = tb_bookName.Text;
                book.BookAuthor = tb_bookAuthor.Text;
                book.BookPrice = tb_bookPrice.Text;
                book.BookPublish = ddlPublish.SelectedItem.Text;
                book.BookDesc = tb_bookDesc.Text;
                //如果存在的话，提示书籍已存在
                if (bookDao.existBook(book))
                {
                    //跳转到本页面，同时激活alertexist
                    Session["flag"] = "exist";
                    Response.Redirect("bookSave.aspx");
                }
                else {
                    try
                    {
                        book.BookCover = upLoadImage();//如果已经存在就不用把图片上传
                        bookDao.bookAdd(book);
                        //跳转到本页面，同时激活alertsuccess
                        Session["flag"] = "addSuccess";
                        Response.Redirect("bookList.aspx");
                    }
                    catch {
                        Alertfail.Visible = true;
                    }
                }
            }
        }

        //上传图片到服务器，返回字符串
        public string upLoadImage() {
            string imageName="";
            if (fldCover.PostedFile.ContentLength < 500000)//100000为100K
            {
                string fileFullname = this.fldCover.FileName;
                string dataName = DateTime.Now.ToString("yyyyMMddhhmmss");
                string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
                string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
                if (type == "bmp" || type == "jpg" || type == "gif" || type == "JPG" || type == "BMP" || type == "GIF")
                {
                    this.fldCover.SaveAs(Server.MapPath("images/bookCover") + "\\" + dataName + "." + type);
                    string ProImg = "images/bookCover/" + dataName + "." + type;//路径
                    imageName = dataName + "." + type;
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('支持格式：|jpg|gif|bmp|');</script>");
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('你的图片已经超过500K的大小！');</script>");
            }
            return imageName;
        }

        //删除图片
        public void DeleteDiskFile(string ImageUrl)
        {
            try
            {
                string FilePath = Server.MapPath("images/bookCover/"+ ImageUrl);//转换物理路径
                File.Delete(FilePath);//执行IO文件删除,需引入命名空间System.IO;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}