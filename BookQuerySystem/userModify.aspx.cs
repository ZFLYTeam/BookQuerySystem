using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookQuerySystem;

namespace BookQuerySystem
{
    public partial class userModify : System.Web.UI.Page
    {
        UserDao userDao = new UserDao();
        User user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = (User)Session["user"];
                txtUserName.Text = user.UserName;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtOldPassword.Text = "";
            txtNewPassword.Text = "";
            txtNewPassword1.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Alertfail.Visible = false;
            AlertSuccess.Visible = false;
            if (user.Password == txtOldPassword.Text)
            {
                user.Password = txtNewPassword.Text;
                try
                {
                    userDao.userUpdate(user);
                    AlertSuccess.Visible = true;
                }
                catch
                {  
                }
            }
            else {
                Alertfail.Visible = true;
            }
        }
    }
}