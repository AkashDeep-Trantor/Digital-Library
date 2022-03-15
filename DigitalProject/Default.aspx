<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align:center">Online Digital Library</h1>
    <h1 style="text-align:center">Home Page</h1> <br />
    <p>Welcome to The Online Digital Library. To view an existing User's Album simply click on the Link below. <br />If you are 
        interested in creating your own Album, you will need to <a href ="CreateAccount.aspx">Create Account</a>.<br /> If you 
        already have an account, please <a href="login.aspx">Login</a> here.
    </p>
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LAPTOP-PT6SFEL2\SQL_SRV_TRANTOR;Initial Catalog=aspnetdb;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_MembershipUsers] WHERE (([IsApproved] = @IsApproved) AND ([IsLockedOut] = @IsLockedOut)) ORDER BY [UserName]" >
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="IsApproved" Type="Boolean" />
            <asp:Parameter DefaultValue="false" Name="IsLockedOut" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="UserID" 
                DataNavigateUrlFormatString="DigitalAlbum.aspx?ID={0}" Text="View Album" />
        </Columns>
    </asp:GridView>
</asp:Content>

