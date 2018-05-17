<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="contact-form">
  

<div class="container">
  <h3 class="head">Quick Contact</h3>

    <h4>Contact us today, and get reply with in 24 hour</h4>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ForeColor="#CC0000" />
    <asp:Label ID="LabelError" runat="server" ForeColor="#CC0000"></asp:Label>
    <br />
    <input type="text" id="fname" name="firstname" runat="server" placeholder="Your name.." /><asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="This field is required" ForeColor="Red" 
        ControlToValidate="fname">*</asp:RequiredFieldValidator>
&nbsp;<input type="text" id="email" name="Email" runat="server"  placeholder="Your Email-Id.." /><asp:RegularExpressionValidator 
        ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" 
        ErrorMessage="Incorrect Format" ForeColor="Red" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Email id is required." ForeColor="Red" 
        ControlToValidate="email" Display="Dynamic">*</asp:RequiredFieldValidator>
&nbsp;<input type="text" id="phone" name="phoneNo" runat="server"  placeholder="Your Mob No.." /><asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Please enter your contact number." ForeColor="Red" 
        ControlToValidate="phone">*</asp:RequiredFieldValidator>
&nbsp;<textarea id="subject" name="subject" runat="server" placeholder="Type your Message here.." style="height:200px"></textarea><asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Please enter your query." ForeColor="Red" 
        ControlToValidate="subject">*</asp:RequiredFieldValidator>
    <br />

     <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" />
 
</div>

</asp:Content>

