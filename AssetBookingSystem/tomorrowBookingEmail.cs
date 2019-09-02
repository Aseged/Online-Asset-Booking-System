
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
    public class EmailJob3 : IJob
    {
        public void Execute(IJobExecutionContext context)
        {
            string cs4 = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

            //create new connection using the connection string 
            SqlConnection con4 = new SqlConnection(cs4);


            //create new sql command 
            SqlCommand cmd4 = new SqlCommand("procTomorrowBookingWarn");

            //using reader 
            SqlDataReader reader4;
            //command type (sqlStored procedure)
            cmd4.CommandType = CommandType.StoredProcedure;
            cmd4.Connection = con4;



            //open connection and excute query 
            con4.Open();
            reader4 = cmd4.ExecuteReader();

            //create table in the memory to store returned value from the database
            DataTable reportTable2 = new DataTable();
            reportTable2.Columns.Add("ID");
            reportTable2.Columns.Add("Name");
            reportTable2.Columns.Add("Item");
            reportTable2.Columns.Add("StartDate");
            reportTable2.Columns.Add("EndDate");
            reportTable2.Columns.Add("StartTime");
            reportTable2.Columns.Add("EndTime");
            reportTable2.Columns.Add("Campus");
            reportTable2.Columns.Add("Room");
            reportTable2.Columns.Add("Arrengement");
            reportTable2.Columns.Add("Messege");


            while (reader4.Read())
            {
                //create dataRow for the following columns. 
                //at the same time as creating the rows, convert the data to int
                //so that we can check for condition.
                DataRow dataRow = reportTable2.NewRow();

                //datarow are bind to the table above.
                dataRow["ID"] = reader4["ID"];
                dataRow["Name"] = reader4["Name"];
                dataRow["Item"] = reader4["Item"];
                dataRow["StartDate"] = reader4["StartDate"];
                dataRow["EndDate"] = reader4["EndDate"];
                dataRow["StartTime"] = reader4["StartTime"];
                dataRow["EndTime"] = reader4["EndTime"];
                dataRow["Campus"] = reader4["Campus"];
                dataRow["Room"] = reader4["Room"];
                dataRow["Arrengement"] = reader4["Arrengement"];
                dataRow["Messege"] = reader4["Messege"];
                reportTable2.Rows.Add(dataRow);
            }

            //close the reader and connection (we dont have to close the connection here, but would be easier)
            reader4.Close();
            con4.Close();

            GridView dailyEmailGridview2 = new GridView();
            dailyEmailGridview2.DataSource = reportTable2;
            dailyEmailGridview2.DataBind();

            if (dailyEmailGridview2.Rows.Count > 0)
            {
                try
                {
                    //change girdview to html  
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    dailyEmailGridview2.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());

                    //provide relevant information to enable the application to send the gridview via e-mail.
                    MailMessage mailConfirm = new MailMessage("a18@sworcs.ac.uk", "a18@sworcs.ac.uk");
                    mailConfirm.Subject = "Asset Booking email";
                    mailConfirm.Body = "Tomorrow's Booking<hr /><h3>Here are tomorrow's booking:</h3> <hr />" + sw.ToString() + "<hr /> Thank you <br/> From the IT guys";
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
    //job scheduler to run at 4pm every day
    public class JobScheduler3
    {
        public static void Start()
        {
            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();

            IJobDetail job = JobBuilder.Create<EmailJob3>().Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithDailyTimeIntervalSchedule
                  (s =>
                     s.WithIntervalInHours(24)
                    .OnEveryDay()
                    .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(16, 00))
                  )
                .Build();

            scheduler.ScheduleJob(job, trigger);
        }
    }

}
