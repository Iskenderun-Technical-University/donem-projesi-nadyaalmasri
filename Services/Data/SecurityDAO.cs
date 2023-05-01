using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EmlakProject.Models;

namespace EmlakProject.Services.Data
{
    public class SecurityDAO
    {
        string connectionString = "Data Source=.;Initial Catalog=emlakDB;Integrated Security=True";
        internal bool FindByUser(UserModel user)
        {
            //return (user.Username == "Admin" && user.Password == "secret");
            bool success = false;

            string queryString = "Select * from Agent where userEmail = @Email And userPassword = @Password";

            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString , connection);
                command.Parameters.Add("@Email"   , System.Data.SqlDbType.NVarChar,15).Value  = user.userEmail;
                command.Parameters.Add("@Password", System.Data.SqlDbType.NVarChar, 15).Value = user.userPassword;
                //try
                //{
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                        success = true;
                    else
                        success = false;
                    connection.Close();
                //}
                //catch(Exception e)
                //{
                //    Console.WriteLine(e.Message);
                //}
                return success;
            }
        }
    }
}