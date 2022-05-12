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
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("AccountLogIn.aspx");
            }
            creditCard.Visible = false;
            invalid.Visible = false;
            setGrandTotal();
        }

        protected void paymentMethodSelecetd(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "Credit/Debit card Payment")
            {
                creditCard.Visible = true;
            }
        }

        protected void Placeorder(object sender, EventArgs e)
        {
            //invalid.Visible = false;
            string[] enteredDetails = { "", "", "", "" };
            enteredDetails[0] = TextBox5.Text.Trim();
            enteredDetails[1] = TextBox6.Text.Trim();
            if(RadioButtonList1.SelectedValue == "Credit/Debit card Payment")
            {
                enteredDetails[2] = "Online Payment";
                enteredDetails[3] = creditCard.Text.Trim();
            }
            else
            {
                enteredDetails[2] = "Cash on delivery";
            }


            int id = Convert.ToInt32(Session["username"]);
            PlaceOrder_DAL DALobj = new PlaceOrder_DAL();
            int retCode = DALobj.placeOrder(id, enteredDetails);
            if (retCode == -3)
            {
                invalid.Visible = true;
                invalid.Text = "no item in cart";
            }
            else if (retCode == 1)
            {
                invalid.Visible = true;
                invalid.Text = "Placed order";
            }

        }

        void setGrandTotal()
        {
            AccounInfo_DAL obj = new AccounInfo_DAL();
            int value = obj.getCartValue(Session["username"].ToString());
            Total.Text = value.ToString();
            shipCost.Text = "Rs.150";
        }

    }
}