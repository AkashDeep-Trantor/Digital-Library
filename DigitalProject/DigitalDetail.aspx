<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DigitalDetail.aspx.cs" Inherits="DigitalDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="pictureDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" 
        SelectCommand="SELECT [PictureID], [Title], [Description] FROM [Pictures] WHERE ([PictureID] = @PictureID)" >
        <SelectParameters>
            <asp:QueryStringParameter Name="PictureID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="PictureID" 
        DataSourceID="pictureDataSource" EnableModelValidation="True" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:ImageField DataImageUrlField="PictureID" DataImageUrlFormatString="~/UploadedImages/{0}.jpg">
            </asp:ImageField>
        </Fields>
    </asp:DetailsView>
    <br />

    <asp:SqlDataSource ID="commentsDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>"
        DeleteCommand="DELETE FROM [Comments] WHERE [CommentID] = @CommentID" 
        InsertCommand="INSERT INTO [Comments] ([UsedID], [PictureID], [Subject], [Body], [CommentMadeOn]) 
        VALUES (@UsedID, @PictureID, @Subject, @Body, @CommentMadeOn)" SelectCommand="SELECT * FROM [Comments] WHERE 
        ([PictureID] = @PictureID) ORDER BY [CommentMadeOn] DESC" UpdateCommand="UPDATE [Comments] 
        SET [UsedID] = @UsedID, [PictureID] = @PictureID, [Subject] = @Subject, [Body] = @Body, 
        [CommentMadeOn] = @CommentMadeOn WHERE [CommentID] = @CommentID">
        <DeleteParameters>
            <asp:Parameter Name="CommentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UsedID" />
            <asp:Parameter Name="PictureID" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Body" Type="String" />
            <asp:Parameter Name="CommentMadeOn" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="PictureID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UsedID" />
            <asp:Parameter Name="PictureID" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Body" Type="String" />
            <asp:Parameter Name="CommentMadeOn" Type="DateTime" />
            <asp:Parameter Name="CommentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            Only LoggedIn users can leave Comments
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="commentsDataSource1" 
                EnableModelValidation="True" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="CommentID" DefaultMode="Insert" OnItemInserting="DetailsView2_ItemInserting">
                <Fields>
                    <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="R1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Subject must NOT be EMPTY!" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Body" SortExpression="Body">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Body") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Body") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="R2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Body must NOT be EMPTY!" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Body") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField CancelText="" InsertText="Add a New Comment" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

        </LoggedInTemplate>
    </asp:LoginView>
    <br />

    
</asp:Content>

