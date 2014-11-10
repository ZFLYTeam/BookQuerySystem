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
        { 
            //点击修改，跳转到datadicListModify,并且将ddId作为参数传过去
           if (e.CommandName == "modify")
            {
                string url;
                url = "datadicSave.aspx?ddId=" + e.CommandArgument;
                Response.Redirect(url);
            }
        }

        protected void datadicAdd_Click(object sender, EventArgs e)
        {

            Response.Redirect("datadicSave.aspx");
        }
        protected void AspNetPagerDatadicList_PageChanged(object sender, EventArgs e)
        {
            //各种提示不可视
            AlertAddSuccess.Visible = false;
            AlertModifySuccess.Visible = false;
            AlertDeleteSuccess.Visible = false;
            AlertDeleteFalure.Visible = false;
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

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            Datadic datadic = datadicDao.findById(Convert.ToInt32(ddIdTxt.Text));
            bool b=datadicDao.datadicDelete(datadic);
            if(b){
                Session["flag"] = "delSuccess";
                Response.Redirect("datadicList.aspx");
            }
            else {
                Session["flag"] = "delFailure";
                Response.Redirect("datadicList.aspx");
            };
        }
    }
}