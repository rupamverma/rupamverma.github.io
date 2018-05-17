<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Resume.aspx.cs" Inherits="Resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
  <tr>
    <td><h1>&nbsp;Personal Information</h1></td>
    <td class="modal-sm" style="width: 510px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
      </td>
  </tr>
  <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp; *Name</td>
   <td class="modal-sm" style="width: 510px"><asp:TextBox ID="tbRName" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
           ControlToValidate="tbRName" ErrorMessage="Name cannot be blank" 
           ForeColor="Red">*</asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;Address</td>
   <td class="modal-sm" style="width: 510px"> <textarea rows="4" cols="50" runat="server" id="tbRAddrs"></textarea></td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       *Contact Number</td>
   <td class="modal-sm" style="width: 510px"><asp:TextBox ID="tbCNo" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
           ControlToValidate="tbCNo" ErrorMessage="This field is required." 
           ForeColor="Red">*</asp:RequiredFieldValidator>
       </td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       *Email Id</td>
   <td class="modal-sm" style="width: 510px"><asp:TextBox ID="tbREmail" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
           ControlToValidate="tbREmail" ErrorMessage="Enter your Email address." 
           ForeColor="Red">*</asp:RequiredFieldValidator>
       </td>
  </tr>
  </table>
  <table>
  <tr>
   <td><h1>Qualification Information</h1></td>
   <td class="modal-sm" style="width: 450px"></td>
   </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*10th</td>
   <td class="modal-sm" style="width: 450px"><asp:TextBox ID="tb10th" runat="server"></asp:TextBox>(like:70%)</td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*12th</td>
   <td class="modal-sm" style="width: 450px"><asp:TextBox ID="tb12th" runat="server"></asp:TextBox>(like: Sc,Maths with 70%)</td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Graduation</td>
   <td class="modal-sm" style="width: 450px"><asp:TextBox ID="tbGrd" runat="server"></asp:TextBox>(like: B.Tech with 75%)</td>
  </tr>
   <tr>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Post Graduation</td>
   <td class="modal-sm" style="width: 450px"><asp:TextBox ID="tbPgrad" runat="server"></asp:TextBox>(like: M.Tech with 77%)</td>
  </tr>
  <tr>
    <td style="height: 38px"><h1>Upload Your Resume</h1></td>
    <td style="height: 38px">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Select a Resume File<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Please select a .doc/.docx/.pdf/.txt 
        file only)</td>
    <td>
        <asp:FileUpload ID="FileUploadResume" runat="server" />
        <asp:RequiredFieldValidator ID="SelectResume" runat="server" 
            ControlToValidate="FileUploadResume" ErrorMessage="Please select a resume" 
            ForeColor="Red">*</asp:RequiredFieldValidator>
&nbsp;
        <br />
        <asp:Label ID="LblFileError" runat="server" ForeColor="#FF3300"></asp:Label>
      </td>
  </tr>
   <tr>
   <td></td>
   <td class="modal-sm" style="width: 450px"><asp:Button ID="btnRSubmit" 
           runat="server" Text="Submit" onclick="btnRSubmit_Click" /></td>
  </tr>
</table>
</asp:Content>

