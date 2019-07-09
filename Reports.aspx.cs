using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        outputUsername.Text = (string)Session["USERNAME"];
        if (outputUsername.Text.Length == 0)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void inputSearch_TextChanged(object sender, EventArgs e)
    {

    }

    protected void inputExportExcel_Click(object sender, EventArgs e)
    {

        this.ExportToExcel();
    }
    private void ExportToExcel()
    {
        try
        {
            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader("content-disposition", "attachment;filename=VisitorLogs_"+DateTime.Now.ToString()+".xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);


            //dataTable.DataSource = sdsvisito;
            dataTable.DataBind();

            //  PrepareForExport(GridView1);

            Table tb = new Table();
            TableRow tr1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Controls.Add(dataTable);
            tr1.Cells.Add(cell1);


            TableRow tr2 = new TableRow();

            tb.Rows.Add(tr1);

            tb.RenderControl(hw);

            // style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        catch (Exception err)
        {
            dv_error.Visible = true;
            lblerror.Text = err.Message.ToString();
        }
    }

}