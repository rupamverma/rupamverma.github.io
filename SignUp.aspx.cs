using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(scn))
        {
            using (SqlCommand cmd = new SqlCommand("insertUser", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@loginid", SqlDbType.VarChar, 50);
                p1.Value = tbLogin.Value;
                SqlParameter p2 = new SqlParameter("@password", SqlDbType.VarChar, 50);
                p2.Value = tbPswd.Value;
                SqlParameter p3 = new SqlParameter("@fn", SqlDbType.VarChar, 50);
                p3.Value = tbFn.Value;
                SqlParameter p4 = new SqlParameter("@ln", SqlDbType.VarChar, 50);
                p4.Value = tbLn.Value;
                SqlParameter p5 = new SqlParameter("@contact", SqlDbType.VarChar, 50);
                p5.Value = tbPh.Value;
                SqlParameter p6 = new SqlParameter("@qual", SqlDbType.VarChar, 50);
                p6.Value = ddlQual.Value;
                SqlParameter p7 = new SqlParameter("@country", SqlDbType.VarChar, 50);
                p7.Value = ddlCountry.Value;
                SqlParameter p8 = new SqlParameter("@address", SqlDbType.VarChar, 50);
                p8.Value = tbAddrs.Value;
                SqlParameter p9 = new SqlParameter("@experience", SqlDbType.Int);
                p9.Value = Convert.ToInt32(ddlWorkExp.Value);
                SqlParameter p10 = new SqlParameter("@mailid", SqlDbType.VarChar, 50);
                p10.Value = tbmail.Value;
                SqlParameter p11 = new SqlParameter("@company", SqlDbType.VarChar, 50);
                p11.Value = ddlCompany.Value;
                SqlParameter p12 = new SqlParameter("@gen", SqlDbType.VarChar, 30);
                p12.Value = rdbtn.Text;
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
                cmd.Parameters.Add(p11);
                cmd.Parameters.Add(p12);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
              
                tbLogin.Value = "";
                tbPswd.Value = "";
                tbCpswd.Value = "";
                tbFn.Value = "";
                tbLn.Value = "";
                tbmail.Value = "";
                tbPh.Value = "";
                tbAddrs.Value = "Address";
                ddlCompany.Value = "";
                ddlCountry.Value = "";
                ddlQual.Value = "";
                ddlWorkExp.Value = "";
                rdbtn.Text = "";
                Response.Redirect("Login.aspx?id=register");
                
            }
        }
    }
}