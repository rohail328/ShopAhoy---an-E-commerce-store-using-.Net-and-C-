using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopAhoy
{
    public partial class ShopAhoy : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                loginSignupLink.Visible = false;
            }
            else
            {
                HyperLink3.Visible = false;
            }
        }

        protected void load_Catagory(object sender, CommandEventArgs e)
        {
            Session["catagory"] = (string)e.CommandArgument;
            Response.Redirect("~/ProductList.aspx");
        }
        
        protected void searchProduct(object sender, EventArgs e)
        {
            if (TextBox1.Text.ToString() != "")
            {
                Session["search"] = TextBox1.Text.Trim().ToString();
                Response.Redirect("~/ProductList.aspx");
            }
        }
    }
}