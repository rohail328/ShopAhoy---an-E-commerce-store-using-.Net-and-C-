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
    public partial class UserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userType.ReadOnly = true;
            if (Session["username"] == null)
            {
                Response.Redirect("AccountLogIn.aspx");
            }
            invalid.Visible = false;
            int id = Convert.ToInt32(Session["username"]);
            AccounInfo_DAL DALobj = new AccounInfo_DAL();
            string[] accountInfo = DALobj.LoadAccountInfo(id);
            username.Text = accountInfo[0];
            username.ReadOnly = true;
            email.Text = accountInfo[1];
            email.ReadOnly = true;
            name.Text = accountInfo[2];
            name.ReadOnly = true;
            dob.Text = accountInfo[3];
            dob.ReadOnly = true;
            loadOrders();
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AccountLogIn.aspx");
        }

        protected void SaveChange_Click(object sender, EventArgs e)
        {
            AccounInfo_DAL DALobj = new AccounInfo_DAL();
            int id = Convert.ToInt32(Session["username"]);

            int flag = DALobj.changeAccountPassword(id, pass.Text.Trim(), newPass.Text.Trim());
            if (flag == 0)
            {
                invalid.Text = "Password Changed Successfully";
            }
            else if (flag == 1)
            {
                invalid.Text = "Password should be atleast 8 characters long, should have a digit and a special character";
            }
            else if (flag == 2)
            {
                invalid.Text = "Invalid Old Password";
            }
            invalid.Visible = true;
        }

        static public void displayMessage(Control page, string msg)
        {
            string myscript = string.Format("altert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "myscript", myscript, true);
        }

        public void loadOrders()
        {
            AccounInfo_DAL obj = new AccounInfo_DAL();
            orders.DataSource = obj.SelectOrders(Session["username"].ToString());
            orders.DataBind();
        }
    }
}