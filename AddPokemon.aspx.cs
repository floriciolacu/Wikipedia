using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

public partial class AddPokemon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                int IDDomain = int.Parse(DDLDomain.SelectedValue);
                string name = TBName.Text;
                string desc = TBDescription.Text;
                float weight = float.Parse(TBWeight.Text);
                float height = float.Parse(TBHeight.Text);

                int length = FileUpload1.PostedFile.ContentLength;
                byte[] pic = new byte[length];

                FileUpload1.PostedFile.InputStream.Read(pic, 0, length);

                string query = "INSERT INTO Article (IdDomain, Name, Description, Weight, Height, Picture)"
                    + " VALUES (@id_domain, @name, @description, @weight, @height, @photo)";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id_domain", IDDomain);
                    com.Parameters.AddWithValue("name", name);
                    com.Parameters.AddWithValue("description", desc);
                    com.Parameters.AddWithValue("weight", weight);
                    com.Parameters.AddWithValue("height", height);
                    com.Parameters.AddWithValue("photo", pic);

                    com.ExecuteNonQuery();

                    // Do this only if insert works:
                    LAnswer.Text = "New pokemon added successfully!";

                    DDLDomain.SelectedIndex = 0;
                    TBName.Text = "";
                    TBDescription.Text = "";
                    TBWeight.Text = "";
                    TBHeight.Text = "";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database insert error : " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            catch (SqlException se)
            {
                LAnswer.Text = "Database connexion error : " + se.Message;
            }
            catch (Exception ex)
            {
                LAnswer.Text = "Data conversion error : " + ex.Message;
            }
        }
    }
}