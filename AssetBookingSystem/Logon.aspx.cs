
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
using FormsAuth;
using System.Web.Security;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;

namespace AssetBookingSystem
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CancelInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.sworcs.ac.uk");
        }

       
        //method for log in button
        protected void ConfirmInsert_Click(object sender, EventArgs e)
        {
            // Path to LDAP directory server.
            try
            {
                //if text campus name is evesham, use the evesham domain
                if (txtCampus.Text == ("Evesham"))
                {
                    string adPath = "LDAP://evesham.ac.uk";

                    LdapAuthentication adAuth = new LdapAuthentication(adPath);

                    try
                    {
                        //if user is authenticated 
                        if (true == adAuth.IsAuthenticated(txtCampus.Text,
                                                          TextUserName.Text,
                                                          TextPassword.Text))
                        {
                            // Retrieve the user's groups
                            string groups = adAuth.GetGroups();
                            // Create the authetication ticket

                            if (groups.Contains("EveshamCampusStudents") || groups.Contains("MalvernCampusStudents"))
                            {
                                FormsAuthenticationTicket authTicket =
                                    new FormsAuthenticationTicket(1,  // version
                                                                  TextUserName.Text,
                                                                  DateTime.Now,
                                                                  DateTime.Now.AddSeconds(3),
                                                                  false, groups);

                                // Now encrypt the ticket.
                                string encryptedTicket =
                                  FormsAuthentication.Encrypt(authTicket);
                                // Create a cookie and add the encrypted ticket to the
                                // cookie as data.
                                HttpCookie authCookie =
                                             new HttpCookie(FormsAuthentication.FormsCookieName,
                                                            encryptedTicket);
                                // Add the cookie to the outgoing cookies collection.
                                Response.Cookies.Add(authCookie);
                            }
                            else
                            {
                                FormsAuthenticationTicket authTicket =
                                    new FormsAuthenticationTicket(1,  // version
                                                                  TextUserName.Text,
                                                                  DateTime.Now,
                                                                  DateTime.Now.AddMinutes(20),
                                                                  false, groups);

                                // Now encrypt the ticket.
                                string encryptedTicket =
                                  FormsAuthentication.Encrypt(authTicket);
                                // Create a cookie and add the encrypted ticket to the
                                // cookie as data.
                                HttpCookie authCookie =
                                             new HttpCookie(FormsAuthentication.FormsCookieName,
                                                            encryptedTicket);
                                // Add the cookie to the outgoing cookies collection.
                                Response.Cookies.Add(authCookie);

                            }



                            //here, we will need to check if the staff belong in our database.
                            //is not, we will need to get the information os the user from AD and insert it into our database
                            //if user does not exists in our database, they will not be able to book an asset as the system cannot insert the booking due to table relation

                            //we first need to get the staff table, then get the staff ID. That will be compared with the ID the user provided.  
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

                            //create new list to store count
                            List<int> countList = new List<int>();

                            while (reader.Read())
                            {

                                DataRow dataRow = table.NewRow();
                                //while reading, get the username provided by the user
                                //and get the staff ID from the table
                                string loggedUserName = TextUserName.Text;
                                string userName = Convert.ToString(reader["StaffID"]);
                                string name = Convert.ToString(reader["StaffName"]);

                                dataRow["StaffID"] = userName;
                                dataRow["StaffName"] = name;
                                table.Rows.Add(dataRow);

                                //for each row in the table
                                foreach (DataRow dc in table.Rows)
                                {

                                    //compare to see if the username and ID matech
                                    if (loggedUserName == userName)
                                    {
                                        //if so, add 1 to the list
                                        countList.Add(1);
                                    }
                                    
                                }
                            }
                            //if the list is less than 1, it means the staff doesnt exists in the table.
                            //in this case, we will need to get the staff information from AD and insert it into the table
                            if (countList.Count < 1)
                            {
                                
                                    // enter AD settings
                                    PrincipalContext AD = new PrincipalContext(ContextType.Domain, "evesham.ac.uk");

                                    // create search user and add criteria
                                    UserPrincipal u = new UserPrincipal(AD);
                                    u.SamAccountName = TextUserName.Text;

                                    // search for user
                                    PrincipalSearcher search = new PrincipalSearcher(u);
                                    UserPrincipal result = (UserPrincipal)search.FindOne();
                                    search.Dispose();

                                    // store the user name
                                    string fullName = result.DisplayName;
                                    string userName = TextUserName.Text;
                                


                                    //connect to the database, and insert the staff detail
                                    string co = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                                    SqlConnection staffCon = new SqlConnection(co);
                                    string query = "INSERT INTO tblStaff (StaffID, StaffName)";
                                    query += " VALUES (@userName, @fullName)";

                                    SqlCommand insertStaff = new SqlCommand(query, staffCon);
                                    insertStaff.Parameters.AddWithValue("@userName", userName);
                                    insertStaff.Parameters.AddWithValue("@fullName", fullName);

                                    //open connection, excute query the close connection.
                                    staffCon.Open();
                                    insertStaff.ExecuteNonQuery();
                                    staffCon.Close();
                            }




                            reader.Close();
                            con.Close();



                            // Redirect the user to the originally requested page
                            //if the person belongs to an admin group, then redirect to admin page
                            if (groups.Contains("a18"))
                            {
                                Response.Redirect("IndexManage.aspx");
                            }
                            //if a person belongs to student group, redirect to information page
                            if (groups.Contains("EveshamCampusStudents") || groups.Contains("MalvernCampusStudents"))
                            {
                                //lblStudentlogError.Visible = true;
                                Response.Redirect("StudentLogInAttempt.aspx");
                            }
                            //otherwise, redirect to normal booking page. 

                            else
                            {
                                Response.Redirect("Index.aspx");
                            }
                                                                                       
                        }

                    }
                    catch
                    {
                        lblError.Visible = true;
                    }

                }




                //if the user is trying to log into malvern domain, do the same job as above, but using malvern domain for ldap
                else
                {
                    string adPath = "LDAP://malvern.ac.uk";


                    LdapAuthentication adAuth = new LdapAuthentication(adPath);

                    try
                    {
                        if (true == adAuth.IsAuthenticated(txtCampus.Text,
                                                          TextUserName.Text,
                                                          TextPassword.Text))
                        {
                            // Retrieve the user's groups
                            string groups = adAuth.GetGroups();
                            // Create the authetication ticket
                            FormsAuthenticationTicket authTicket =
                                new FormsAuthenticationTicket(1,  // version
                                                              TextUserName.Text,
                                                              DateTime.Now,
                                                              DateTime.Now.AddMinutes(60),
                                                              false, groups);
                            // Now encrypt the ticket.
                            string encryptedTicket =
                              FormsAuthentication.Encrypt(authTicket);
                            // Create a cookie and add the encrypted ticket to the
                            // cookie as data.
                            HttpCookie authCookie =
                                         new HttpCookie(FormsAuthentication.FormsCookieName,
                                                        encryptedTicket);
                            // Add the cookie to the outgoing cookies collection.
                            Response.Cookies.Add(authCookie);



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

                            List<int> countList = new List<int>();

                            while (reader.Read())
                            {

                                DataRow dataRow = table.NewRow();

                                string loggedUserName = TextUserName.Text;
                                string userName = Convert.ToString(reader["StaffID"]);
                                string name = Convert.ToString(reader["StaffName"]);

                                dataRow["StaffID"] = userName;
                                dataRow["StaffName"] = name;
                                table.Rows.Add(dataRow);


                                foreach (DataRow dc in table.Rows)
                                {


                                    if (loggedUserName == userName)
                                    {
                                        countList.Add(1);
                                    }

                                }
                            }
                            if (countList.Count < 1)
                            {



                                // enter AD settings
                                PrincipalContext AD = new PrincipalContext(ContextType.Domain, "malvern.ac.uk");

                                // create search user and add criteria
                                UserPrincipal u = new UserPrincipal(AD);
                                u.SamAccountName = TextUserName.Text;

                                // search for user
                                PrincipalSearcher search = new PrincipalSearcher(u);
                                UserPrincipal result = (UserPrincipal)search.FindOne();
                                search.Dispose();

                                // show some details
                                string fullName = result.DisplayName;
                                string userName = TextUserName.Text;



                                //if so, the user is trying to book the asset, so insert new record into the booking table
                                string co = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                                SqlConnection staffCon = new SqlConnection(co);
                                string query = "INSERT INTO tblStaff (StaffID, StaffName)";
                                query += " VALUES (@userName, @fullName)";

                                SqlCommand insertStaff = new SqlCommand(query, staffCon);
                                insertStaff.Parameters.AddWithValue("@userName", userName);
                                insertStaff.Parameters.AddWithValue("@fullName", fullName);

                                //open connection, excute query the close connection.
                                staffCon.Open();
                                insertStaff.ExecuteNonQuery();
                                staffCon.Close();
                            }




                            reader.Close();
                            con.Close();


                            // Redirect the user to the originally requested page
                            //if the person belongs to an admin group, then redirect to admin page
                            if (groups.Contains("a18"))
                            {
                                Response.Redirect("IndexManage.aspx");
                            }
                            //if a person belongs to student group, redirect to information page
                            if (groups.Contains("EveshamCampusStudents") || groups.Contains("MalvernCampusStudents"))
                            {
                                Response.Redirect("StudentLogInAttempt.aspx");
                            }
                            //otherwise, redirect to normal booking page. 
                            else
                            {
                                Response.Redirect("Index.aspx");
                            }
                            //FormsAuthentication.GetRedirectUrl(TextUserName.Text,
                            //                                   false));

                        }

                    }
                    catch
                    {
                        lblError.Visible = true;
                    }

                }
            }
            catch
            {
                lblError.Visible = true;
            }

        }

        
    }
}
        