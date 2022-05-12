using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace ShopAhoy.DAL
{
    public class useraccount
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        
        public DataSet SelectOrders(string id) 
        {

            DataSet ds = new DataSet(); 
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd;
            try
            {
                string query = "select*from Shop_Ahoy.orderedProducts inner join Shop_Ahoy.Orders on orderedProducts.orderID=Orders.OrderId where OrderStatus='Delivered' and customerID=";
                query += id;
                query = "select*from Shop_Ahoy.Products";
                cmd = new SqlCommand(query, con);  ///account information retrieval?? or AccountInformation
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); 
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; 

        }
    }

}