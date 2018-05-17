<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="50%" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#336666" 
        BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <Fields>

   <asp:TemplateField HeaderText="Job Title">
   <ItemTemplate>
   <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("VJob_Title") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField HeaderText="Descriptin">
   <ItemTemplate>
   <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("VJobs_Description") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField HeaderText="Last Date to apply">
   <ItemTemplate>
   <asp:Label ID="lblLdate" runat="server" Text='<%# Bind("VLast_Date_To_Apply") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField HeaderText="No Of Post">
   <ItemTemplate>
   <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("INo_Of_Post") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
    <asp:TemplateField HeaderText="Qualification">
   <ItemTemplate>
   <asp:Label ID="lblQual" runat="server" Text='<%# Bind("VQualification") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
    <asp:TemplateField HeaderText="Experience">
   <ItemTemplate>
   <asp:Label ID="lblExp" runat="server" Text='<%# Bind("IExperience") %>'></asp:Label>
   </ItemTemplate>
  </asp:TemplateField>
  </Fields>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <asp:Button ID="btnApply" runat="server" BackColor="#999999" Font-Size="Small" 
        Height="40px" Text="Apply Now" Width="120px" onclick="btnApply_Click" />
    
</asp:Content>

