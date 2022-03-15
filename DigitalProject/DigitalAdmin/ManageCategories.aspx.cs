using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DigitalAdmin_ManageCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserIdValue.Text = Membership.GetUser().ProviderUserKey.ToString();
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["UserID"] = Membership.GetUser().ProviderUserKey;
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;
    }
}