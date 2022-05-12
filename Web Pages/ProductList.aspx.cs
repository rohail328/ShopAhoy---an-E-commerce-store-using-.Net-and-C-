using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopAhoy
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["catagory"] != null)
            {
                //int id = Convert.ToInt32(Session["catagory"]);
                SqlDataSource1.SelectCommand = "select ProductId,ProductName,ProductBrand,ProductPrice,productImage from Shop_Ahoy.Products where ProductCategory = " + Session["catagory"].ToString();
            }
            if (Session["search"] != null)
            {
                SqlDataSource1.SelectCommand = "select ProductId,ProductName,ProductBrand,ProductPrice,productImage from Shop_Ahoy.Products where ProductName Like '%" + Session["search"].ToString() + "%' or ProductBrand Like '%" + Session["search"].ToString() + "%' or ProductDescription Like '%" + Session["search"].ToString() + "%'";
            }
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
        protected void sortItems(object sender, CommandEventArgs e)
        {
            string s = SqlDataSource1.SelectCommand.Replace(" order by ProductRating desc", "");
            s = s.Replace(" order by ProductPrice asc", "");
            s = s.Replace(" order by ProductName asc", "");
            SqlDataSource1.SelectCommand = s;

            if ((string)e.CommandArgument == "1")
            {
                SqlDataSource1.SelectCommand += " order by ProductRating desc";
            }
            else if((string)e.CommandArgument == "2")
            {
                SqlDataSource1.SelectCommand += " order by ProductPrice asc";
            }
            else if((string)e.CommandArgument == "3")
            {
                SqlDataSource1.SelectCommand += " order by ProductName asc";
            }
        }

        protected void filterItems(object sender, CommandEventArgs e)
        {
            string a="";
            if(SqlDataSource1.SelectCommand.EndsWith(" order by ProductRating desc"))
            {
                a = " order by ProductRating desc";
            }
            else if(SqlDataSource1.SelectCommand.EndsWith(" order by ProductPrice asc"))
            {
                a = " order by ProductPrice asc";
            }
            else if(SqlDataSource1.SelectCommand.EndsWith(" order by ProductName asc"))
            {
                a = " order by ProductName asc";
            }
            string s = SqlDataSource1.SelectCommand.Replace(" order by ProductRating desc", "");
            s = s.Replace(" order by ProductPrice asc", "");
            s = s.Replace(" order by ProductName asc", "");
            s = s.Replace(" where ProductPrice>500 and ProductPrice<=5000", "");
            s = s.Replace(" where ProductPrice>=50 and ProductPrice<=500", "");
            s = s.Replace(" where ProductPrice>5000", "");

            SqlDataSource1.SelectCommand = s;

            if ((string)e.CommandArgument == "1")
            {
                SqlDataSource1.SelectCommand += " where ProductPrice>=50 and ProductPrice<=500";
            }
            else if((string)e.CommandArgument == "2")
            {
                SqlDataSource1.SelectCommand += " where ProductPrice>500 and ProductPrice<=5000";
            }
            else if((string)e.CommandArgument == "3")
            {
                SqlDataSource1.SelectCommand += " where ProductPrice>5000";
            }
            SqlDataSource1.SelectCommand += a;
        }

    }
}