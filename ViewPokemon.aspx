<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewPokemon.aspx.cs" Inherits="ViewPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="padding: 2px">
        <h1>
            <asp:Label ID="LName" runat="server" Text=""></asp:Label>
        </h1>
    </div>
    <div style="padding: 2px">
        <h2>
            Type: <asp:Label ID="LDName" runat="server" Text=""></asp:Label>
        </h2>
    </div>
    <div style="padding: 2px">
        <p>
            <asp:Label ID="LDesc" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <div style="padding: 2px">
        <p>
            Weight: <asp:Label ID="LWeight" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <div style="padding: 2px">
        <p>
            Height: <asp:Label ID="LHeight" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <asp:Image ID="Image1" runat="server" ImageUrl= "ImagePokemon.aspx?ImageID=1" Height="400px" Width="400px"/>
    <div style ="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
    </div>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div style="padding: 2px">
                <h3><%# Eval("Titlu") %> </h3>
            </div>
            <div style="padding: 2px">
                <p> <%# Eval("Description") %> </p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Chapter.Titlu, Chapter.Description FROM Chapter WHERE IdArticle = @IdArt">
        <SelectParameters>
            <asp:Parameter Name ="IdArt" Type ="Int32" DefaultValue = 3 />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

