<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:GridView ID="gvrJobs" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Width="100%">
    <AlternatingRowStyle BackColor="White" />
  <Columns>
     <asp:TemplateField HeaderText="Job Title">
      <ItemTemplate>
       <asp:Label ID="lbJb" runat="server" Text='<%# Eval("VJob_Title") %>'></asp:Label>
      </ItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="No Of Post">
     <ItemTemplate>
      <asp:Label ID="lblNOP" runat="server" Text='<%# Eval("INo_Of_Post") %>'></asp:Label>
     </ItemTemplate>
     </asp:TemplateField>
     <asp:TemplateField HeaderText="Qualification">
     <ItemTemplate>
      <asp:Label ID="lblQual" runat="server" Text='<%# Eval("VQualification")%>'></asp:Label>
     </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Experience">
      <ItemTemplate>
       <asp:Label ID="lblExp" runat="server" Text='<%# Eval("IExperience") %>'></asp:Label>
      </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Details">
          <ItemTemplate>
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.IJob_Id","JobDetails.aspx?id={0}" )%>'>Details</asp:HyperLink>
          </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Apply Now">
          <ItemTemplate>
              <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.IJob_Id","Resume.aspx?id={0}" )%>'>Apply Now</asp:HyperLink>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>
</asp:Content>

