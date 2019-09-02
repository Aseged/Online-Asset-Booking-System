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


namespace AssetBookingSystem
{
    public partial class ManageAllBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {

            //when button is clicked, create a new list
            List<int> countList = new List<int>();
            //for each row, check if the checkbox is checked
            foreach (GridViewRow checkGrid in GridView1.Rows)
            {
                CheckBox CheckBoxdelete = (CheckBox)checkGrid.FindControl("CheckBoxDelete");

                //if checked, then add 1 to the lsit
                if (CheckBoxdelete.Checked)
                {
                    countList.Add(1);
                }
                
            }
            //if the number in the list is less than 1, the display error. 
            //ask user to choose asset before booking.
            if (countList.Count < 1)
            {
                checkError.Visible = true;

            }
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
                    //create dataRow for the following columns. 
                    //at the same time as creating the rows, convert the data to datetime, time, and int
                    //so that we can check for condition.

                    //get all booking ID
                    int BookingID = Convert.ToInt32(reader["BookingID"]);

                    DataRow dataRow = table.NewRow();
                    dataRow["BookingID"] = BookingID;
                    table.Rows.Add(dataRow);
                    //for each row in the table
                    foreach (GridViewRow deleteRow in GridView1.Rows)
                    {
                        //find the checkbox control
                        CheckBox CheckBoxdelete = (CheckBox)deleteRow.FindControl("CheckBoxDelete");
                        //get the id of the asset in the gridview
                        int gvID = Convert.ToInt32(deleteRow.Cells[1].Text);

                        //if the checkox is checked
                        if (CheckBoxdelete.Checked)
                        {
                            //then check if the booking ID in the table matches the ID in the gridview. 
                            //this will insure that we are deleting the right row
                            if (BookingID == gvID)
                            {
                                //connect to the database, and delete the record
                                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                                SqlConnection deleteCon = new SqlConnection(cs2);

                                string query = "DELETE FROM tblBooking WHERE BookingID = @gvID";

                                SqlCommand deleteBooking = new SqlCommand(query, deleteCon);
                                deleteBooking.Parameters.AddWithValue("@BookingID", BookingID);
                                deleteBooking.Parameters.AddWithValue("@gvID", gvID);

                                deleteCon.Open();
                                deleteBooking.ExecuteNonQuery();
                                deleteCon.Close();
                            }
                        }
                    }


                }

                reader.Close();
                con.Close();

                //once done, close connction and retun back to the same page
                Response.Redirect("ManageAllBooking.aspx");
            }
        }
              
    }
}