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
     * author:於剑
     * 时间:2014.10.21
     * 作用:Datadic的增删改查
     */
    public partial class datadicTypeList : System.Web.UI.Page
    {
        DatadicTypeDao datadicTypeDao = new DatadicTypeDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取数据库中的t_datadicType,绑定数据源之后显示出来
            //DataSet ds = datadicTypeDao.getDatadicType();
            //listDatadicType.DataSource = ds.Tables["t_datadicType"];
            if (!IsPostBack)
            {
                //listDatadicType.DataBind();
                BindGrid();
            }
        }

        protected void listDatadicType_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //点击删除按钮，删除对应一条的信息
            if (e.CommandName == "delete")
            {
                int ddTypeId = Convert.ToInt32(e.CommandArgument.ToString());
                DatadicType datadicType = new DatadicType();
                datadicType.DdTypeId = ddTypeId;
                bool b = datadicTypeDao.datadicTypeDelete(datadicType);
                if (b)
                {
                    Response.Redirect("datadicTypeList.aspx");
                }
                MessageBox.Show("删除成功");
            }
            //点击修改，跳转到datadicTypeModify,并且将ddTypeId作为参数传过去
            else if (e.CommandName == "modify")
            {
                string url;
                url = "datadicTypeSave.aspx?ddTypeId=" + e.CommandArgument;
                Response.Redirect(url);
            }
            MessageBox.Show("修改成功");
        }

        protected void datadicTypeAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("datadicTypeSave.aspx");
            MessageBox.Show("添加成功");
        }

        protected void AspNetPagerDatadicTypeList_PageChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        //绑定数据源
        public void BindGrid()
        {
            this.AspNetPagerDatadicTypeList.RecordCount = datadicTypeDao.GetAllCount();
            int pageIndex = this.AspNetPagerDatadicTypeList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerDatadicTypeList.PageSize = 5;
            listDatadicType.DataSource = datadicTypeDao.getDatadicType(pageIndex, pageSize);
            listDatadicType.DataBind();
        }
    }
}