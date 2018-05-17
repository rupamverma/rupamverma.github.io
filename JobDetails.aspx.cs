using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class JobDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
          var id = Request.QueryString["id"];
          if (id != null)
          {
              string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
              using (SqlConnection cn = new SqlConnection(scn))
              {
                  string bqry = "Select IJob_Id, VJob_Title,VJobs_Description,VLast_Date_To_Apply,INo_Of_Post,VQualification,IExperience from Available_Jobs where IJob_Id='{0}'";
                 
                  string qry = string.Format(bqry, id);
                  using (SqlCommand cmd = new SqlCommand(qry, cn))
                  {
                      SqlDataAdapter da = new SqlDataAdapter(cmd);
                      DataTable dt = new DataTable();
                      da.Fill(dt);
                      DetailsView1.DataSource = dt;
                      DetailsView1.DataBind();
                  }
              }
          }
   }
    protected void btnApply_Click(object sender, EventArgs e)
    {
        if(Request.QueryString["id"]!=null)
        {
            Response.Redirect("Resume.aspx?id=" + Request.QueryString["id"].ToString());
        }
    }
}
