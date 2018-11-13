using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeletePokemon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int ID = int.Parse(Request.Params["id"].ToString());

            string query = "SELECT DomainName, Name"
                + " FROM Article INNER JOIN Domain ON Article.IdDomain = Domain.Id"
                + " WHERE Article.Id = @id";

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

            con.Open();

            try
            {
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("id", ID);

                SqlDataReader reader = com.ExecuteReader();

                while (reader.Read())
                {
                    LName.Text = reader["Name"].ToString();
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

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                string query = "DELETE FROM Article WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id", ID);

                    com.ExecuteNonQuery();

                    PConfirm.Visible = false;
                    HLHomepage.Visible = true;
                    LAnswer.Text = "Pokemon deleted successfully!";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database delete error : " + ex.Message;
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

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pokemons.aspx");
    }

}
