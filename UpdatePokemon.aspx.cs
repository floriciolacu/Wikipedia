using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdatePokemon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                string query = "SELECT IdDomain, Name, Description, Weight, Height"
                    + " FROM Article"
                    + " WHERE Id = @id";

                string query2 = "INSERT INTO Modificari (IdArticleM, IdDomainM, NameM, DescriptionM, WeightM, HeightM) VALUES (@id, IdDomain, Name, Description, Weight, Height)";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");
                SqlConnection con2 = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

                con.Open();
                con2.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id", ID);

                    SqlCommand com2 = new SqlCommand(query2, con2);
                    com2.Parameters.AddWithValue("id", ID);
                    /*while (reader.Read())
                    {
                        com.Parameters.AddWithValue("iddm", IdDomain);
                        com.Parameters.AddWithValue("namem", Name);
                        com.Parameters.AddWithValue("descm", Description);
                        com.Parameters.AddWithValue("weightm", Weight);
                        com.Parameters.AddWithValue("heightm", Height);
                    }*/

                    SqlDataReader reader = com.ExecuteReader();

                    while (reader.Read())
                    {
                        DDLDomain.SelectedValue = reader["IdDomain"].ToString();
                        TBName.Text = reader["Name"].ToString();
                        TBDescription.Text = reader["Description"].ToString();
                        TBWeight.Text = reader["Weight"].ToString();
                        TBHeight.Text = reader["Height"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database select error : " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            catch (Exception se)
            {
                LAnswer.Text = "Database connexion error : " + se.Message;
            }
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                int IDDomain = int.Parse(DDLDomain.SelectedValue);
                string name = TBName.Text;
                string description = TBDescription.Text;
                float weight = float.Parse(TBWeight.Text);
                float height = float.Parse(TBHeight.Text);

                string query = "UPDATE Article SET IdDomain = @id_domain, Name = @name, Description = @description, Weight = @weight, Height = @height"
                    + " WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id_domain", IDDomain);
                    com.Parameters.AddWithValue("name", name);
                    com.Parameters.AddWithValue("description", description);
                    com.Parameters.AddWithValue("weight", weight);
                    com.Parameters.AddWithValue("height", height);
                    com.Parameters.AddWithValue("id", ID);

                    com.ExecuteNonQuery();

                    // Do this only if update works:
                    LAnswer.Text = "Pokemon saved successfully!";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database update error : " + ex.Message;
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