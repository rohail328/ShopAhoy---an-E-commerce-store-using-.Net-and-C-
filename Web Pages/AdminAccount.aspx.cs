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
    public partial class AdminAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userType.ReadOnly = true;
            if (Session["username"] == null)
            {
                Response.Redirect("AccountLogIn.aspx");
            }
            invalid.Visible = false;
            productadded.Visible = false;
            producteleted.Visible = false;
            productedited.Visible = false;
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
            loadproduct();
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

        protected void add_Click(object sender, EventArgs e)
        {
            string[] enteredDetails = { "", "", "", "", "", "", "", "" };
            enteredDetails[0] = pname.Text.Trim();
            enteredDetails[1] = brand.Text.Trim();
            enteredDetails[2] = rating.Text.Trim();
            enteredDetails[3] = category.Text.Trim();
            enteredDetails[4] = description.Text.Trim();
            enteredDetails[5] = price.Text.Trim();
            enteredDetails[6] = image.Text.Trim();
            enteredDetails[7] = stock.Text.Trim();


            adminpanel obj = new adminpanel();
            //int id = Convert.ToInt32(Session["username"]);

            int flag = obj.addproducts(enteredDetails);
            if (flag == -1)
            {
                productadded.Visible = true;
                productadded.Text = "Product already exists";
                displayMessage(this, "Product already exists");
                //Response.Redirect("~/AdminAccount.aspx");
            }
            if (flag == 0)
            {
                productadded.Visible = true;
                productadded.Text = "Product added successfully";
                displayMessage(this, "Product Added");
                //Response.Redirect("~/AdminAccount.aspx");
            }
            pname.Text = "";
            brand.Text = "";
            rating.Text = "";
            category.Text = "";
            description.Text = "";
            price.Text = "";
            image.Text = "";
            stock.Text = "";

        }
        protected void delete_Click(object sender, EventArgs e)
        {
            string enteredDetails;
            enteredDetails = delname.Text.Trim();
            adminpanel obj = new adminpanel();
            int id = Convert.ToInt32(Session["username"]);

            int flag = obj.deleteproducts(enteredDetails);
            if (flag == -1)
            {
                producteleted.Visible = true;
                producteleted.Text = "Product not found";
                displayMessage(this, "Product not found");
                Response.Redirect("~/AdminAccount.aspx");
            }
            if (flag == 0)
            {
                producteleted.Visible = true;
                producteleted.Text = "Product deleated successfully";
                displayMessage(this, "Product Deleated");
                Response.Redirect("~/AdminAccount.aspx");
            }
            delname.Text = "";

        }
        protected void edit_Click(object sender, EventArgs e)
        {
            string[] enteredDetails = { "", "", "", "", "", "", "", "" };
            enteredDetails[0] = edname.Text.Trim();
            enteredDetails[1] = change.SelectedItem.Text.Trim();
            enteredDetails[2] = changeline.Text.Trim();
            adminpanel obj = new adminpanel();
            int id = Convert.ToInt32(Session["username"]);

            int flag = obj.editproducts(enteredDetails);
            if (flag == -1)
            {
                productedited.Visible = true;
                productedited.Text = "Product not found";
                displayMessage(this, "Product not found");
                Response.Redirect("~/AdminAccount.aspx");
            }
            if (flag == 0)
            {
                productedited.Visible = true;
                productedited.Text = "Product edited successfully";
                displayMessage(this, "Product Edited");
                Response.Redirect("~/AdminAccount.aspx");
            }
            edname.Text = "";
            changeline.Text = "";

        }

        static public void displayMessage(Control page, string msg)
        {
            string myscript = string.Format("altert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "myscript", myscript, true);
        }

        public void loadproduct()
        {
            adminpanel objMyDal = new adminpanel();
            productview.DataSource = objMyDal.Selectproducts();//seting data source for this Grid
            productview.DataBind(); //bind the data source to this grid

            adminpanel obj2 = new adminpanel();
            accountsview.DataSource = obj2.Selectaccounts();
            accountsview.DataBind();

            adminpanel obj3 = new adminpanel();
            categoryview.DataSource = obj3.Selectcategory();
            categoryview.DataBind();

            adminpanel obj4 = new adminpanel();
            orderview.DataSource = obj4.Selectorder();
            orderview.DataBind();

            adminpanel obj5 = new adminpanel();
            stockview.DataSource = obj5.Selectstocks();
            stockview.DataBind();

            adminpanel obj6 = new adminpanel();
            shipmentview.DataSource = obj6.Selectshipment();
            shipmentview.DataBind();

            adminpanel obj7 = new adminpanel();
            transactionview.DataSource = obj7.Selecttransaction();
            transactionview.DataBind();


        }

    }
}