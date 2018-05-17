using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Session["user"] == null)
        {
            Response.Redirect("Login.aspx?id=loginRequired");
        }

        if (Request.QueryString["id"] != null)
        {
            if (Request.QueryString["id"].ToString() == "success")
            {
                tberror1.Text = "You have successfully Loged in.";
            }
        }
 

  string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
  using (SqlConnection cn = new SqlConnection(scn))
  {
      string bqry = "Select vMailId,vFn,vLn,vContacts,vQualification,iExperience,vCompany,vGender from tblUsers where vLoginId='{0}'";
      string loginid = Page.Session["user"].ToString();
      string qry = string.Format(bqry, loginid);
      using (SqlCommand cmd = new SqlCommand(qry, cn))
      {

          SqlDataAdapter adapter = new SqlDataAdapter(cmd); 
          DataTable dtCustomers = new DataTable();
          adapter.Fill(dtCustomers);

          DetailsView1.DataSource = dtCustomers;

          DetailsView1.DataBind();
      }
  }


    }
}