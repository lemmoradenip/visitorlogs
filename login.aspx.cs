using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.IO;
using System.Drawing;
using System.Text;

public partial class login : System.Web.UI.Page
{
    AUTH auth = new AUTH();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["USERNAME"] = string.Empty;
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            int validationresult = auth.ValidateAuth(inputEmail.Text.ToString(), inputPassword.Text.ToString());
            if (validationresult != 0)//*change later
            {
                //code to dismiss
                Session["USERNAME"] = inputEmail.Text.ToString();
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                dv_error.Visible = true;
                lblerror.Visible = true;
            }
        }
        catch (Exception error)
        {
            lblerror.Text = "Details:" + error.Message.ToString();
            lblerror.Visible = true;
            dv_error.Visible = true;
            //code to show error section
        }
    }
}