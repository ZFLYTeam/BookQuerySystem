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
            if (txtPassword.Text == txtPasswordAgain.Text)
            {
                User user = new User();
                user.UserName = txtUserName.Text;
                user.Password = txtPassword.Text;
                if (userDao.Exist(txtUserName.Text))
                {
                    lblError.Text = "用户名已存在，请重新输入";
                }
                else {
                    bool b = userDao.userAdd(user);
                    if (b)
                    {
                        Response.Redirect("login.aspx");
                    }
                    else
                    {
                        lblError.Text = "注册失败！";
                    }
                }
            }
            else {
                lblError.Text = "两次密码不一致，请重新输入！";
            }
        }
    }
}