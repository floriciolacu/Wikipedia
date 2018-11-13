using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _ViewPokemon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ImageID"] != null)
        {
            string strQuery = "select [Picture] from [Article] where [Id] = @id";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ImageID"]);
            DataTable dt = GetData(cmd);
            if (dt != null)
            {
                Byte[] bytes = (Byte[])dt.Rows[0]["Picture"];
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }
        }
    }
    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        //String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strConnString = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename='C:\Users\FLORY\Documents\Visual Studio 2015\WebSites\WebSite6\App_Data\aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d.mdf';Initial Catalog=aspnet-WebSite6-396f57ec-2e3d-4440-87bf-e049aa46a96d;Integrated Security=True";
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
        catch
        {
            return null;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
}
