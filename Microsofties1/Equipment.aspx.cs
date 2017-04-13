using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Microsofties1
{
    public partial class Equipment : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            DetailsView1.Visible = true;
            Button1.Visible = false;
        }

        protected void YearList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calendar calendar = (Calendar)DetailsView1.FindControl("Calendar1");
            DropDownList YearList = (DropDownList)DetailsView1.FindControl("YearList");
            calendar.VisibleDate = DateTime.Now.AddYears(Convert.ToInt32(YearList.SelectedValue));
        }

    }
}
