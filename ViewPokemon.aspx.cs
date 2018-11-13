using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class ViewPokemon : System.Web.UI.Page
    {

    protected void Page_Init(object sender, EventArgs e)
    {
        string ida = Request.Params["id"].ToString();
        SqlDataSource1.SelectParameters["IdArt"].DefaultValue = ida;
    }

    protected void Page_Load(object sender, EventArgs e)
        {
        if (Page.IsPostBack == false && Request.Params["id"] != null)
            {
                try
                {
                    int ID = int.Parse(Request.Params["id"].ToString());

                    string query = "SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain WHERE Article.Id = @id";
                    string query2 = "SELECT Titlu, Description FROM Chapter WHERE IdArticle = @id";

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

                        SqlDataReader reader = com.ExecuteReader();
                        SqlDataReader reader2 = com2.ExecuteReader();

                        while (reader.Read())
                        {
                            LName.Text = reader["Name"].ToString();
                            LDName.Text = reader["DomainName"].ToString();
                            LDesc.Text = reader["Description"].ToString();
                            LWeight.Text = reader["Weight"].ToString();
                            LHeight.Text = reader["Height"].ToString();
                            Image1.ImageUrl = "ImagePokemon.aspx?ImageID="+ID;
                        }

                }
                    catch (Exception ex)
                    {
                        LAnswer.Text = "Database select error : " + ex.Message;
                    }
                    finally
                    {
                        con.Close();
                        con2.Close();
                    }
                }
                catch (Exception se)
                {
                    LAnswer.Text = "Database connexion error : " + se.Message;
                }
            }
        }
    }