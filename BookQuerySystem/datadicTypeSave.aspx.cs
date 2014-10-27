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
    * 作用:Datadic的跳转页面
    */
    public partial class datadicTypeSave : System.Web.UI.Page
    {
        //初始化一个datadicTypeDao
        DatadicTypeDao datadicTypeDao = new DatadicTypeDao();
        DatadicType datadicType = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int ddTypeId = Convert.ToInt32(Context.Request["ddTypeId"]);
            //根据datadicTypeList页面传过来的datadicTypeId从数据库中获取datadicType对象
            datadicType = datadicTypeDao.findById(ddTypeId);
            if (!IsPostBack)
            {
                if (Context.Request["ddTypeId"] == null)
                {
                    tb_ddTypeDesc.Text = "";
                    tb_ddTypeName.Text = "";
                }
                else
                {
                    tb_ddTypeName.Text = datadicType.DdTypeName;
                    tb_ddTypeDesc.Text = datadicType.DdTypeDesc;
                }
            }
        }

        protected void btn_modify_Click(object sender, EventArgs e)
        {
            bool b;
            if (Context.Request["ddTypeId"] != null)
            {
                datadicType.DdTypeId = Convert.ToInt32(Context.Request["ddTypeId"]);
                datadicType.DdTypeName = tb_ddTypeName.Text;
                datadicType.DdTypeDesc = tb_ddTypeDesc.Text;
                b = datadicTypeDao.datadicTypeUpdate(datadicType);
            }
            else
            {
                datadicType = new DatadicType();
                datadicType.DdTypeName = tb_ddTypeName.Text;
                datadicType.DdTypeDesc = tb_ddTypeDesc.Text;
                b = datadicTypeDao.datadicTypeAdd(datadicType);
            }
            MessageBox.Show("保存成功");
        }
    }
}