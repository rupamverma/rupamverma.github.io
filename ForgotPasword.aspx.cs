using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
public partial class ForgotPasword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnForgot_Click(object sender, EventArgs e)
    {
        string scn = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(scn))
        {
            string loginId = tbmail.Text;
            string bqry = "select * from tblUsers where vLoginId='{0}' or vMailId='{0}'";
            string qry = String.Format(bqry, loginId);
            using (SqlCommand cmd = new SqlCommand(qry, cn))
            {
                try
                {
                    cn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string LoginId, password, mailId;
                        LoginId = dr["vLoginId"].ToString();
                        password = dr["vPassword"].ToString();
                        mailId = dr["vMailId"].ToString();
                        SendMail(loginId, password, mailId);

                    }
                    else
                    {
                        lblForgotError.Text = "Login Id is incorrect";
                    }
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
    public void  SendMail(string loginId, string password, string mailId)
    {
        try
        {
            MailAddress to = new MailAddress(mailId);
            MailAddress from = new MailAddress("mahi.roops@gmail.com");
            MailMessage msg = new MailMessage(from, to);
            msg.Subject = "JobWorld account information";
            msg.Body = "<b>Password : </b>" + password;
            msg.IsBodyHtml = true;
            SmtpClient obj = new SmtpClient("localhost", 25);
            obj.Send(msg);
            lblForgotError.Text = "Your password has been sent to your mail id." + mailId;
        }
        catch (Exception ex)
        {
            lblForgotError.Text = ex.Message;
        }


    }
}