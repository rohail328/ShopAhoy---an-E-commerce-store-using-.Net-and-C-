using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ShopAhoy.DAL;

namespace ShopAhoy
{
    public partial class LoginSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("UserAccount.aspx");
            }
            invalid.Visible = false;
        }

        protected void LoginButton4_Click(object sender, EventArgs e)
        {
            if (username.Text != "" && password.Text != "")
            {
                Signup_Login_DAL DALobj = new Signup_Login_DAL();
                int[] LoginDetails = DALobj.checkLoginDetails(username.Text.Trim(), password.Text.Trim());
                if (LoginDetails[0] >= 1)
                {
                    Session["username"] = Convert.ToString(LoginDetails[0]);
                    if (LoginDetails[1] == 0)
                    {
                        Response.Redirect("UserAccount.aspx");
                    }
                    else if (LoginDetails[1] == 1)
                    {
                        Response.Redirect("AdminAccount.aspx");
                    }
                }
                else
                {
                    invalid.Visible = true;
                }

            }
            else
            {
                invalid.Visible = true;
                invalid.Text = "Information Not Entered";
            }
        }

        static public void displayMessage(Control page,string msg)
        {
            string myscript = string.Format("altert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "myscript", myscript, true);
        }
    }
}