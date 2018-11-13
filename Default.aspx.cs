using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void BSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchPokemon.aspx?q=" + Server.UrlEncode(TBSearch.Text));
    }

    protected void BRemove_Click(object sender, EventArgs e)
    {
        Response.Redirect("RemoveFromUsers.aspx");
    }
}