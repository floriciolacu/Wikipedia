using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pokemons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string UserID = Session["UserId"].ToString();

            string query = "SELECT Id, UserName, EditAllow"
                    + " FROM AspNetUsers"
                    + " WHERE Id = @id";

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True");

            con.Open();
            try
            {
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("id", UserID);

                SqlDataReader reader = com.ExecuteReader();

                while (reader.Read())
                {
                    bool ok = (bool)reader["EditAllow"];

                    if (ok == false)
                    {
                        /*HL1.Visible = false;
                        HL2.Visible = false;
                        HL3.Visible = false;
                        HL4.Visible = false;
                        HL5.Visible = false;
                        HL6.Visible = false;
                        HL8.Visible = false;
                        HL9.Visible = false;
                        HL10.Visible = false;
                        HL11.Visible = false;*/
                        //Repeater1.FindControl("HL1").Visible = false;
                    }
                }
            }

            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
        catch (Exception se)
        {

        }
    }
}