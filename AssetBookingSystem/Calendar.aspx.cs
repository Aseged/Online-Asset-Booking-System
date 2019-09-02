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
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            //disable dates that are in the past

            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Gray;
            }
        }

        protected void CalendarView_SelectionChanged(object sender, EventArgs e)
        {
            //email checking for items to be collected within the next 15 minutes
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con = new SqlConnection(cs);


            //create new sql command 
            SqlCommand cmd = new SqlCommand("procFutureBooking");

            //using reader 
            SqlDataReader reader;
            //command type (sqlStored procedure)
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;



            //open connection and excute query 
            con.Open();
            reader = cmd.ExecuteReader();

            //create table in the memory to store returned value from the database
            DataTable reportTableEnd = new DataTable();
            reportTableEnd.Columns.Add("ID");
            reportTableEnd.Columns.Add("Name");
            reportTableEnd.Columns.Add("Item");
            reportTableEnd.Columns.Add("StartDate");
            reportTableEnd.Columns.Add("EndDate");
            reportTableEnd.Columns.Add("StartTime");
            reportTableEnd.Columns.Add("EndTime");
            reportTableEnd.Columns.Add("Campus");
            reportTableEnd.Columns.Add("Room");
            reportTableEnd.Columns.Add("Arrengement");
            reportTableEnd.Columns.Add("Messege");


            while (reader.Read())
            {
                //while the reader read the data, get the start date of the booking
                DateTime startDate = Convert.ToDateTime(reader["StartDate"]);
                        
                        //if the start date if equals to the selected date in the calendar, then show it in the gridview
                        if (CalendarView.SelectedDate == startDate)
                        {
               
                        //create dataRow for the following columns. 
                        //at the same time as creating the rows, convert the data to int
                        //so that we can check for condition.
                        DataRow dataRow1 = reportTableEnd.NewRow();


                        //datarow are bind to the table above.
                        dataRow1["ID"] = reader["ID"];
                        dataRow1["Name"] = reader["Name"];
                        dataRow1["Item"] = reader["Item"];
                        dataRow1["StartDate"] = reader["StartDate"];
                        dataRow1["EndDate"] = reader["EndDate"];
                        dataRow1["StartTime"] = reader["StartTime"];
                        dataRow1["EndTime"] = reader["EndTime"];
                        dataRow1["Campus"] = reader["Campus"];
                        dataRow1["Room"] = reader["Room"];
                        dataRow1["Arrengement"] = reader["Arrengement"];
                        dataRow1["Messege"] = reader["Messege"];
                        reportTableEnd.Rows.Add(dataRow1);

                   }
                        
                }


            //close database connection
            reader.Close();
            con.Close();
                        dayBookingDetails.DataSource = reportTableEnd;
                        dayBookingDetails.DataBind();

                        if (dayBookingDetails.Rows.Count >= 1)
                        {
                            dayBookingDetails.Visible = true;
                            hideDetails.Visible = true;
                            NoBooking.Visible = false;
                        }
                        else
                        {
                            NoBooking.Visible = true;
                            hideDetails.Visible = false;
                        }
        }


        //method for button click
        protected void hideDetails_Click(object sender, EventArgs e)
        {
            //if button clicked, hide gridview and button
            dayBookingDetails.Visible = false;
            hideDetails.Visible = false;
            NoBooking.Visible = false;
        }
         
    }
}