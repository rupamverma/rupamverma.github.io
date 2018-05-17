<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>LogIn to your Account</h2>
<p>
<asp:Label ID="tberror" runat="server" ForeColor="Red"></asp:Label>
</p>
    <div class="textbox-wrap">
    <div class="input-group" style="margin-bottom: 3%" >
    <span class="input-group-addon "><span class="glyphicon glyphicon-user"></span></span>
    <input type="text" required="required" class="form-control" placeholder="Username" runat="server" id="tblog" />
    </div>
    <div class="textbox-wrap">
    <div class="input-group">
    <span class="input-group-addon "><span class="glyphicon glyphicon-refresh"></span></span>
    <input type="password" required="required" class="form-control " placeholder="Password" runat="server" id="txtpswd" />
</div>
</div> <br />  
<asp:Button ID="tblogin" Text="Log In" runat="server" Font-Size="Large" 
            EnableTheming="False" onclick="tblogin_Click" Width="200px" 
            BackColor="#3399FF" /><br />
<input style="margin-top: 2%" type="checkbox"  runat="server" />Remember me <div style="float: right;margin-top: 2%;color: red"><asp:HyperLink ID="linkforgot"  runat="server" NavigateUrl="ForgotPasword.aspx">Forgot Password? </asp:HyperLink>
</div>

</asp:Content>

