using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookQuerySystem;
using System.Windows.Forms;

namespace BookQuerySystem
{
    /*
     * author:Fangmiao
     * time:2014/10/26
     * 作用：datadic的增删改查
     */
    public partial class datadicList : System.Web.UI.Page
    {
        DatadicDao datadicDao = new DatadicDao();

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取数据库中的t_datadic,绑定数据源之后显示出来
            //DataSet ds = datadicDao.getDatadic();
            //listDatadic.DataSource = ds.Tables["t_datadic"];
            if (!IsPostBack)
            {
                //listDatadic.DataBind();
                BindGrid();
            }
        }
        protected void listDatadic_ItemCommand(object source, RepeaterCommandEventArgs e)
        { //点击删除按钮，删除对应一条的信息
            if (e.CommandName == "delete")
            {
                int ddId = Convert.ToInt32(e.CommandArgument.ToString());
                Datadic datadic = new Datadic();
                datadic.DdId = ddId;
                bool b = datadicDao.datadicDelete(datadic);
                if (b)
                {
                    Response.Redirect("datadicList.aspx");
                }
                MessageBox.Show("删除成功");
            }
            //点击修改，跳转到datadicListModify,并且将ddId作为参数传过去
           else if (e.CommandName == "modify")
            {
                string url;
                url = "datadicSave.aspx?ddId=" + e.CommandArgument;
                Response.Redirect(url);
            }
            MessageBox.Show("修改成功");
        }

        protected void datadicAdd_Click(object sender, EventArgs e)
        {

            Response.Redirect("datadicSave.aspx");
            MessageBox.Show("添加成功");
        }
        protected void AspNetPagerDatadicList_PageChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        public void BindGrid()
        {
            this.AspNetPagerDatadicList.RecordCount = datadicDao.GetAllCount();
            int pageIndex = this.AspNetPagerDatadicList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerDatadicList.PageSize = 5;
            listDatadic.DataSource = datadicDao.getDatadic(pageIndex, pageSize);
            listDatadic.DataBind();
        }
    }
}