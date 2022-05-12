using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ShopAhoy.DAL
{
    public class AccounInfo_DAL
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        public string[]LoadAccountInfo(int accountID)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "GetDetails";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            string[] accountInfo = { "", "", "", "", "" };
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@id", accountID);

                sqlcmd.Parameters.Add("@userName", SqlDbType.Char, 500);
                sqlcmd.Parameters["@userName"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@Name", SqlDbType.Char, 500);
                sqlcmd.Parameters["@Name"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@email", SqlDbType.Char, 500);
                sqlcmd.Parameters["@email"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@DOB", SqlDbType.Char, 500);
                sqlcmd.Parameters["@DOB"].Direction = ParameterDirection.Output;

                sqlcmd.ExecuteNonQuery();
                accountInfo[0] = (string)sqlcmd.Parameters["@userName"].Value;
                accountInfo[1] = (string)sqlcmd.Parameters["@email"].Value;
                accountInfo[2] = (string)sqlcmd.Parameters["@Name"].Value;
                accountInfo[3] = (string)sqlcmd.Parameters["@DOB"].Value;

            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }

            return accountInfo;
        }

        public int changeAccountPassword(int accountID,string oldPass,string newPass)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "changePassword";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            int flag = 0;
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@id", accountID);
                sqlcmd.Parameters.AddWithValue("@oldPass", oldPass);
                sqlcmd.Parameters.AddWithValue("@newPass", newPass);
                sqlcmd.Parameters.Add("@flag", SqlDbType.Int);
                sqlcmd.Parameters["@flag"].Direction = ParameterDirection.Output;
                sqlcmd.ExecuteNonQuery();
                flag = (int)sqlcmd.Parameters["@flag"].Value;
            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }

            return flag;
        }

        public DataSet SelectOrders(string id)
        {

            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd;
            try
            {
                string query = "select OrderId,ProductId,quantity from Shop_Ahoy.History where CustomerId=";
                query += id;
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

        public int getCartValue(string id)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "select sum(ProductPrice*orderedproducts.qunatity)from Shop_Ahoy.products inner join shop_Ahoy.orderedproducts on orderedproducts.productid = products.productid inner join shop_ahoy.shoppingcart on shoppingcart.orderid = orderedproducts.orderid where orderedproducts.orderid = (select orderid from shop_ahoy.shoppingcart where cartID = ";
            sqlQuery = "select ISNULL( dbo.get_totalcart(";
            sqlQuery += id;
            sqlQuery += "),0)";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            int value = 0;
            try
            {
                value = (int)sqlcmd.ExecuteScalar();
            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }

            return value;
        }
    }
}