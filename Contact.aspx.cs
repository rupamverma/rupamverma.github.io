using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            MailAddress to = new MailAddress("mahi.roops@gmail.com");
            MailAddress from = new MailAddress(email.Value);
            MailMessage message = new MailMessage(from, to);
            message.Subject = "JobWorld user query";
            message.IsBodyHtml = true;
            message.Body = "Name : " + fname.Value + "<br> Phone : " + phone.Value + "<br> Query :" + subject.Value;
            SmtpClient obj = new SmtpClient("localhost", 25);
            obj.Send(message);
        }
        catch (Exception ex)
        {
            LabelError.Text = "Error " + ex.Message;
        }
    }
}