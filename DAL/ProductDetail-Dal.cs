using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ShopAhoy.DAL
{
    public class ProductDetail_Dal
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        public string[]productDetailsExtract(int id)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "getProductDetails";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
        
            string[] productInfo = { "","","","","","","" };
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@id", id);

                sqlcmd.Parameters.Add("@Name", SqlDbType.Char, 500);
                sqlcmd.Parameters["@Name"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@Brand", SqlDbType.Char, 500);
                sqlcmd.Parameters["@Brand"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@ratings", SqlDbType.Char, 500);
                sqlcmd.Parameters["@ratings"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@catagory", SqlDbType.Char, 500);
                sqlcmd.Parameters["@catagory"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@price", SqlDbType.Char, 500);
                sqlcmd.Parameters["@price"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@description", SqlDbType.Char, 500);
                sqlcmd.Parameters["@description"].Direction = ParameterDirection.Output;

                sqlcmd.Parameters.Add("@image", SqlDbType.Char, 500);
                sqlcmd.Parameters["@image"].Direction = ParameterDirection.Output;


                sqlcmd.ExecuteNonQuery();
                productInfo[0] = (string)sqlcmd.Parameters["@Name"].Value;
                productInfo[1] = (string)sqlcmd.Parameters["@Brand"].Value;
                productInfo[2] = (string)sqlcmd.Parameters["@ratings"].Value;
                productInfo[3] = (string)sqlcmd.Parameters["@catagory"].Value;
                productInfo[4] = (string)sqlcmd.Parameters["@price"].Value;
                productInfo[5] = (string)sqlcmd.Parameters["@description"].Value;
                productInfo[6] = (string)sqlcmd.Parameters["@image"].Value;

            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }


            return productInfo;
        }

        public int getProductStock(int id)
        {
            int amount = 0;
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "select NumberofItems from Shop_Ahoy.Stocks where ProductId=@id";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            sqlcmd.Parameters.AddWithValue("@id", id);
            try
            {
                amount =(int) sqlcmd.ExecuteScalar();
            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }

            return amount;
        }

        public void reviewSubmit(int prID,int usrID,int score, string review)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "insert into Shop_Ahoy.Rating values(@usrId,@prId,@review,@score,GETDATE())";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            sqlcmd.Parameters.AddWithValue("@usrId", usrID);
            sqlcmd.Parameters.AddWithValue("@prId", prID);
            sqlcmd.Parameters.AddWithValue("@review", review);
            sqlcmd.Parameters.AddWithValue("@score", score);
            try
            {
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

        public int addToCart(int pID,int usrID,int qty)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string sqlQuery = "AddToCart";
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sqlCon);
            int a = 0;
            try
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@login_id", usrID);
                sqlcmd.Parameters.AddWithValue("@pid", pID);
                sqlcmd.Parameters.AddWithValue("@qty", qty);
                sqlcmd.Parameters.Add("@op", SqlDbType.Int);
                sqlcmd.Parameters["@op"].Direction = ParameterDirection.Output;
                sqlcmd.ExecuteNonQuery();
                a = (int)sqlcmd.Parameters["@op"].Value;

            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }
            return a;
        }
    }
}