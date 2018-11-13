<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Pokemons.aspx.cs" Inherits="Pokemons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain WHERE Article.EditAllow = 1">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Article.Id, Article.Name, Article.Description, Article.Weight, Article.Height, Domain.DomainName FROM Domain INNER JOIN Article ON Domain.Id = Article.IdDomain WHERE Article.EditAllow = 0">
    </asp:SqlDataSource>

    <asp:Label ID="LSelect" runat="server" Text=""></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS">
        <ItemTemplate>
            <div style="padding: 10px; background-color: #003300">
                <h3 style="color: white"> <%# DataBinder.Eval(Container.DataItem, "Name")%></h3>
                <div>
                    <p style="color: white">Type: <%# DataBinder.Eval(Container.DataItem, "DomainName")%> </p>
                </div>
                <div>
                    <p style="color: white">Description: <%# DataBinder.Eval(Container.DataItem, "Description")%> </p>
                </div>
                <div>
                    <p style="color: white">Weight: <%# DataBinder.Eval(Container.DataItem, "Weight")%> </p>
                </div>
                <div>
                    <p style="color: white">Height: <%# DataBinder.Eval(Container.DataItem, "Height")%> </p>
                </div>
                <br />
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ViewPokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >View Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL1" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Update Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL2" NavigateUrl='<%# "~/AddChapter.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Add Chapter</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeletePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Delete Pokemon</asp:HyperLink>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ViewPokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >View Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL3" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Update Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL4" NavigateUrl='<%# "~/AddChapter.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Add Chapter</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeletePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Delete Pokemon</asp:HyperLink>
                    </LoggedInTemplate>
                    <RoleGroups>
                        <asp:RoleGroup Roles ="editor">
                            <ContentTemplate>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ViewPokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >View Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL5" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Update Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL6" NavigateUrl='<%# "~/AddChapter.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Add Chapter</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeletePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Delete Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL7" NavigateUrl='<%# "~/RemoveEdit.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Remove Edit Right</asp:HyperLink>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
             </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
    <br />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SDS1">
        <ItemTemplate>
            <div style="padding: 10px; background-color: #003300">
                <h3 style="color: white"> <%# DataBinder.Eval(Container.DataItem, "Name")%></h3>
                <div>
                    <p style="color: white">Type: <%# DataBinder.Eval(Container.DataItem, "DomainName")%> </p>
                </div>
                <div>
                    <p style="color: white">Description: <%# DataBinder.Eval(Container.DataItem, "Description")%> </p>
                </div>
                <div>
                    <p style="color: white">Weight: <%# DataBinder.Eval(Container.DataItem, "Weight")%> </p>
                </div>
                <div>
                    <p style="color: white">Height: <%# DataBinder.Eval(Container.DataItem, "Height")%> </p>
                </div>
                <br />
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ViewPokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >View Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL8" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Update Pokemon</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HL9" NavigateUrl='<%# "~/AddChapter.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Add Chapter</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeletePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Delete Pokemon</asp:HyperLink>
                    </LoggedInTemplate>
                    <RoleGroups>
                        <asp:RoleGroup Roles ="editor">
                            <ContentTemplate>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ViewPokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >View Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL10" NavigateUrl='<%# "~/UpdatePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Update Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL11" NavigateUrl='<%# "~/AddChapter.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Add Chapter</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeletePokemon.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Delete Pokemon</asp:HyperLink>
                                <br />
                                <asp:HyperLink ID="HL12" NavigateUrl='<%# "~/RemoveEdit.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="White" >Remove Edit Right</asp:HyperLink>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
             </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

