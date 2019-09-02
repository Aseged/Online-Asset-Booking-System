
using Quartz;
using Quartz.Impl;

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
    public class EmailJob : IJob
    {
        public void Execute(IJobExecutionContext context)
        {
            string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con2 = new SqlConnection(cs2);


            //create new sql command 
            SqlCommand cmd2 = new SqlCommand("procStaffReminderBooking");

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

            GridView delieverEmailGridview = new GridView();
            delieverEmailGridview.DataSource = reportTable;
            delieverEmailGridview.DataBind();

            if (delieverEmailGridview.Rows.Count > 0)
            {
                try
                {
                    //change girdview to html  
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    delieverEmailGridview.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());

                    //provide relevant information to enable the application to send the gridview via e-mail.
                    MailMessage mailConfirm = new MailMessage("a18@sworcs.ac.uk", "a18@sworcs.ac.uk");
                    mailConfirm.Subject = "Asset Booking email";
                    mailConfirm.Body = " Assets Delivery<hr /><h3>The following assets are due to be delivered with in 15 minutes.:</h3> <hr />" + sw.ToString() + "<hr /> Thank you <br/> From the IT guys";
                    mailConfirm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "emailer.evesham.ac.uk";
                   
                    smtp.Port = 25;
                    smtp.Send(mailConfirm);

                }
                catch
                {
                    
                }
            }

                    
            //email checking for items to be collected within the next 15 minutes
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con = new SqlConnection(cs);


            //create new sql command 
            SqlCommand cmd = new SqlCommand("procStaffReminderBookingEnd");

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

            //close the reader and connection (we dont have to close the connection here, but would be easier)
            reader.Close();
            con.Close();

            //bind data to Gridview2 (the gridview will be attached and sent via email below.)
            GridView collectEmailGridview = new GridView();
            collectEmailGridview.DataSource = reportTableEnd;
            collectEmailGridview.DataBind();



            if (collectEmailGridview.Rows.Count > 0)
            {
                try
                {
                    //change girdview to html  
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    collectEmailGridview.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());

                    //provide relevant information to enable the application to send the gridview via e-mail.
                    MailMessage mailConfirm = new MailMessage("a18@sworcs.ac.uk", "a18@sworcs.ac.uk");
                    mailConfirm.Subject = "Asset Booking email";
                    mailConfirm.Body = "Assets Collection<hr /><h3>The following assets are due to be collected with in 15 minutes.:</h3> <hr />" + sw.ToString() + "<hr /> Thank you <br/> From the IT guys";
                    mailConfirm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "emailer.evesham.ac.uk";
                    smtp.Port = 25;
                    smtp.Send(mailConfirm);


                }
                catch
                {

                }
            }

            


        }
       
    }


    public class JobScheduler
    {
        public static void Start()
        {
            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();

            IJobDetail job = JobBuilder.Create<EmailJob>().Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithIdentity("trigger1", "group1")
                .StartNow()
                .WithSimpleSchedule(x => x
                    .WithIntervalInMinutes(6)
                    .RepeatForever())
                .Build();

            scheduler.ScheduleJob(job, trigger);
        }
    }

}