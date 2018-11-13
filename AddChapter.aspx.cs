using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddChapter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            try
            {
                int IDArticle = int.Parse(Request.Params["id"].ToString());
                string title = TBTitlu.Text;
                string desc = TBDescription.Text;

                string query = "INSERT INTO Chapter (Titlu, Description, IdArticle)"
                    + " VALUES (@titlu, @description, @id_article)";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);

                    com.Parameters.AddWithValue("titlu", title);
                    com.Parameters.AddWithValue("description", desc);
                    com.Parameters.AddWithValue("id_article", IDArticle);

                    com.ExecuteNonQuery();

                    // Do this only if insert works:
                    LAnswer.Text = "New chapter added successfully!";

                    TBTitlu.Text = "";
                    TBDescription.Text = "";

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