using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AssetBookingSystem
{
    public partial class addROOM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConfirmInsert_Click(object sender, EventArgs e)
        {
            try
            {
                //open new connection and insert new Room record
                string co = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;

                SqlConnection insertRoom = new SqlConnection(co);
                string insert = "INSERT INTO tblROOMS (Room, Campus )";
                insert += "VALUES (@TextNewRoom, @CampusNew)";

                SqlCommand insertNewRoom = new SqlCommand(insert, insertRoom);

                insertNewRoom.Parameters.AddWithValue("@TextNewRoom", TextNewRoom.Text);
                insertNewRoom.Parameters.AddWithValue("@CampusNew", CampusNew.Text);

                insertRoom.Open();
                insertNewRoom.ExecuteNonQuery();
                insertRoom.Close();

                
            }
            catch
            {
                Response.Redirect("insertROOMsException.aspx");
            }
            Response.Redirect("manageROOMs.aspx");
        }

        protected void CancelInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndexManage.aspx");
        }
        

    }
}