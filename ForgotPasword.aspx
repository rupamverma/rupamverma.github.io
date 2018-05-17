<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ForgotPasword.aspx.cs" Inherits="ForgotPasword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Please Enter Your &quot;Login Id&quot; we will mail your account information (Password 
        etc.) at your mail id.<table cellpadding="2" class="nav-justified">
            <tr>
                <td>
                    <asp:Label ID="lblForgotError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
   <table cellpadding="5" cellspacing="5" style="width: 100%">
            <tr>
                <td align="right">
                    Enter your Mail Id :</td>
                <td>
                    <asp:TextBox ID="tbmail" runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbmail" ErrorMessage="Email Id is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                   </td>
                <td>
                   <asp:Button ID="btnForgot" runat="server" Text="Submit" BackColor="#0099FF" 
                        onclick="btnForgot_Click" />
                </td>
            </tr>
</asp:Content>

