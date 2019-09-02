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
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;


namespace AssetBookingSystem
{
    public partial class MyBooking : System.Web.UI.Page
    {

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

            //create a new list
            List<int> countList = new List<int>();
            //for each row, check if the checkbox is checked
            foreach (GridViewRow checkGrid in GridView1.Rows)
            {
                CheckBox CheckBoxdelete = (CheckBox)checkGrid.FindControl("CheckBoxdelete");

                //if checked, then add 1 to the lsit
                if (CheckBoxdelete.Checked)
                {
                    countList.Add(1);
                }

            }
            //if the number in the list is less than 1, the display error. 
            //ask user to choose asset before deleting.
            if (countList.Count < 1)
            {
                checkError.Visible = true;

            }
                //if count is more than 0, continue
            else
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con = new SqlConnection(cs);
                //create new sql command 
                SqlCommand cmd = new SqlCommand();
                //using reader 
                SqlDataReader reader;
                //sql command text
                cmd.CommandText = "SELECT * FROM tblBooking";
                //command type 
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                //open connection and excute query 
                con.Open();
                reader = cmd.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable table = new DataTable();
                table.Columns.Add("BookingID");


                while (reader.Read())
                {
                    int BookingID = Convert.ToInt32(reader["BookingID"]);

                    DataRow dataRow = table.NewRow();
                    dataRow["BookingID"] = BookingID;
                    table.Rows.Add(dataRow);
                    //for each row in the gridview, do the following
                    foreach (GridViewRow deleteRow in GridView1.Rows)
                    {
                        //find the checkbox control
                        CheckBox CheckBoxdelete = (CheckBox)deleteRow.FindControl("CheckBoxDelete");
                        //get the ID from cell 1
                        int gvID = Convert.ToInt32(deleteRow.Cells[1].Text);

                            //if the bookoing ID in the table matches the ID in gridview, then delete that row

                        if (CheckBoxdelete.Checked)
                        {
                            if (BookingID == gvID)
                            {
                                //connect to DB and delete the row
                                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;
                                SqlConnection deleteCon = new SqlConnection(cs2);
                                string query = "DELETE FROM tblBooking WHERE BookingID = @gvID";

                                SqlCommand deleteBooking = new SqlCommand(query, deleteCon);
                                deleteBooking.Parameters.AddWithValue("@BookingID", BookingID);
                                deleteBooking.Parameters.AddWithValue("@gvID", gvID);

                                deleteCon.Open();
                                deleteBooking.ExecuteNonQuery();
                                deleteCon.Close();
                                //refresh and return
                                Response.Redirect("MyBooking.aspx");
                            }
                        }
                    }
                }

                reader.Close();
                con.Close();
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            //the first IF statement look for the user in evesham domain
            
            if (!Page.IsPostBack)
            {

                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con2 = new SqlConnection(cs2);


                //create new sql command 
                SqlCommand cmd2 = new SqlCommand("procFutureBooking");

                //using reader 
                SqlDataReader reader2;
                //command type (sqlStored procedure)
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Connection = con2;

                con2.Open();
                reader2 = cmd2.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable table = new DataTable();
                table.Columns.Add("ID");
                table.Columns.Add("Name");
                table.Columns.Add("Item");
                table.Columns.Add("StartDate");
                table.Columns.Add("EndDate");
                table.Columns.Add("StartTime");
                table.Columns.Add("EndTime");
                table.Columns.Add("Room");

                while (reader2.Read())
                {

                    try
                    {
                        string getUserID = HttpContext.Current.User.Identity.Name;

                        //connect and get the name of the user from AD
                        PrincipalContext AD = new PrincipalContext(ContextType.Domain, "evesham.ac.uk");

                        // create search user and add criteria
                        UserPrincipal u = new UserPrincipal(AD);
                        u.SamAccountName = getUserID;

                        // search for user
                        PrincipalSearcher search = new PrincipalSearcher(u);
                        UserPrincipal result = (UserPrincipal)search.FindOne();
                        search.Dispose();

                        // store user name 
                        string fullName = result.DisplayName;
                        string BookingName = Convert.ToString(reader2["Name"]);

                        //if name of the user matches the name in the booking table, get it and bind it to the table.
                        if (BookingName == fullName)  
                        {

                            DataRow dataRow = table.NewRow();
                            dataRow["ID"] = reader2["ID"];
                            dataRow["Name"] = reader2["Name"];
                            dataRow["Item"] = reader2["Item"];
                            dataRow["StartDate"] = reader2["StartDate"];
                            dataRow["EndDate"] = reader2["EndDate"];
                            dataRow["StartTime"] = reader2["StartTime"];
                            dataRow["EndTime"] = reader2["EndTime"];
                            dataRow["Room"] = reader2["Room"];
                            table.Rows.Add(dataRow);
                        }
                    }

                    catch
                    {
                        //if cannot find, break out of the loop, in this case, show no booking avaiable
                        break;
                    }
                }
                reader2.Close();
                con2.Close();
                //bind the table to the gridview
                GridView1.DataSource = table;
                GridView1.DataBind();
            }


