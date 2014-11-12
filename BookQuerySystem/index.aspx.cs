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
            //第一次加载时执行
            if (!IsPostBack)
            {
                if (Context.Request["str"] != null) {
                    string str = Context.Request["str"];
                    sql += "and  (bookName LIKE '%" + str + "%' OR bookAuthor LIKE '%" + str + "%')";
                    sqlCount += "and  bookName LIKE '%" + str + "%' OR bookAuthor LIKE '%" + str + "%'";
                }
                BindGrid();
            }
            //每次加载页面都执行
        }

        //repeater的iteam事件
        protected void listBook_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        //点击搜索按钮执行，重新绑定数据源
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            search();
            BindGrid();
        }

        //分页事件
        protected void AspNetPagerBookList_PageChanged(object sender, EventArgs e)
        {
            search();
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
        
        //搜索函数
        public void search(){
            ///判断搜索框里面的内容
            if (txtSearch.Text != "")
            {
                sql += "and  (bookName LIKE '%" + txtSearch.Text + "%' OR bookAuthor LIKE '%" + txtSearch.Text + "%')";
                sqlCount += "and  (bookName LIKE '%" + txtSearch.Text + "%' OR bookAuthor LIKE '%" + txtSearch.Text + "%')";
            }
            ///判断书籍类别
            string str = "(";
            for (int i = 0; i < rptBookTypeList.Items.Count; i++)
            {
                if (((System.Web.UI.HtmlControls.HtmlInputCheckBox)rptBookTypeList.Items[i].FindControl("checkbox")).Checked)
                {
                    str += " bookTypeName = '" + (((System.Web.UI.HtmlControls.HtmlInputHidden)rptBookTypeList.Items[i].FindControl("HiddenID")).Value + "' OR");
                }
            }
            if (str != "(")
            {
                str = str.Remove(str.LastIndexOf("OR"), 2);
                str += ")";
                sql += " AND " + str;
                sqlCount += " AND " + str;
            }
        }
    }
}