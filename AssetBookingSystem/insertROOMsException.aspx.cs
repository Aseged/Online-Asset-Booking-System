﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetBookingSystem
{
    public partial class insertROOMsException : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void goBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("addROOM.aspx");
        }
    }
}