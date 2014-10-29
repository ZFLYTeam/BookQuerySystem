using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
    public partial class login : System.Web.UI.Page
    {
        UserDao userDao = new UserDao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Session.Abandon();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user=new User();
            user.UserName=txtUserName.Text;
            user.Password=txtPassword.Text;
            user=userDao.login(user);
            if (user != null)
            {
                Session["user"] = user;
                Response.Redirect("Default.aspx");
            }
            else {
                lblError.Text = "用户名或密码错误";
            }
        }
    }
}