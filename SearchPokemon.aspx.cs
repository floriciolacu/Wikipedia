using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchPokemon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Request.Params["q"] != null)
        {
            string query = Server.UrlDecode(Request.Params["q"]);

            SDSSearch.SelectCommand = "SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain"
                + " WHERE DomainName LIKE @q OR Name LIKE @q";

            SDSSearch.SelectParameters.Clear();
            SDSSearch.SelectParameters.Add("q", "%" + query + "%");
            SDSSearch.DataBind();
        }
    }
}