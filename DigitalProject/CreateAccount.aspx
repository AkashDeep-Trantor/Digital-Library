<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="CreateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3>Create a New Account</h3>
    In order to add your account to The Online Digital Library, you will need to first create a User Account
    Fill out the following form to create a New Account
    <br />
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server"
        CancelDestinationPage="~/Default.aspx" 
        ContinueDestinationPageUrl="~/DigitalAdmin/ManageCategories.aspx" 
        DisplayCancelButton="true">        
    </asp:CreateUserWizard>
</asp:Content>

