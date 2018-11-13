<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddChapter.aspx.cs" Inherits="AddChapter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="padding: 10px">
        <asp:Label ID="Label1" runat="server" Text="Title:"></asp:Label>
        <br />
        <asp:TextBox ID="TBTitlu" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TBTitlu" runat="server" ErrorMessage="Title is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label2" runat="server" Text="Description:"></asp:Label>
        <br />
        <asp:TextBox ID="TBDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TBDescription" runat="server" ErrorMessage="Description is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Button ID="AddButton" runat="server" Text="Add Chapter" OnClick="AddButton_Click" />
    </div>
    <div style="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

