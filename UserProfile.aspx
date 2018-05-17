<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="tberror1" runat="server" ForeColor="Red"></asp:Label>
    <table cellpadding="0" cellspacing="0" class="nav-justified">
        <tr>
            <td style="font-size: x-large" width="100%">
                <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    Height="50px"  AutoGenerateRows="False" Font-Size="X-Large" 
                    ForeColor="Black" GridLines="Horizontal">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <Fields>
              <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%# Bind("vFn") %>'></asp:Label>
                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("vLn") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email Id">
            <ItemTemplate>
                <asp:Label ID="lblEmlID" runat="server" Text='<%# Bind("vMailId") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Cell Number">
            <ItemTemplate>
                <asp:Label ID="lblCell" runat="server" Text='<%# Bind("vContacts") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Qualification">
            <ItemTemplate>
                <asp:Label ID="lblQual" runat="server" Text='<%# Bind("vQualification") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Experience">
            <ItemTemplate>
                <asp:Label ID="lblExp" runat="server" Text='<%# Bind("iExperience") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Job Type">
            <ItemTemplate>
                <asp:Label ID="lblJob" runat="server" Text='<%# Bind("vCompany") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Gender">
            <ItemTemplate>
                <asp:Label ID="lblgen" runat="server" Text='<%# Bind("vGender") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>

