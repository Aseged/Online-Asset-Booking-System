using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetBookingSystem
{
    public partial class manageROOMs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //make the last row into one column 
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

        //when insert button is clicked, redirect to the insert new page
        protected void InsertNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("addROOM.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}