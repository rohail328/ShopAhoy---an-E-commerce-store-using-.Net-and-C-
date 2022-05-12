using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ShopAhoy.DAL
{
    public class PlaceOrder_DAL
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
           
        public int placeOrder(int usrID, string[] details)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "PlaceOrder";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            int flag = 0;
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@Login_id", usrID);
                sqlcmd.Parameters.AddWithValue("@mobile", details[0]);
                sqlcmd.Parameters.AddWithValue("@address_", details[1]);
                sqlcmd.Parameters.AddWithValue("@pay_method", details[2]);
                sqlcmd.Parameters.AddWithValue("@cardnum", details[3]);
                sqlcmd.Parameters.Add("@op", SqlDbType.Int);
                sqlcmd.Parameters["@op"].Direction = ParameterDirection.Output;
                sqlcmd.ExecuteNonQuery();
                flag = (int)sqlcmd.Parameters["@op"].Value;
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

        public void removeProductFromCart(int pid,int usrid)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "remove_fromcart";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@login_id", usrid);
                sqlcmd.Parameters.AddWithValue("@p_id", pid);
                sqlcmd.Parameters.Add("@op", SqlDbType.Int);
                sqlcmd.Parameters["@op"].Direction = ParameterDirection.Output;
                sqlcmd.ExecuteNonQuery();

            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }


        }
    }
}