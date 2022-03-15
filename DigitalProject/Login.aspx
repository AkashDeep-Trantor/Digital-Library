<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Login to the Site</h3> <br />
    <asp:Login ID="Login1" runat="server" CreateUserText="Create An Account" CreateUserUrl="~/CreateAccount.aspx" />
</asp:Content>

