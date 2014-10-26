using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookQuerySystem
{
    public partial class Bootstrap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void bt_comfirm_Click(object sender, EventArgs e)
        {
            Alert1.CssClass = "success";
            Alert1.Visible = true;
        }

    }
}