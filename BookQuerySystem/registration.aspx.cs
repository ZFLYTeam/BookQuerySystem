using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
    public partial class registration : System.Web.UI.Page
    {
        UserDao userDao = new UserDao();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.UserName = txtUserName.Text;
            user.Password = txtPassword.Text;
            bool b=userDao.userAdd(user);
            if (b)
            {
                Response.Redirect("login.aspx");
            }
            else {
                lblError.Text = "注册失败！";
            }
        }
    }
}