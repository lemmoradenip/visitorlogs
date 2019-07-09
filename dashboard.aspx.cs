using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    Guest guest = new Guest();
    protected void Page_Load(object sender, EventArgs e)
    {
        outputUsername.Text = (string)Session["USERNAME"];
        if (outputUsername.Text.Length== 0)
        {
            Response.Redirect("login.aspx");
        }
        
    }

    protected void inputButton_Click(object sender, EventArgs e)
    {
        try
        {
            guest.Name = inputVisitorName.Text.ToString();
            guest.Company = inputCompany.Text.ToString();
            guest.Contactperson = inputPersontoVisit.Text.ToString();
            guest.Purpose = inputPurpose.SelectedValue.ToString();
            guest.Gender = inputGender.SelectedValue.ToString();
            guest.Mobile = inputMobile.Text.ToString();
            guest.Email = inputEmail.Text.ToString();
            guest.Notes = inputNotes.Text.ToString();
            guest.Createdby = outputUsername.Text.ToString();

            int affectedrecord = guest.AddGuest(0);
            if (affectedrecord > 0)
            {
                dv_error.Visible = false;
                dv_success.Visible = true;
                this.ClearFields();
                this.BindData();
            }
            else
            {
                dv_error.Visible = true;
                dv_success.Visible = false;
            }
        }
        catch (Exception error)
        {

            lblerror.Text = error.Message.ToString();
            dv_error.Visible = true;
            dv_success.Visible = false;
        }
    }
    private void ClearFields()
    {
        inputVisitorName.Text = string.Empty;
        inputCompany.Text = string.Empty;
        inputPersontoVisit.Text = string.Empty;
        inputMobile.Text = string.Empty;
        inputEmail.Text = string.Empty;
        inputNotes.Text = string.Empty;
        hfId.Value = string.Empty;

        this.BindData();//rebind the data of table
    }

    private void BindData()
    {
        outputVisitor.DataSourceID = "sdsvisito";
        outputVisitor.DataBind();
    }
    protected void inputReset_Click(object sender, EventArgs e)
    {
        this.ClearFields();
    }

    protected void inputVisitorOUT_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);
        try
        {
            hfId.Value = outputVisitor.Rows[i].Cells[1].Text.ToString(); // index of 1 hidden ID
            guest.Createdby = outputUsername.Text.ToString();
            int affectedrecord = guest.GuestOut(Convert.ToInt32(hfId.Value));
            if (affectedrecord > 0)
            {
                this.BindData();
                dv_errorlist.Visible = false;
            }
        }
        catch (Exception error)
        {
            lblerror_list.Text = error.Message.ToString();
            dv_errorlist.Visible = true;
        }
    }

    protected void inputVisitorVOID_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);
        try
        {
            hfId.Value = outputVisitor.Rows[i].Cells[1].Text.ToString(); // index of 1 hidden ID
            int affectedrecord = guest.DeleteGuest(Convert.ToInt32(hfId.Value));
            if (affectedrecord > 0)
            {
                this.BindData();
                dv_errorlist.Visible = false;
            }
        }
        catch (Exception error)
        {
            lblerror_list.Text = error.Message.ToString();
            dv_errorlist.Visible = true;
        }
    }

    protected void inputLogout_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = string.Empty;
        Response.Redirect("Login.aspx");

    }
}