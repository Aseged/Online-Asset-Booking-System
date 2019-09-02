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
    public partial class InsertNewAsset : System.Web.UI.Page
    {
            //SqlCommand con = new SqlCommand(@"Data Source=.\SQLExpress;Initial Catalog=AssetBookingSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {


        }
        //method for inserting new asset
        protected void ConfirmInsert_Click(object sender, EventArgs e)
        {
            try
            {
                //if the field has file
                if (ImageUpload.HasFile)
                {
                    //check if the file is valid format
                    string Extension = System.IO.Path.GetExtension(ImageUpload.FileName);
                    if (Extension.ToLower() != ".gif" &&
                        Extension.ToLower() != ".png" &&
                        Extension.ToLower() != ".jpg" &&
                        Extension.ToLower() != ".jpeg")
                    {
                        //if not, tell the user
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid image format');", true);
                    }
                    else
                    {
                        //otherwise, check if the file size exceed the allowed amount 
                        int FileSize = ImageUpload.PostedFile.ContentLength;
                        if (FileSize > 1048576)
                        {
                            //if so, tell the user
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Maximum file size exceeded');", true);
                        }
                        else
                        {
                            //if the file is valid, get the value in all fields and store them in string var
                                string file = "Image/" + Path.GetFileName(ImageUpload.PostedFile.FileName);

                                string arNumber = TextARNumber.Text;
                                string asset = TextAsset.Text;
                                string campus = CampusNew.Text;
                                string arrangement = MethodNew.Text;
                                string discription = TextDescriptions.Text;

                            //connect to the daabase 
                                string co = System.Configuration.ConfigurationManager.ConnectionStrings["AssetBookingSystemConnectionString"].ConnectionString;
                            //and insert the value to its corresponding column
                                SqlConnection newAssetCon = new SqlConnection(co);
                                string query = "INSERT INTO tblAssets (ARNumber, Asset, Campus, ObtainMethod, Descriptions, Images)";
                                query += " VALUES (@arNumber, @asset, @campus, @arrangement, @discription, @file)";

                                SqlCommand insertAsset = new SqlCommand(query, newAssetCon);
                                insertAsset.Parameters.AddWithValue("@arNumber", arNumber);
                                insertAsset.Parameters.AddWithValue("@asset", asset);
                                insertAsset.Parameters.AddWithValue("@campus", campus);
                                insertAsset.Parameters.AddWithValue("@arrangement", arrangement);
                                insertAsset.Parameters.AddWithValue("@discription", discription);
                                insertAsset.Parameters.AddWithValue("@file", file);

                                newAssetCon.Open();
                                insertAsset.ExecuteNonQuery();
                                newAssetCon.Close();
                                //return to the asset page
                                

                                ImageUpload.SaveAs(Server.MapPath("~/Image/" + ImageUpload.FileName));
                                Response.Redirect("AssetsManage.aspx");
                        }
                    }

                }

                
            }
            catch 
            {
                //if unable to insert asset, return to asset page.
                Response.Redirect("AssetsManage.aspx");          
            }

        }

        protected void CancelInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndexManage.aspx");
        }

        
    }
}