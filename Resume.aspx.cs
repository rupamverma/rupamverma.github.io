using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;


public partial class Resume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Session["user"] == null)
        {
            Response.Redirect("Login.aspx?id=LoginRequired");
        }
        string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(scn))
        {
            string bqry = "Select * from tblUsers where vLoginId= '{0}'";
            string loginid = Page.Session["user"].ToString();
            string qry = string.Format(bqry,loginid);
            using (SqlCommand cmd = new SqlCommand( qry, cn))
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    tbRName.Text = dr["vFn"].ToString() +" " + dr["vLn"].ToString();
                    tbRAddrs.InnerText = dr["vAddress"].ToString();
                    tbCNo.Text = dr["vContacts"].ToString();
                    tbREmail.Text = dr["vMailId"].ToString();

                }
                dr.Close();
                cn.Close();
            }
        }
    }
    protected void btnRSubmit_Click(object sender, EventArgs e)
    {
         string fileName = UploadResumeFile();
         string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
         using (SqlConnection cn = new SqlConnection(scn))
         {
             using (SqlCommand cmd = new SqlCommand("insertUserResume", cn))
             {
                 cn.Open();
                 try
                 {

                     cmd.CommandType = CommandType.StoredProcedure;
                     SqlParameter p1 = new SqlParameter("@name", SqlDbType.VarChar, 50);
                     p1.Value = tbRName.Text;
                     SqlParameter p2 = new SqlParameter("@address", SqlDbType.VarChar, 50);
                     p2.Value = tbRAddrs.InnerText;
                     SqlParameter p3 = new SqlParameter("@phone", SqlDbType.VarChar, 50);
                     p3.Value = tbCNo.Text;
                     SqlParameter p4 = new SqlParameter("@email", SqlDbType.VarChar, 50);
                     p4.Value = tbREmail.Text;
                     SqlParameter p5 = new SqlParameter("@Matric", SqlDbType.VarChar, 50);
                     p5.Value = tb10th.Text;
                     SqlParameter p6 = new SqlParameter("@inter", SqlDbType.VarChar, 50);
                     p6.Value = tb12th.Text;
                     SqlParameter p7 = new SqlParameter("@grad", SqlDbType.VarChar, 50);
                     p7.Value = tbGrd.Text;
                     SqlParameter p8 = new SqlParameter("@pGrad", SqlDbType.VarChar, 50);
                     p8.Value = tbPgrad.Text;
                     SqlParameter p9 = new SqlParameter("@resume", SqlDbType.VarChar, 50);

                     p9.Value = fileName;
                     string jobId = Request.QueryString["id"].ToString();
                     SqlParameter p10 = new SqlParameter("@jobId", SqlDbType.VarChar, 50);
                     p10.Value = jobId;
                     cmd.Parameters.Add(p1);
                     cmd.Parameters.Add(p2);
                     cmd.Parameters.Add(p3);
                     cmd.Parameters.Add(p4);
                     cmd.Parameters.Add(p5);
                     cmd.Parameters.Add(p6);
                     cmd.Parameters.Add(p7);
                     cmd.Parameters.Add(p8);
                     cmd.Parameters.Add(p9);
                     cmd.Parameters.Add(p10);

                     cmd.ExecuteNonQuery();
                     Response.Redirect("ResumeUploadedSuccessfully.aspx");
                 }
                 catch (SqlException ex) { }
                 finally
                 {
                     if (cn.State == ConnectionState.Open)
                     {
                         cn.Close();
                     }
                 }
             }
         }
    }
    public string UploadResumeFile()
    {
        if (FileUploadResume.HasFile)
        {
            Regex fileExtensions = new Regex(@"^.+\.(doc|docx|pdf|txt)");
            Match matchResult = fileExtensions.Match(FileUploadResume.FileName);
            if (matchResult.Success)
            {
                FileUploadResume.SaveAs(Server.MapPath("Resumes/" + Page.Session["user"].ToString() + FileUploadResume.FileName));
            }
            else
            {
                LblFileError.Text = "Please select a .doc/.docx/.pdf/.txt file only.";
            } 
        }
        return Page.Session["user"].ToString() + FileUploadResume.FileName;
    }
}