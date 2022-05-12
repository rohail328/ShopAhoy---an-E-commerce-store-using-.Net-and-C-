using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ShopAhoy.DAL
{
    public class Signup_Login_DAL
    {
        private static readonly string strcon= ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        public int[] checkLoginDetails(string userNameOrEmail,string password)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            string query = "LoginAccount";
            SqlCommand searchUser = new SqlCommand(query, sqlCon);
            int[] returnValues = { -1, -1 };
            try
            {
                searchUser.Parameters.AddWithValue("@userNameOrEmail", userNameOrEmail);
                searchUser.Parameters.AddWithValue("@password", password);
                searchUser.CommandType = CommandType.StoredProcedure;
                int count = Convert.ToInt32(searchUser.ExecuteScalar());
                if (count >= 1)
                {
                    returnValues[0] = count;
                    string query1 = "select count(1) from Shop_Ahoy.AccountInformation where AccountId=@id and AccountType='admin'";
                    SqlCommand getType = new SqlCommand(query1, sqlCon);
                    getType.Parameters.AddWithValue("@id", count);
                    int Type = Convert.ToInt32(getType.ExecuteScalar());
                    returnValues[1] = Type;

                }
            }
            catch(SqlException exception)
            {
                Console.WriteLine("SQL Error" + exception.Message.ToString());
            }
            finally
            {
                sqlCon.Close();
            }
            return returnValues;
        }

        public int checkSignupDetails(string[] signUpInfo)
        {
            SqlConnection sqlCon = new SqlConnection(strcon);
            sqlCon.Open();
            SqlCommand createAccount = new SqlCommand("SignUp", sqlCon);
            int returnValue = 0;
            try
            {
                createAccount.Parameters.AddWithValue("@FullName", signUpInfo[0]);
                createAccount.Parameters.AddWithValue("@UserName", signUpInfo[1]);
                createAccount.Parameters.AddWithValue("@email", signUpInfo[2]);
                createAccount.Parameters.AddWithValue("@Pass", signUpInfo[3]);
                createAccount.Parameters.AddWithValue("@retypePass", signUpInfo[4]);
                createAccount.Parameters.AddWithValue("@AccTYPE", signUpInfo[5]);
                createAccount.Parameters.AddWithValue("@DOB", signUpInfo[6]);
                createAccount.CommandType = CommandType.StoredProcedure;

                returnValue = (int)createAccount.ExecuteScalar();
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