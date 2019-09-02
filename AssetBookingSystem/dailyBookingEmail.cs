
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
    public class EmailJob2 : IJob
    {
        //method for job 
        public void Execute(IJobExecutionContext context)
        {
            string cs3 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con3 = new SqlConnection(cs3);


            //create new sql command 
            SqlCommand cmd3 = new SqlCommand("procTomorrowBooking");

            //using reader 
            SqlDataReader reader3;
            //command type (sqlStored procedure)
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Connection = con3;



            //open connection and excute query 
            con3.Open();
            reader3 = cmd3.ExecuteReader();

            //create table in the memory to store returned value from the database
            DataTable reportTable1 = new DataTable();
            reportTable1.Columns.Add("ID");
            reportTable1.Columns.Add("Name");
            reportTable1.Columns.Add("Item");
            reportTable1.Columns.Add("StartDate");
            reportTable1.Columns.Add("EndDate");
            reportTable1.Columns.Add("StartTime");
            reportTable1.Columns.Add("EndTime");
            reportTable1.Columns.Add("Campus");
            reportTable1.Columns.Add("Room");
            reportTable1.Columns.Add("Arrengement");
            reportTable1.Columns.Add("Messege");


            while (reader3.Read())
            {
                //create dataRow for the following columns. 
                //at the same time as creating the rows, convert the data to int
                //so that we can check for condition.
                DataRow dataRow = reportTable1.NewRow();

                //datarow are bind to the table above.
                dataRow["ID"] = reader3["ID"];
                dataRow["Name"] = reader3["Name"];
                dataRow["Item"] = reader3["Item"];
                dataRow["StartDate"] = reader3["StartDate"];
                dataRow["EndDate"] = reader3["EndDate"];
                dataRow["StartTime"] = reader3["StartTime"];
                dataRow["EndTime"] = reader3["EndTime"];
                dataRow["Campus"] = reader3["Campus"];
                dataRow["Room"] = reader3["Room"];
                dataRow["Arrengement"] = reader3["Arrengement"];
                dataRow["Messege"] = reader3["Messege"];
                reportTable1.Rows.Add(dataRow);
            }

            //close the reader and connection (we dont have to close the connection here, but would be easier)
            reader3.Close();
            con3.Close();

            //create new gridview programatically
            GridView dailyEmailGridview = new GridView();
            //bind the data in the table to the gridview
            dailyEmailGridview.DataSource = reportTable1;
            dailyEmailGridview.DataBind();

            //if gridview rows is more greater than 0
            if (dailyEmailGridview.Rows.Count > 0)
            {
                try
                {
                    //build girdview to html  
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    dailyEmailGridview.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());

                    //provide relevant information to enable the application to send the gridview via e-mail.
                    MailMessage mailConfirm = new MailMessage("a18@sworcs.ac.uk", "a18@sworcs.ac.uk");
                    mailConfirm.Subject = "Asset Booking email ";
                    mailConfirm.Body = "Today's Booking<hr /><h3>Here are today's bookings:</h3> <hr />" + sw.ToString() + "<hr /> Thank you <br/> From the IT guys";
                    mailConfirm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "emailer.evesham.ac.uk";
                    smtp.Port = 25;
                    //send send the email to A18
                    smtp.Send(mailConfirm);

                }
                catch
                {

                }
            }

        }
        
    }

    //method for job Scheduler
    //this method will run the above job every 24 hours, on 00:00
    public class JobScheduler2
    {
        public static void Start()
        {
            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();

            IJobDetail job = JobBuilder.Create<EmailJob2>().Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithDailyTimeIntervalSchedule
                  (s =>
                     s.WithIntervalInHours(24)
                    .OnEveryDay()
                    .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(00, 00))
                  )
                .Build();

            scheduler.ScheduleJob(job, trigger);
        }
    }

}
    