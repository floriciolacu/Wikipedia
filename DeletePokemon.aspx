<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DeletePokemon.aspx.cs" Inherits="DeletePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="PConfirm" runat="server">
        <h4>
            Do you wish to delete <asp:Label ID="LName" runat="server" Text=""></asp:Label>?
        </h4>
        <br />
        <asp:Button ID="DeleteButton" runat="server" Text="Yes" Width="50" OnClick="DeleteButton_Click" /><span style="padding-left: 20px;"></span> <asp:Button ID="CancelButton" runat="server" Text="No"  Width="50" OnClick="CancelButton_Click" />
    </asp:Panel>
    <div style="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
        <br />
        <asp:HyperLink ID="HLHomepage" runat="server" NavigateUrl="~/Pokemons.aspx" Visible="false">Back to My Pokemons</asp:HyperLink>
    </div>
</asp:Content>

