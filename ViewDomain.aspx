<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewDomain.aspx.cs" Inherits="ViewDomain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div style="padding: 2px">
                <h3><%# Eval("Name") %> </h3>
            </div>
            <div style="padding: 2px">
                <p> <%# Eval("Description") %> </p>
            </div>
            <div style="padding: 2px">
                <p> Weight: <%# Eval("Weight") %> </p>
            </div>
            <div style="padding: 2px">
                <p> Height: <%# Eval("Height") %> </p>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <br />
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
     </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain WHERE Article.IdDomain = @IdDom">
        <SelectParameters>
            <asp:Parameter Name ="IdDom" Type ="Int32" DefaultValue = 3 />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