            //if the user cannot be founf in evesham domain, try the malvern domain. 
            if (!Page.IsPostBack)
            {

            string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con2 = new SqlConnection(cs2);


                //create new sql command 
                SqlCommand cmd2 = new SqlCommand("procFutureBooking");

                //using reader 
                SqlDataReader reader2;
                //command type (sqlStored procedure)
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Connection = con2;

                con2.Open();
                reader2 = cmd2.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable table = new DataTable();
                table.Columns.Add("ID");
                table.Columns.Add("Name");
                table.Columns.Add("Item");
                table.Columns.Add("StartDate");
                table.Columns.Add("EndDate");
                table.Columns.Add("StartTime");
                table.Columns.Add("EndTime");
                table.Columns.Add("Room");

                while (reader2.Read())
                {

                    try
                    {
                        //get the logged in username 
                        string getUserID = HttpContext.Current.User.Identity.Name;
                        //get the user name from AD
                        PrincipalContext AD = new PrincipalContext(ContextType.Domain, "malvern.ac.uk");

                        // create search user and add criteria
                        UserPrincipal u = new UserPrincipal(AD);
                        u.SamAccountName = getUserID;

                        // search for user
                        PrincipalSearcher search = new PrincipalSearcher(u);
                        
                        
                        UserPrincipal result = (UserPrincipal)search.FindOne();
                        search.Dispose();

                        // store user name 
                        string fullName = result.DisplayName;
                        string BookingName = Convert.ToString(reader2["Name"]);

                        // if the user name matches the name in the table, bind the data to the table.
                        if (BookingName == fullName)  
                        {

                            DataRow dataRow = table.NewRow();
                            dataRow["ID"] = reader2["ID"];
                            dataRow["Name"] = reader2["Name"];
                            dataRow["Item"] = reader2["Item"];
                            dataRow["StartDate"] = reader2["StartDate"];
                            dataRow["EndDate"] = reader2["EndDate"];
                            dataRow["StartTime"] = reader2["StartTime"];
                            dataRow["EndTime"] = reader2["EndTime"];
                            dataRow["Room"] = reader2["Room"];
                            table.Rows.Add(dataRow);
                        }


                    }

                    catch
                    {
                        //if cannot find, break out of the loop, in this case, show no booking avaiable
                        break;
                    }
                }
                reader2.Close();
                con2.Close();
                //bind table to the gridview 
                GridView2.DataSource = table;
                GridView2.DataBind();

            }

            //if either gridviews have a row
            if ((GridView2.Rows.Count > 0) || (GridView1.Rows.Count > 0))
            {
                //then check which gridview have the row and display it
                    if (GridView2.Rows.Count > 0)
                    {
                        GridView2.Visible = true;
                        noBookingError.Visible = false;
                        LinkButton2.Visible = true;
                    }
                    else
                    {
                        GridView1.Visible = true;
                        noBookingError.Visible = false;
                        LinkButton2.Visible = true;
                    }
            }
                //if neither gridview have row, then display a meesage and hide the gridveiw and button 
            else
            {
                        noBookingError.Visible = true;
                        LinkButton2.Visible = false;
            }


        }

    }
}