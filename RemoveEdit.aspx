<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RemoveEdit.aspx.cs" Inherits="RemoveEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="PConfirm" runat="server">
        <h4>
            Do you wish to remove edit right for this article?
        </h4>
        <br />
        <asp:Button ID="RemoveButton" runat="server" Text="Yes" Width="50" OnClick="RemoveButton_Click" /><span style="padding-left: 20px;"></span> <asp:Button ID="CancelButton" runat="server" Text="No"  Width="50" OnClick="CancelButton_Click" />
    </asp:Panel>
    <div style="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

