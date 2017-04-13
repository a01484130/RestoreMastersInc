using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Microsofties1
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            { 
            Calendar calendar = (Calendar)DetailsView1.FindControl("Calendar1");
            calendar.SelectedDate = DateTime.Today;
            DropDownList YearList = (DropDownList)DetailsView1.FindControl("YearList");

                YearList.Items.Clear();

                for (int year = 0; year > -30; year--)
                {
                    string targetYear = String.Format("{0}", DateTime.Now.Year + year);
                    YearList.Items.Add(new ListItem(targetYear, year.ToString()));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            DetailsView1.Visible = true;
            Button1.Visible = false;

        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView1.Visible = true;
            DetailsView1.Visible = false;
            Button1.Visible = true;
            if (e.CommandName == "Cancel")
            {
                DetailsView1.DataSource = null;
                DetailsView1.DataBind();
            }
            
        }
        protected void FileUpload1_Load(object sender, EventArgs e)
        {
            FileUpload FileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");
            Label lblFileName = (Label)DetailsView1.FindControl("Label6");
            if (FileUpload1.HasFile)
            {
                string path = Server.MapPath("~/Receipts/");
                lblFileName.Text = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(path + lblFileName.Text);
            }
        }

        protected void DownloadButton_Click(object sender, EventArgs e)
        {
            Button fileButton = (Button)sender;
            string fileName = fileButton.Text;
            string filePath = Server.MapPath("~/Receipts/") + fileName;
            FileInfo file = new FileInfo(filePath);
            if (file.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "text/plain";
                Response.Flush();
                Response.TransmitFile(file.FullName);
                Response.End();
            }
        }
        protected void YearList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calendar calendar = (Calendar)DetailsView1.FindControl("Calendar1");
            DropDownList YearList = (DropDownList)DetailsView1.FindControl("YearList");
            calendar.VisibleDate = DateTime.Now.AddYears(Convert.ToInt32(YearList.SelectedValue));
        }

    }
}