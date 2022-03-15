<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCategories.aspx.cs" Inherits="DigitalAdmin_ManageCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Manage Your Digital Album's Categories</h1>
    <asp:Label ID="UserIdValue" runat="server" Visible="false" /><br />

    <asp:SqlDataSource ID="categoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [Categories] ([UserID], [Name]) VALUES (@UserID, @Name)" SelectCommand="SELECT [CategoryID], [UserID], [Name] FROM [Categories] WHERE ([UserID] = @UserID) ORDER BY [Name]" UpdateCommand="UPDATE [Categories] SET [UserID] = @UserID, [Name] = @Name WHERE [CategoryID] = @CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIdValue" Name="UserID" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    <h3>Add a New Category</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="categoriesDataSource" AutoGenerateRows="False" 
        DataKeyNames="CategoryID" DefaultMode="Insert" EnableModelValidation="True" OnItemInserting="DetailsView1_ItemInserting" >
        <Fields>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
                        Display="Dynamic" ErrorMessage="Name must NOT be Empty!" 
                        ValidationGroup="CategoryInsert"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="true" CancelText="" ValidationGroup="CategoryInsert" />
        </Fields>
    </asp:DetailsView>
    <br />
    
    <h3>Categories:</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="CategoryID" 
        DataSourceID="categoriesDataSource" OnRowUpdating="GridView1_RowUpdating" 
        EmptyDataText="You currently do NOT have any categories">
        <Columns>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ValidationGroup="CategoryEdit" />
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
                        Display="Dynamic" ErrorMessage="Name must NOT be Empty!" 
                        ValidationGroup="CategoryEdit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name")%>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        
</asp:Content>

