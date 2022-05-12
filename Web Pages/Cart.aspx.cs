using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAhoy.DAL;

namespace ShopAhoy
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("AccountLogin.aspx");
            }
            SqlDataSource1.SelectCommand += Session["username"].ToString() + ")";
            setGrandTotal();
        }
        protected void removeProduct(object sender, CommandEventArgs e)
        {
            PlaceOrder_DAL obj = new PlaceOrder_DAL();
            int usrid = Convert.ToInt32(Session["username"]);
            int pid = Convert.ToInt32(e.CommandArgument);
            obj.removeProductFromCart(pid, usrid);
            Response.Redirect("Cart.aspx");
        }

        void setGrandTotal()
        {
            AccounInfo_DAL obj = new AccounInfo_DAL();
            int value = obj.getCartValue(Session["username"].ToString());
            Label3.Text = value.ToString();
        }
    }
}