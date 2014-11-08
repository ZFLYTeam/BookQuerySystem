using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
    public partial class BQS : System.Web.UI.MasterPage
    {
        User user=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = (User)Session["user"];
                lblUser.Text = user.UserName;
            }
            else 
            {
                Response.Redirect("index.aspx");
            }
            string date = DateTime.Now.ToString("yyyy年MM月dd日");
            string weekday = DateTime.Now.ToString("dddd");
            string time = DateTime.Now.ToString("hh:mm:ss");
            lblTime.Text = (date + " " + weekday + " " + time);
            //登录成功之后隐藏登录的入口
            //this.login.Style.Add("display", "none");
        }
    }
}