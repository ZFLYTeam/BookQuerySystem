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
            }
            //点击修改，跳转到datadicTypeModify,并且将ddTypeId作为参数传过去
            else if (e.CommandName == "modify")
            {
                string url;
                url = "datadicTypeSave.aspx?ddTypeId=" + e.CommandArgument;
                Response.Redirect(url);
            }
        }

        protected void datadicTypeAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("datadicTypeSave.aspx");
        }

        protected void AspNetPagerDatadicTypeList_PageChanged(object sender, EventArgs e)
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
            this.AspNetPagerDatadicTypeList.RecordCount = datadicTypeDao.GetAllCount();
            int pageIndex = this.AspNetPagerDatadicTypeList.CurrentPageIndex - 1;
            int pageSize = this.AspNetPagerDatadicTypeList.PageSize = 5;
            listDatadicType.DataSource = datadicTypeDao.getDatadicType(pageIndex, pageSize);
            listDatadicType.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DatadicType datadicType = datadicTypeDao.findById(Convert.ToInt32(txtddTyId.Text));
            bool b = datadicTypeDao.datadicTypeDelete(datadicType);
            if (b)
            {
                Session["flag"] = "delSuccess";
                Response.Redirect("datadicTypeList.aspx");
            }
            else
            {
                Session["flag"] = "delFailure";
                Response.Redirect("datadicTypeList.aspx");
            };
        }
    }
}