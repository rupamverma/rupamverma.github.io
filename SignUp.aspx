<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- multistep form -->
<form id="msform">
<div class="container">
  <fieldset>
    <h2 class="fs-title">Create your account</h2>
    <h3 class="fs-subtitle">This is step 1</h3>
      <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
      <p class="fs-subtitle">&nbsp;</p>
      <input type="text" name="email" placeholder="Login ID" ID="tbLogin" runat="server"
          class="txtBox" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="tbLogin" ErrorMessage="Email Id is required" 
          ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
    <input type="password" name="pass" placeholder="Password" id="tbPswd" runat="server"
          class="txtBox"/><asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
          runat="server" ControlToValidate="tbPswd" ErrorMessage="Password is required" 
          ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
    <input type="password" name="cpass" placeholder="Confirm Password" id="tbCpswd" 
          class="txtBox" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
          runat="server" ControlToValidate="tbCpswd" ErrorMessage="Re-Type password is required" 
          ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
      <asp:CompareValidator ID="CompareValidator1" runat="server" 
          ControlToCompare="tbPswd" ControlToValidate="tbCpswd" 
          ErrorMessage="Password and Re-Type password must be same" ForeColor="Red"></asp:CompareValidator>
  </fieldset>
  <fieldset class="txtBox">
    <h2 class="fs-title">Personal Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
      <p class="fs-subtitle"></p>
    <input type="text" name="fname" placeholder="First Name" id="tbFn" runat="server"
          class="txtBox" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
          runat="server" ControlToValidate="tbFn" ErrorMessage="Name cannot be blank" 
          ForeColor="Red"></asp:RequiredFieldValidator>
    <input type="text" name="lname" placeholder="Last Name" id="tbLn"  runat="server"
          class="txtBox"/>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
          runat="server" ControlToValidate="tbLn" ErrorMessage="Last Name cannot be blank" 
          ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RadioButtonList ID="rdbtn" runat="server" ForeColor="Gray" 
          RepeatDirection="Horizontal">
             <asp:ListItem style="margin:8px;" Text="Male"></asp:ListItem>
             <asp:ListItem Text="Female" style="margin-right:8px"></asp:ListItem>
             <asp:ListItem Text="Others"></asp:ListItem>
          </asp:RadioButtonList>
            <input type="text" name="email" placeholder="Email" ID="tbmail" runat="server"
          class="txtBox" /><asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
          runat="server" ControlToValidate="tbmail" ErrorMessage="Email Id is required" 
          ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
    <input type="text" name="phone" placeholder="Phone" id="tbPh" class="txtBox" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
          runat="server" ControlToValidate="tbLn" ErrorMessage="Mobile Number is required" 
          ForeColor="Red"></asp:RequiredFieldValidator>
   <textarea rows="4" cols="50" runat="server" id="tbAddrs">
   Address...
</textarea>
  </fieldset>
   <fieldset>
    <h2 class="fs-title">Other Information</h2>
    <select path="country" id="ddlQual" class="txtBox" runat="server">
                        <option value="">Select Qualification</option>
                        <option value="Bsc">Bsc</option>
                        <option value="BTech">BTech</option>
                        <option value="Mca">Mca</option>
                        <option value="BCA">BCA</option>
                        <option value="Diploma">Diploma</option> 
                        <option value="Other">Other</option> 
                    </select>
                       <select path="country" id="ddlWorkExp" class="txtBox" runat="server">
                        <option value="">Select Experience</option>
                        <option value="0">Fresher</option>
                       
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option> 
                        <option value="4">4</option> 
                        <option value="5">5</option> 
                        <option value="6">6</option> 
                        <option value="7">7</option> 
                        <option value="8">8</option> 
                        <option value="9">9</option> 
                        <option value="10">10</option> 
                        <option value="11">11</option>
                        <option value="12">12</option>  
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>      
                    </select>
                       <select path="country" id="ddlCountry" class="txtBox" runat="server">
                        <option value="Select Country">Select Country</option>
                        <option value="Japan">Japan</option>
                        <option value="Kenya">Kenya</option>
                        <option value="Dubai">Dubai</option>
                        <option value="Italy">Italy</option>
                        <option value="Greece">Greece</option> 
                        <option value="Iceland">Iceland</option>
                        <option value="India">India</option> 
                        <option value="China">China</option> 
                        <option value="Doha">Doha</option> 
                        <option value="Irland">Irland</option> 
                        <option value="Srilanka">Srilanka</option> 
                        <option value="Russia">Russia</option> 
                        <option value="Hong Kong">Hong Kong</option> 
                        <option value="Germany">Germany</option>
                        <option value="Canada">Canada</option>  
                        <option value="Mexico">Mexico</option> 
                        <option value="Nepal">Nepal</option>
                        <option value="Norway">Norway</option> 
                        <option value="">Oman</option>
                        <option value="Oman">Pakistan</option>  
                        <option value="Kuwait">Kuwait</option> 
                        <option value="Indonesia">Indonesia</option>  
                        <option value="Spain">Spain</option>
                        <option value="Thailand">Thailand</option>  
                        <option value="Saudi Arabia">Saudi Arabia</option> 
                        <option value="Poland">Poland</option> 
                    </select>
                       <select path="country" id="ddlCompany" class="txtBox" runat="server">
                        <option value="Select Country">Select Company</option>
                        <option value="FullTime">FullTime</option>
                        <option value="PartTime">PartTime</option>
                         <option value="Contract">Contract</option>
                        
                    </select>

                    <asp:Button ID="btnSubmit" Text="Submit" class="txtBox" 
           runat="server" onclick="btnSubmit_Click" BackColor="#3399FF" />

                   
    </fieldset>
  </div>
</form>
</asp:Content>

