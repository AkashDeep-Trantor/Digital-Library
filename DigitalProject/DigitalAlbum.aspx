<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DigitalAlbum.aspx.cs" Inherits="DigitalAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Digital Album</h1>
    <br />
    <h3>Filter Pictures By Category</h3>

    <asp:SqlDataSource ID="categoriesDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" 
        SelectCommand="SELECT [CategoryID], [Name] FROM [Categories] WHERE ([UserID] = @UserID) ORDER BY [Name]" >
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="catogories1" runat="server" AppendDataBoundItems="True" DataSourceID="categoriesDataSource1" 
        DataTextField="Name" DataValueField="CategoryID">
        <asp:ListItem Value="">-- ALL --</asp:ListItem>
    </asp:DropDownList>

    <asp:SqlDataSource ID="pictureDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" 
        SelectCommand="SELECT [PictureID], [CategoryID], [UploadedOn] FROM [Pictures] WHERE (([UserID] = @UserID) AND 
        ([CategoryID] = @CategoryID))">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="ID" />
            <asp:ControlParameter ControlID="catogories1" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="pictureDataSource" AutoGenerateColumns="False" 
        DataKeyNames="PictureID" EnableModelValidation="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PictureID" DataNavigateUrlFormatString="~/DigitalDetails.aspx?ID={0}" 
                Text="View Comments" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="UploadedOn" HeaderText="UploadedOn" SortExpression="UploadedOn" />
            <asp:ImageField DataImageUrlField="PictureID" DataAlternateTextFormatString="~/UploadedImages/{0}.jpg">
                <ControlStyle Height="300px" Width="300px" />
            </asp:ImageField>
        </Columns>

    </asp:GridView>    
   
</asp:Content>

