<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SearchPokemon.aspx.cs" Inherits="SearchPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain">
    </asp:SqlDataSource>

    <asp:Label ID="LSelect" runat="server" Text=""></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDSSearch">
        <HeaderTemplate>
            Search results:
        </HeaderTemplate>
        <ItemTemplate>
            <div style="padding: 10px; background-color: #e6ff99">
                <h3> <%# DataBinder.Eval(Container.DataItem, "Name")%> </h3>
                <div>
                    Type: <%# DataBinder.Eval(Container.DataItem, "DomainName")%>
                </div>
                <div>
                    Description: <%# DataBinder.Eval(Container.DataItem, "Description")%>
                </div>
                <div>
                    Weight: <%# DataBinder.Eval(Container.DataItem, "Weight")%>
                </div>
                <div>
                    Height: <%# DataBinder.Eval(Container.DataItem, "Height")%>
                </div>
                 
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="Black" >Update Pokemon</asp:HyperLink>
                    </LoggedInTemplate>
                </asp:LoginView>
             </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

