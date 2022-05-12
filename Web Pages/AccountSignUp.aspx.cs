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
    public partial class AccountSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)//this is not valid
            {
                Response.Redirect("UserAccount.aspx");
            }
            invalid.Visible = false;
        }

        protected void CreateAccount(object sender, EventArgs e)
        {
            string[] enteredDetails = { "", "", "", "", "", "", "", "" };
            enteredDetails[0] = textbox2.Text.Trim();
            enteredDetails[1] = textbox4.Text.Trim();
            enteredDetails[2] = textbox3.Text.Trim();
            enteredDetails[3] = textbox5.Text.Trim();
            enteredDetails[4] = textbox6.Text.Trim();
            enteredDetails[5] = "User";
            enteredDetails[7] = Calendar1.SelectedDate.ToString();

            //if (enteredDetails[0] != "" && enteredDetails[1] != "" && enteredDetails[2] != "" && enteredDetails[3] != "" && enteredDetails[4] != "" && enteredDetails[5] != "" && enteredDetails[6] != "" &&enteredDetails[7] != "")
            //{
                Signup_Login_DAL DALobj = new Signup_Login_DAL();
                int retCode = DALobj.checkSignupDetails(enteredDetails);
                if (retCode == -1)
                {
                    invalid.Visible = true;
                    invalid.Text = "Username already exists";
                }
                else if (retCode == -2)
                {
                    invalid.Visible = true;
                    invalid.Text = "This Email is already associated with another account";
                }
                else if (retCode == -3)
                {
                    invalid.Visible = true;
                    invalid.Text = "Passwords don't match";
                }
                else if (retCode == -4)
                {
                    invalid.Visible = true;
                    invalid.Text = "Password should be atleast 8 characters long, should have a digit and a special character";
                }
                else if (retCode == -5)
                {
                    invalid.Visible = true;
                    invalid.Text = "Email is not valid";
                }
                else if (retCode == 0)
                {
                    displayMessage(this, "Account Created");
                    Response.Redirect("~/AccountLogIn.aspx");
                }
            //}
            //else
            //{
            //    invalid.Visible = true;
            //    invalid.Text = "Information Not Entered";
            //}
        }

        static public void displayMessage(Control page, string msg)
        {
            string myscript = string.Format("altert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "myscript", myscript, true);
        }
    }
}