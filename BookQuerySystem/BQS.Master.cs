using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookQuerySystem
{
    public partial class BQS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString("yyyy年MM月dd日");
            string weekday = DateTime.Now.ToString("dddd");
            string time = DateTime.Now.ToString("hh:mm:ss");
            lblTime.Text = (date + " " + weekday + " " + time);
            //登录成功之后隐藏登录的入口
            //this.login.Style.Add("display", "none");
        }
    }
}