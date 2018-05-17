using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UserMasterPage : System.Web.UI.MasterPage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        String activepage = Request.RawUrl;
        if (activepage.Contains("Home.aspx"))
        {
            page1.Attributes["class"] = "active";
        }
        else if (activepage.Contains("About.aspx"))
        {
            page2.Attributes["class"] = "active";
        }
        else if (activepage.Contains("Contact.aspx"))
        {
            page3.Attributes["class"] = "active";
        }
      
        else if (activepage.Contains("Jobs.aspx"))
        {
            page4.Attributes["class"] = "active";
        }
        else if (activepage.Contains("SignUp.aspx"))
        {
            page5.Attributes["class"] = "active";
        }
        else if (activepage.Contains("Login.aspx"))
        {
            page6.Attributes["class"] = "active";
        }
        else if (activepage.Contains("UserProfile.aspx"))
        {
            page6.Attributes["class"] = "active";
        } 
        if (Page.Session["user"] != null)
        {
            LbLogInLogOut.Text = "LogOut";
            LbSignUp.Text = "Profile";
        }
        else
        {
            LbLogInLogOut.Text = "LogIn";
            LbSignUp.Text = "SignUp";
        }
    }
    protected void LbSignUp_Click(object sender, EventArgs e)
    {
        if (LbSignUp.Text == "SignUp")
        {
          
            Response.Redirect("SignUp.aspx");
            
         
        }
        if (LbSignUp.Text == "Profile")
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
    protected void LbLogInLogOut_Click(object sender, EventArgs e)
    {
        if (LbLogInLogOut.Text == "LogIn")
        {
            Response.Redirect("Login.aspx");
        }
        if (LbLogInLogOut.Text == "LogOut")
        {
            Page.Session.Abandon();
            Response.Redirect("Login.aspx?id=logout");
        }
    }
    protected void tbJb_Click(object sender, EventArgs e)
    {
        Response.Redirect("Jobs.aspx");
    }
}
