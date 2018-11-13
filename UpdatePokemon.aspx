<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UpdatePokemon.aspx.cs" Inherits="UpdatePokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="padding: 10px">
        <asp:Label ID="Label1" runat="server" Text="Type:"></asp:Label>
        <br />
        <asp:DropDownList ID="DDLDomain" runat="server" DataSourceID="SqlDataSource1" DataTextField="DomainName" DataValueField="Id"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [DomainName] FROM [Domain]"></asp:SqlDataSource>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
        <br />
        <asp:TextBox ID="TBName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TBName" runat="server" ErrorMessage="Pokemon name is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label3" runat="server" Text="Description:"></asp:Label>
        <br />
        <asp:TextBox ID="TBDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TBDescription" runat="server" ErrorMessage="Description is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label4" runat="server" Text="Weight:"></asp:Label>
        <br />
        <asp:TextBox ID="TBWeight" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TBWeight" runat="server" ErrorMessage="Weight is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TBWeight" ErrorMessage="Weight must be between 0 and 2000 kg." Type="Double" MinimumValue="0" MaximumValue="2000" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label5" runat="server" Text="Height:"></asp:Label>
        <br />
        <asp:TextBox ID="TBHeight" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TBHeight" runat="server" ErrorMessage="Height is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TBHeight" ErrorMessage="Height must be between 0 and 5." Type="Double" MinimumValue="0" MaximumValue="5" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label6" runat="server" Text="Picture:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    <div style="padding: 10px">
        <asp:Button ID="UpdateButton" runat="server" Text="Save Pokemon" OnClick="SaveButton_Click" />
    </div>
    <div style="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

