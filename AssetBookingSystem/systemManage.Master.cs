using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Timers;
using System.Drawing;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Web.Security;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;

namespace AssetBookingSystem
{
    public partial class systemManage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            String loggedUserName = HttpContext.Current.User.Identity.Name;

            //connection string  
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con = new SqlConnection(cs);
                //create new sql command 
                SqlCommand cmd = new SqlCommand();
                //using reader 
                SqlDataReader reader;
                //sql command text
                cmd.CommandText = "SELECT * FROM tblStaff";
                //command type (could be sqlStored procedure, or a command text, we have the text here )
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                //open connection and excute query 
                con.Open();
                reader = cmd.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable table = new DataTable();
                table.Columns.Add("StaffID");
                table.Columns.Add("StaffName");


                while (reader.Read())
                {
                    DataRow dataRow = table.NewRow();

                    string userName = Convert.ToString(reader["StaffID"]);
                    string name = Convert.ToString(reader["StaffName"]);

                                    dataRow["StaffID"] = userName;
                                    dataRow["StaffName"] = name;
                                    table.Rows.Add(dataRow);

                                    try
                                    {

                                        foreach (DataRow dc in table.Rows)
                                        {


                                            if (loggedUserName == userName)
                                            {
                                                lblUserName.Text = "Hi  " + name;
                                            }
                                            
                                        }
                                    }
                                    catch
                                    {
                                        lblUserName.Text = "Hello " + HttpContext.Current.User.Identity.Name;
                                    }
                }


        }
    }
}
    
