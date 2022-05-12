using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopAhoy
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void openProduct(object sender, CommandEventArgs e)
        {
            Session["productDetails"] = (string)e.CommandArgument;
            Response.Redirect("~/ProductDetails.aspx");
        }
        protected void load_Catagory(object sender, EventArgs e)
        {
            //HyperLink catagory = (HyperLink)sender;
            System.Web.UI.HtmlControls.HtmlAnchor selectedC = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            char id = (char)selectedC.ID[1];
            Session["catagory"] = (char)id;
            Response.Redirect("~/ProductList.aspx");
        }


    }
}