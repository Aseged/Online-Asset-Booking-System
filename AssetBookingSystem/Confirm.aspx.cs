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

namespace AssetBookingSystem
{
    public partial class Confirm : System.Web.UI.Page
    {

        
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //when button clicked, redirect to main page
        protected void confirmBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
        //when button clicked, redired to college website
        protected void finishBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.sworcs.ac.uk");
        }
    }
}