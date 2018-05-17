using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            if (Request.QueryString["id"].ToString() == "register")
            {
                tberror.Text = "You have registered successfully.";
            }
            if (Request.QueryString["id"].ToString() == "logout")
            {
                tberror.Text = "You have successfully LogOut.";
            }
            if (Request.QueryString["id"].ToString() == "loginRequired")
            {
                tberror.Text = "Please Login before accessing this Page.";
            }
        }

    }
    protected void tblogin_Click(object sender, EventArgs e)
    {
         string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
         using (SqlConnection cn = new SqlConnection(scn))
         {
             using (SqlCommand cmd = new SqlCommand("searchPassword", cn))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 SqlParameter p1 = new SqlParameter("@login", SqlDbType.VarChar, 50);
                 p1.Value = tblog.Value;
                 cmd.Parameters.Add(p1);
                 cn.Open();
                 SqlDataReader dr = cmd.ExecuteReader();
                 if (dr.Read())
                 {
                     string password = dr["vPassword"].ToString();
                     if (password == txtpswd.Value)
                     {
                         Page.Session.Add("user", tblog.Value);
                         Page.Session.Timeout = 20;
                         Response.Redirect("UserProfile.aspx?id=success");
                     }
                     else
                     {
                         tberror.Text = "Password is incorrect";
                     }
                 }
                 else
                     {
                         tberror.Text = "Login id is incorrect";

                     }

             }
         }

    }
}