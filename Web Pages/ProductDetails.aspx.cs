using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopAhoy.DAL;
namespace ShopAhoy
{
    public partial class ProductDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label8.Visible = false;
            
            if (Session["username"] == null)
            {
                giveReview.Visible = false;
            }
            //else
            //{
            //    //check if the user has ordered this product before
            //}

            int id = Convert.ToInt32(Session["productDetails"]);
            ProductDetail_Dal DALobj = new ProductDetail_Dal();
            string[] productInfo = DALobj.productDetailsExtract(id);
            productImage.Src = productInfo[6];
            Label1.Text = productInfo[0];
            s1.Visible = false;
            s2.Visible = false;
            s3.Visible = false;
            s4.Visible = false;
            s5.Visible = false;
            invalid.Visible = false;
            int rating = (Convert.ToInt32(productInfo[2]));
            if (rating == 1)
            {
                s1.Visible = true;
            }
            else if (rating == 2)
            {
                s1.Visible = true;
                s2.Visible = true;
            }
            else if (rating == 3)
            {
                s1.Visible = true;
                s2.Visible = true;
                s3.Visible = true;
            }
            else if (rating == 4)
            {
                s1.Visible = true;
                s2.Visible = true;
                s3.Visible = true;
                s4.Visible = true;
            }
            else if (rating == 5)
            {
                s1.Visible = true;
                s2.Visible = true;
                s3.Visible = true;
                s4.Visible = true;
                s5.Visible = true;
            }
            price.Text = productInfo[4];
            Label2.Text = productInfo[3];
            Label3.Text = productInfo[5];
            Label4.Text = "Brand: "+productInfo[1];

            SqlDataSource1.SelectCommand += Session["productDetails"].ToString();

            int inStock = DALobj.getProductStock(id);
            if (inStock <= 0)
            {
                Label8.Visible = true;
                selectQuantity.Visible = false;
                add_to_cart.Visible = false;
            }
        }
        protected void increment(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(quantity.Text);
            if (count < 10)
            {
                count++;
            }
            quantity.Text = Convert.ToString(count);
        }

        protected void decrement(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(quantity.Text);
            if (count > 1)
            {
                count--;
            }
            quantity.Text = Convert.ToString(count);
        }

        protected void rate(object sender, CommandEventArgs e)
        {
            string arg = (string)e.CommandArgument;
            sa1.Attributes["class"] = "far fa-star";
            sa2.Attributes["class"] = "far fa-star";
            sa3.Attributes["class"] = "far fa-star";
            sa4.Attributes["class"] = "far fa-star";
            sa5.Attributes["class"] = "far fa-star";
            if (arg == "1")
            {
                sa1.Attributes["class"] = "fa fa-star";
            }
            else if (arg == "2")
            {
                sa1.Attributes["class"] = "fa fa-star";
                sa2.Attributes["class"] = "fa fa-star";
            }
            else if (arg == "3")
            {
                sa1.Attributes["class"] = "fa fa-star";
                sa2.Attributes["class"] = "fa fa-star";
                sa3.Attributes["class"] = "fa fa-star";
            }
            else if (arg == "4")
            {
                sa1.Attributes["class"] = "fa fa-star";
                sa2.Attributes["class"] = "fa fa-star";
                sa3.Attributes["class"] = "fa fa-star";
                sa4.Attributes["class"] = "fa fa-star";
            }
            else if (arg == "5")
            {
                sa1.Attributes["class"] = "fa fa-star";
                sa2.Attributes["class"] = "fa fa-star";
                sa3.Attributes["class"] = "fa fa-star";
                sa4.Attributes["class"] = "fa fa-star";
                sa5.Attributes["class"] = "fa fa-star";
            }
        }

        protected void rewviewSubmit_Click(object sender, EventArgs e)
        {
            int yourRating = 0;
            if (sa1.Attributes["class"] == "fa fa-star")
                yourRating++;
            if (sa2.Attributes["class"] == "fa fa-star")
                yourRating++;
            if (sa3.Attributes["class"] == "fa fa-star")
                yourRating++;
            if (sa4.Attributes["class"] == "fa fa-star")
                yourRating++;
            if (sa5.Attributes["class"] == "fa fa-star")
                yourRating++;

            int usrid = Convert.ToInt32(Session["username"]);
            int prid = Convert.ToInt32(Session["productDetails"]);
            string review = TextBox3.Text.Trim().ToString();
            ProductDetail_Dal DALobj = new ProductDetail_Dal();
            DALobj.reviewSubmit(prid, usrid, yourRating, review);
            Response.Redirect("~/ProductDetails.aspx");
        }

        protected void addToCart(object sender, EventArgs e)
        {
            int usrid = Convert.ToInt32(Session["username"]);
            int pid = Convert.ToInt32(Session["productDetails"]);
            int count = Convert.ToInt32(quantity.Text);
            ProductDetail_Dal DALobj = new ProductDetail_Dal();
            int a = DALobj.addToCart(pid, usrid, count);
            invalid.Visible = true;
            if (a == -1)
            {
                invalid.Text = "Not in Stocks";
            }
            else if (a == 1)
            {
                invalid.Text = "added to cart";
            }
        }
    }
    
}