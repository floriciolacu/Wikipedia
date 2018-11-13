using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDomain : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        string idd = Request.Params["id"].ToString();
        SqlDataSource1.SelectParameters["IdDom"].DefaultValue = idd;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}