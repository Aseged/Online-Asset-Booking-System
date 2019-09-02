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

    public partial class IndexManager : System.Web.UI.Page
    {

        //connection string 
        SqlCommand con = new SqlCommand(@"Data Source=.\SQLExpress;Initial Catalog=AssetBookingSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //if page refresh
            if (Page.IsPostBack)
            {
                //display message asking user to refresh the search result. 
                if (GridView1.Visible == true)
                {
                    LabelRefresh.Visible = true;
                }
                if (GridView1.Visible == false)
                {
                    ConfirmError.Visible = false;
                }
            }

        }
        //-----------------------------------------------------------------------------------------//
        //-----------------------------------------------------------------------------------------//
        //DONOT DELETE
        //if infromation change on the form, hide asset view until user clicks on 'Check asset' button
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ArrangementTextBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView1.DataBind();
        }
        protected void CampusTextBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView1.DataBind();
        }

        protected void StartDate_TextChanged(object sender, EventArgs e)
        {


            GridView1.Visible = false;
            GridView1.DataBind();

        }

        protected void FinishDate_TextChanged(object sender, EventArgs e)
        {



            GridView1.Visible = false;
            GridView1.DataBind();

        }

        protected void StartTime_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridView1.Visible = false;
            GridView1.DataBind();

        }

        protected void FinishTime_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridView1.Visible = false;
            GridView1.DataBind();

        }
        //-----------------------------------------------------------------------------------------//
        //-----------------------------------------------------------------------------------------//

        //make the last row of the gridview one column, so that we have enough space for the buttons. 
        protected void RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                int m = e.Row.Cells.Count;
                for (int i = m - 1; i >= 1; i += -1)
                {
                    e.Row.Cells.RemoveAt(i);
                }

                e.Row.Cells[0].ColumnSpan = m;
            }
        }
        //if user cancelled, redirect to the home page 
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.sworcs.ac.uk");
        }


        //-----------------------------------------------------------------------------------------//
        //-----------------------------------------------------------------------------------------//

        //event handler for 'check Avaiable asset' button
        protected void CheckAvailability_Click(object sender, EventArgs e)
        {

            //take text from start date and start time, and convert the date to 'Date' and the time to 'Time' format. 
            DateTime startDateTime = DateTime.ParseExact(StartDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            TimeSpan starttime = TimeSpan.ParseExact(StartTime.SelectedValue, "h\\:mm", CultureInfo.InvariantCulture);


            DateTime endDateTime = DateTime.ParseExact(FinishDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            TimeSpan endtime = TimeSpan.ParseExact(FinishTime.SelectedValue, "h\\:mm", CultureInfo.InvariantCulture);

            //check the date and time is valid. 

            //if the booking date equals today, allow booking but tell the user it is collection only.
            //if the time the user entered is invalid, hide gridview and display error message
                        
            if (((endtime <= starttime) && (endDateTime <= startDateTime)) || 
                (endDateTime < startDateTime) ||
                (endtime <= starttime) ||

                ((startDateTime <= DateTime.Now.Date) ||
                            (endDateTime < DateTime.Now.Date)) &&
                            ((starttime < DateTime.Now.TimeOfDay) ||
                            (endtime < DateTime.Now.TimeOfDay)))
            {
                timeError.Visible = true;
                GridView1.Visible = false;
            }
            
            else
            {
                timeError.Visible = false;
                GridView1.Visible = true;
            }
            //if the start date is todaye, the user is trying to book same day.
            //display message but allow booking
            if (startDateTime == DateTime.Now.Date)
            {
                SameDayBooking.Visible = true;
            }
            else
            {
                SameDayBooking.Visible = false;
            }


            //connection string  
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con = new SqlConnection(cs);
            //create new sql command 
            SqlCommand cmd = new SqlCommand();
            //using reader 
            SqlDataReader reader;
            //sql command text
            cmd.CommandText = "SELECT * FROM tblBooking";
            //command type (could be sqlStored procedure, or a command text, we have the text here )
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            //open connection and excute query 
            con.Open();
            reader = cmd.ExecuteReader();

            //create table in the memory to store returned value from the database
            DataTable table = new DataTable();
            table.Columns.Add("AssetID");
            table.Columns.Add("SDate");
            table.Columns.Add("FDate");
            table.Columns.Add("STime");
            table.Columns.Add("ETime");


            //while the reader is reading, perform the following.      
            while (reader.Read())
            {
                //create dataRow for the following columns. 
                //at the same time as creating the rows, convert the data to datetime, time, and int
                //so that we can check for condition.
                DataRow dataRow = table.NewRow();

                int assetID = Convert.ToInt32(reader["AssetID"]);

                DateTime startDate = Convert.ToDateTime(reader["StartDate"]);
                DateTime endDate = Convert.ToDateTime(reader["EndDate"]);

                TimeSpan startTime = (TimeSpan)reader["StartTime"];
                TimeSpan endTime = (TimeSpan)reader["EndTime"];

                //datarow are bind to the table above.
                dataRow["AssetID"] = assetID;
                dataRow["SDate"] = startDate;
                dataRow["FDate"] = endDate;
                dataRow["STime"] = startTime;
                dataRow["ETime"] = endTime;
                table.Rows.Add(dataRow);

                //iterate between the gridview rows and perform the following 
                foreach (GridViewRow gridViewRow in GridView1.Rows)
                {
                    //find the label and checkbox controls
                    Label LabelUnavailable = (Label)gridViewRow.FindControl("Label1");
                    CheckBox CheckBoxAsset = (CheckBox)gridViewRow.FindControl("CheckBox1");

                    //for every row the reader reads and row in the gridview loop, check for the follwing condtion. 
                    //the condition checks for time overlap between the time given by the user, 
                    //and the current row loaded.
                    if (((startDate <= startDateTime && startDateTime <= endDate)
                                                || (startDate <= endDateTime && endDateTime <= endDate)
                                                 || (startDate >= startDateTime && endDateTime >= endDate)
                                                 || (startDate <= startDateTime && endDateTime <= endDate))
                                                 &&
                                                 ((startTime <= starttime && starttime <= endTime)
                                             || (startTime <= endtime && endtime <= endTime)
                                             || (startTime >= starttime && endtime >= endTime)))
                    {

                        //get the asset ID which is in cell 1, and convert it to intiger
                        int getAssetID = Convert.ToInt32(gridViewRow.Cells[1].Text);

                        //if the asset ID in the gridview and the asset ID in the table above match
                        //the time overlap for that asset is found. do not give it as an option.
                        if (getAssetID == assetID)
                        {
                            //hide checkbox, and display label
                            CheckBoxAsset.Visible = false;
                            LabelUnavailable.Visible = true;
                        }
                        //Here, default value of the checkbox is set true, and label is false
                        //so if no booking is found in the table, no action will be taken
                    }
                }
            }

            //stop reading and return back to while loop
            reader.Close();
            //close database connection if no more data is available 
            con.Close();
        }


        //-----------------------------------------------------------------------------------------//
        //-----------------------------------------------------------------------------------------//


        //search active directory for logged in user email. we will use this later to send email
        private string uEmail(string uid)
        {
            DirectorySearcher dirSearcher = new DirectorySearcher();
            DirectoryEntry entry = new DirectoryEntry(dirSearcher.SearchRoot.Path);
            dirSearcher.Filter = "(&(objectClass=user)(objectcategory=person)(mail=" + uid + "*))";

            SearchResult srEmail = dirSearcher.FindOne();

            string propName = "mail";
            ResultPropertyValueCollection valColl = srEmail.Properties[propName];
            try
            {
                return valColl[0].ToString();
            }
            catch
            {
                return "";
            }
        }


        //event handler for 'confirm' button
        protected void Confirm_Click(object sender, EventArgs e)
        {

            //create a new list
            List<int> countList = new List<int>();
            //for each row, check if the checkbox is checked
            foreach (GridViewRow checkGrid in GridView1.Rows)
            {
                CheckBox CheckBoxAsset = (CheckBox)checkGrid.FindControl("CheckBox1");

                //if checked, then add 1 to the lsit
                if (CheckBoxAsset.Checked)
                {
                    countList.Add(1);
                }
            }
            //if the number in the list is less than 1, then display error. 
            //ask user to choose asset before booking.
            if (countList.Count < 1)
            {
                ConfirmError.Visible = true;
                GridView1.Visible = true;

            }
            else
            {


                //connection string  
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con = new SqlConnection(cs);
                //create new sql command 
                SqlCommand cmd = new SqlCommand();
                //using reader 
                SqlDataReader reader;
                //sql command text
                cmd.CommandText = "SELECT * FROM tblAssets";
                //command type (could be sqlStored procedure, or a command text, we have the text here )
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                //open connection and excute query 
                con.Open();
                reader = cmd.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable table = new DataTable();
                table.Columns.Add("AssetID");

                //while the reader is reading, perform the following.      
                while (reader.Read())
                {
                    //create dataRow for the following columns. 
                    //at the same time as creating the rows, convert the data to int
                    //so that we can check for condition.
                    DataRow dataRow = table.NewRow();

                    int assetID = Convert.ToInt32(reader["AssetID"]);

                    //datarow are bind to the table above.
                    dataRow["AssetID"] = assetID;
                    table.Rows.Add(dataRow);

                    //for each row in gridview                
                    foreach (GridViewRow checkedRows in GridView1.Rows)
                    {
                        //find the checkbox control
                        CheckBox CheckBoxAsset = (CheckBox)checkedRows.FindControl("CheckBox1");
                        //find the asset ID in the gridview 
                        int getAssetID = Convert.ToInt32(checkedRows.Cells[1].Text);

                        //if the asset ID in gridview matches the asset ID from the table 
                        if (getAssetID == assetID)
                        {
                            //then check if the ckeckbox is checked 
                            if (CheckBoxAsset.Checked)
                            {
                                try
                                {
                                    //get the user name and conver it to string 
                                    string userName = HttpContext.Current.User.Identity.Name;
                                    //if so, the user is trying to book the asset, so insert new record into the booking table
                                    string co = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                                    SqlConnection bookingCon = new SqlConnection(co);
                                    string query = "INSERT INTO tblBooking (StaffID, AssetID, StartDate, EndDate, StartTime, EndTime, Location, Messege, Arrengement)";
                                    query += " VALUES (@userName, @assetID, @StartDate, @FinishDate, @StartTime, @FinishTime, @RoomTextBox, @MessageTextBox, @ArrangementTextBox)";

                                    SqlCommand insertBooking = new SqlCommand(query, bookingCon);
                                    insertBooking.Parameters.AddWithValue("@userName", userName);
                                    insertBooking.Parameters.AddWithValue("@assetID", assetID);
                                    insertBooking.Parameters.AddWithValue("@StartDate", StartDate.Text);
                                    insertBooking.Parameters.AddWithValue("@FinishDate", FinishDate.Text);
                                    insertBooking.Parameters.AddWithValue("@StartTime", StartTime.Text);
                                    insertBooking.Parameters.AddWithValue("@FinishTime", FinishTime.Text);
                                    insertBooking.Parameters.AddWithValue("@RoomTextBox", RoomTextBox.Text);
                                    insertBooking.Parameters.AddWithValue("@MessageTextBox", MessageTextBox.Text);
                                    insertBooking.Parameters.AddWithValue("@ArrangementTextBox", ArrangementTextBox.Text);
                                
                                //open connection, excute query the close connection.
                                bookingCon.Open();
                                insertBooking.ExecuteNonQuery();
                                bookingCon.Close();
                                }
                                catch
                                {
                                    Response.Redirect("Exception2.aspx");
                                }
                            }

                        }
                    }

                }

                //stop reading and return back to while loop
                reader.Close();
                //close database connection if no more data is available 
                con.Close();


                //-----------------------------------------------------------------------------------------//
                //-----------------------------------------------------------------------------------------//

                //CONFIRMATION E-MAIL

                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                //create new connection using the connection string 
                SqlConnection con2 = new SqlConnection(cs2);


                //create new sql command 
                SqlCommand cmd2 = new SqlCommand("procNowBooking");

                //using reader 
                SqlDataReader reader2;
                //command type (sqlStored procedure)
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Connection = con2;



                //open connection and excute query 
                con2.Open();
                reader2 = cmd2.ExecuteReader();

                //create table in the memory to store returned value from the database
                DataTable reportTable = new DataTable();
                reportTable.Columns.Add("ID");
                reportTable.Columns.Add("Name");
                reportTable.Columns.Add("Item");
                reportTable.Columns.Add("StartDate");
                reportTable.Columns.Add("EndDate");
                reportTable.Columns.Add("StartTime");
                reportTable.Columns.Add("EndTime");
                reportTable.Columns.Add("Campus");
                reportTable.Columns.Add("Room");
                reportTable.Columns.Add("Arrengement");
                reportTable.Columns.Add("Messege");


                while (reader2.Read())
                {
                    //create dataRow for the following columns. 
                    //at the same time as creating the rows, convert the data to int
                    //so that we can check for condition.
                    DataRow dataRow2 = reportTable.NewRow();

                    //datarow are bind to the table above.
                    dataRow2["ID"] = reader2["ID"];
                    dataRow2["Name"] = reader2["Name"];
                    dataRow2["Item"] = reader2["Item"];
                    dataRow2["StartDate"] = reader2["StartDate"];
                    dataRow2["EndDate"] = reader2["EndDate"];
                    dataRow2["StartTime"] = reader2["StartTime"];
                    dataRow2["EndTime"] = reader2["EndTime"];
                    dataRow2["Campus"] = reader2["Campus"];
                    dataRow2["Room"] = reader2["Room"];
                    dataRow2["Arrengement"] = reader2["Arrengement"];
                    dataRow2["Messege"] = reader2["Messege"];
                    reportTable.Rows.Add(dataRow2);
                }

                //close the reader and connection (we dont have to close the connection here, but would be easier)
                reader2.Close();
                con2.Close();

                //bind data to Gridview2 (the gridview will be attached and sent via email below.)
                GridView2.DataSource = reportTable;
                GridView2.DataBind();

                try
                {
                    //change girdview to html
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    GridView2.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());

                    //provide relevant information to enable the application to send the gridview via e-mail.
                    MailMessage mailConfirm = new MailMessage("a18@sworcs.ac.uk", uEmail(HttpContext.Current.User.Identity.Name.Replace(@"sworcs.ac.uk\", ""))); 
                    //above, the first address is where the email is sent from, and the second is getting the user name of the logged in user
                    //then combining it with the domain to create the recipient address. 
                    mailConfirm.Subject = "Asset Booking email";
                    mailConfirm.Body = "Booking Confirmation<hr /><h2>Here is you booking detail:</h2> <hr />" + sw.ToString() + "<hr /> If the above detail is incorrect, please contact IT support. <br/> Thank you <br/> From the IT guys";
                    mailConfirm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "emailer.evesham.ac.uk";
                    smtp.Port = 25;
                    smtp.Send(mailConfirm);

                }
                catch
                {
                    //if any problem incountered sending confirmation email, tell the user.
                    Response.Redirect("Exception.aspx");

                }
                //if not confirm booking to the user
                Response.Redirect("Confirm.aspx");
            }
        }



        public override void VerifyRenderingInServerForm(Control control)
        {
            //this methode is to override exception raised when gridview is rendered to html form  
        }

        
        //-----------------------------------------------------------------------------------------//
        //-----------------------------------------------------------------------------------------//


    }
}




