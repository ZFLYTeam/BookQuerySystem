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
    public partial class datadicSave : System.Web.UI.Page
    {
        //初始化一个datadicDao
        DatadicDao datadicDao = new DatadicDao();
        Datadic datadic = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int ddId = Convert.ToInt32(Context.Request["ddId"]);
            //根据datadicList页面传过来的datadicId从数据库中获取datadic对象
            datadic = datadicDao.findById(ddId);
            if (!IsPostBack)
            {
                if (Context.Request["ddId"] == null)
                {   
                    tb_ddtypeId.Text ="";
                    tb_ddDesc.Text = "";
                    tb_ddValue.Text = ""; 
                 
                }
                else
                {
                    tb_ddtypeId.Text = datadic.DdTypeId.ToString();
                    tb_ddValue.Text = datadic.DdValue;
                    tb_ddDesc.Text = datadic.DdDesc;
                }
            }
        }

        protected void btn_modify_Click(object sender, EventArgs e)
        {
            bool b;
            if (Context.Request["ddId"] != null)
            {
                datadic.DdId = Convert.ToInt32(Context.Request["ddId"]);
                datadic.DdTypeId =Convert.ToInt32(tb_ddtypeId.Text);
                datadic.DdValue = tb_ddValue.Text;
                datadic.DdDesc = tb_ddDesc.Text;
                b = datadicDao.datadicUpdate(datadic);
            }
            else
            {
                datadic = new Datadic();
                datadic.DdTypeId = Convert.ToInt32(tb_ddtypeId.Text);
                datadic.DdValue = tb_ddValue.Text;
                datadic.DdDesc = tb_ddDesc.Text;
                b = datadicDao.datadicAdd(datadic);
            }
            MessageBox.Show("保存成功");
        }

    }
}