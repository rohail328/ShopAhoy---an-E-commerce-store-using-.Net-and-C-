using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace ShopAhoy.DAL
{
    public class adminpanel
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
       
        public DataSet Selectproducts() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Products]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }


        public DataSet Selectaccounts() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[AccountInformation]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }
        public DataSet Selectcategory() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Categories]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }

        public DataSet Selectorder() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Orders]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }

        public DataSet Selectstocks() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Stocks]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }

        public DataSet Selectshipment() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Shipment]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }

        public DataSet Selecttransaction() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(strcon); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from [Shop_Ahoy].[Transactions]", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
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

            return ds; //return the dataset
        }

          public int addproducts(string[] productInfo)
          {

            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            SqlCommand createproduct = new SqlCommand("Addproducts", sqlCon);
            int returnValue = 0;
            try
            {
                createproduct.CommandType = CommandType.StoredProcedure;
                createproduct.Parameters.AddWithValue("@name", productInfo[0]);
                createproduct.Parameters.AddWithValue("@brand", productInfo[1]);
                createproduct.Parameters.AddWithValue("@rating", productInfo[2]);
                createproduct.Parameters.AddWithValue("@category", productInfo[3]);
                createproduct.Parameters.AddWithValue("@description", productInfo[4]);
                createproduct.Parameters.AddWithValue("@price", productInfo[5]);
                createproduct.Parameters.AddWithValue("@image", productInfo[6]);
                createproduct.Parameters.AddWithValue("@stock", productInfo[7]);
                //createproduct.Parameters.Add("@message", SqlDbType.Char, 500);
                //createproduct.Parameters["@message"].Direction = ParameterDirection.Output;
                //createproduct.ExecuteNonQuery();
                //returnValue = (int)createproduct.Parameters["@message"].Value;
                returnValue = (int)createproduct.ExecuteScalar();
            }
            catch (SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }

            return returnValue;
        }
          public int deleteproducts(string productInfo)
          {

              SqlConnection sqlCon = new SqlConnection(strcon);
              sqlCon.Open();
              SqlCommand createproduct = new SqlCommand("Deleteproduct", sqlCon);
              int returnValue = 0;
              try
              {
                  createproduct.CommandType = CommandType.StoredProcedure;
                  createproduct.Parameters.AddWithValue("@name", productInfo);
                
                  //createproduct.Parameters.Add("@message", SqlDbType.Char, 500);
                  //createproduct.Parameters["@message"].Direction = ParameterDirection.Output;
                  //createproduct.ExecuteNonQuery();
                  //returnValue = (int)createproduct.Parameters["@message"].Value;
                  returnValue = (int)createproduct.ExecuteScalar();
              }
              catch (SqlException exception)
              {
                  Console.WriteLine("SQL Error" + exception.Message.ToString());
              }
              finally
              {
                  sqlCon.Close();
              }

              return returnValue;
          }
          public int editproducts(string [] productInfo)
          {

              SqlConnection sqlCon = new SqlConnection(strcon);
              sqlCon.Open();
              SqlCommand createproduct = new SqlCommand("Editproducts", sqlCon);
              int returnValue = 0;
              try
              {
                  createproduct.CommandType = CommandType.StoredProcedure;
                  createproduct.Parameters.AddWithValue("@name", productInfo[0]);
                  createproduct.Parameters.AddWithValue("@type", productInfo[1]);
                  createproduct.Parameters.AddWithValue("@change", productInfo[2]);
                  returnValue = (int)createproduct.ExecuteScalar();
              }
              catch (SqlException exception)
              {
                  Console.WriteLine("SQL Error" + exception.Message.ToString());
              }
              finally
              {
                  sqlCon.Close();
              }

              return returnValue;
          }

    }
}