<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RemoveFromUsers.aspx.cs" Inherits="RemoveAddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/RemoveAddUser.aspx?id={0}" HeaderText="Remove Add Right" Text="Remove" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/RemoveEditUser.aspx?id={0}" HeaderText="Remove Edit Right" Text="Remove" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ActivateAddUser.aspx?id={0}" HeaderText="Activate Add Right" Text="Activate" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ActivateEditUser.aspx?id={0}" HeaderText="Activate Edit Right" Text="Activate" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="SELECT Id, UserName, AddAllow FROM AspNetUsers">
    </asp:SqlDataSource>
</asp:Content>

