<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DigitalAdmin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="UserIDValue" runat="server" Visible="false" />
    <asp:DetailsView ID="dvPicturesInsert" DataSourceID="PicturesDataSource" runat="server" 
        AutoGenerateRows="false" DataKeyNames="PictureID" DefaultMode="Insert" OnItemInserted="dvPicturesInsert_ItemInserted" OnItemInserting="dvPicturesInsert_ItemInserting">
        <Fields>
            
            <asp:TemplateField HeaderText="Picture" >
                <InsertItemTemplate>
                    <asp:FileUpload ID="imageUpload" runat="server" />
                    <br />
                    <asp:RequiredFieldValidator ID="R1" runat="server" ErrorMessage="Picture must NOT be Empty!" 
                        Display="Dynamic" ControlToValidate="imageUpload" ValidationGroup="PictureAdd" />
                </InsertItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="PictureID" HeaderText="PictureID" InsertVisible="false" 
                ReadOnly="true" SortExpression="PictureID" />
            
            <asp:TemplateField HeaderText="Category" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("CategoryID") %>' ></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="PictureCategory" runat="server" DataTextField="Name" DataSourceID="CategoriesDataSource"
                        DataValueField="CategoryID" SelectedValue='<%#Bind("CategoryID") %>' 
                        AppendDataBoundItems="true" >
                        <asp:ListItem Selected="True" Value="">--NONE--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CategoriesDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" 
                        SelectCommand="SELECT * FROM [Categories] WHERE ([UserID] = @UserID)" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="UserIDValue" Name="UserID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("CategoryID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("Title") %>' ></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("Title") %>' ></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R2" runat="server" ErrorMessage="Title must NOT be Empty!" 
                        Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureAdd" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Title") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("Description") %>' ></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("Description") %>' ></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R3" runat="server" ErrorMessage="Description must NOT be Empty!" 
                        Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureAdd" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Description") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="true" CancelText="" ValidationGroup="PictureAdd" />
        </Fields>
    </asp:DetailsView><br />
    <asp:SqlDataSource ID="PicturesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" DeleteCommand="DELETE FROM [Pictures] WHERE [PictureID] = @PictureID" InsertCommand="INSERT INTO [Pictures] ([UserID], [CategoryID], [Title], [Description], [UploadedOn]) VALUES (@UserID, @CategoryID, @Title, @Description, @UploadedOn)" SelectCommand="SELECT * FROM [Pictures] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Pictures] SET [UserID] = @UserID, [CategoryID] = @CategoryID, [Title] = @Title, [Description] = @Description, [UploadedOn] = @UploadedOn WHERE [PictureID] = @PictureID" >
        <DeleteParameters>
            <asp:Parameter Name="PictureID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UploadedOn" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIDValue" Name="UserID" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UploadedOn" Type="DateTime" />
            <asp:Parameter Name="PictureID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    <asp:SqlDataSource ID="maxPictureIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyconnectionString %>"
        SelectCommand="SELECT [PictureID] FROM [Pictures] WHERE ([UserID] = @UserID)" >
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIDValue" Name="UserID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource><br />
    <asp:GridView ID="gvPictures" runat="server" DataSourceID="PicturesDataSource" AutoGenerateColumns="false" 
        DataKeyNames="PicturesID" OnRowUpdating="gvPictures_RowUpdating" >
        <Columns>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ValidationGroup="PictureEdit" />
            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CategoriesDataSource" 
                        DataTextField="Name" DataValueField="CategoryID" SelectedValue='<%#Bind("CategoryID") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="CategoriesDataSource" Enabled="false"
                        DataTextField="Name" DataValueField="CategoryID" SelectedValue='<%#Bind("CategoryID") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("Title") %>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R4" runat="server" ErrorMessage="Title must NOT be Empty!" 
                        Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureEdit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("Description") %>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R5" runat="server" ErrorMessage="Title must NOT be Empty!" 
                        Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureEdit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Date Added" SortExpression="UploadedOn">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("UploadedOn") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("UploadedOn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

