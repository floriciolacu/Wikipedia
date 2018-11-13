<%@ Page Title="List of Pokemons" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
            <div style="padding-top: 10px">
               <asp:TextBox ID="TBSearch" runat="server"></asp:TextBox>&nbsp;
               <asp:Button ID="BSearch" runat="server" Text="Search" OnClick="BSearch_Click" />
            </div>
         </div>
    </div>

    <br />
    <br />

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <asp:HyperLink runat="server" ForeColor="Black" ID="HyperLink1" NavigateUrl='<%# "~/ViewDomain.aspx?id=" + DataBinder.Eval(Container.DataItem, "Id")%>' >
                                <%# DataBinder.Eval(Container.DataItem,"DomainName") %>
            </asp:HyperLink>
        </ItemTemplate>
    </asp:DataList>

    <br />
    <br />

    <asp:LoginView ID="LoginView2" runat="server">
        <AnonymousTemplate>
            <asp:GridView ID="GridView2" runat="server" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="DomainName" HeaderText="Domain Name" SortExpression="DomainName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight"  SortExpression="Weight" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ViewPokemon.aspx?id={0}" HeaderText="View Pokemon" Text="View" />
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
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:GridView ID="GridView1" runat="server" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="DomainName" HeaderText="Domain Name" SortExpression="DomainName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight"  SortExpression="Weight" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ViewPokemon.aspx?id={0}" HeaderText="View Pokemon" Text="View" />
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
        </LoggedInTemplate>
         <RoleGroups>
            <asp:RoleGroup Roles ="editor">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:BoundField DataField="DomainName" HeaderText="Domain Name" SortExpression="DomainName" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Weight" HeaderText="Weight"  SortExpression="Weight" />
                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ViewPokemon.aspx?id={0}" HeaderText="View Pokemon" Text="View" />
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
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
         <RoleGroups>
            <asp:RoleGroup Roles ="admin">
                <ContentTemplate>
                    <asp:Button ID="BRemove" runat="server" Text="Remove/Activate User Rights" OnClick="BRemove_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView2" runat="server" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:BoundField DataField="DomainName" HeaderText="Domain Name" SortExpression="DomainName" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Weight" HeaderText="Weight"  SortExpression="Weight" />
                            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/ViewPokemon.aspx?id={0}" HeaderText="View Pokemon" Text="View" />
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
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain"
        DeleteCommand="DELETE FROM [Article] WHERE [Id] = @Id" 
        UpdateCommand="UPDATE [Article] SET [Name] = @Name, [Description] = @Description, [Weight] = @Weight, [Height] = @Height WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Weight" Type="Double" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="SELECT Id, DomainName FROM Domain">
    </asp:SqlDataSource>
</asp:Content>
