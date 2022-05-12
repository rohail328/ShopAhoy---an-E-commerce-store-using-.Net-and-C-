<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="AccountLogIn.aspx.cs" Inherits="ShopAhoy.LoginSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login-form">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="txtUserName" runat="server" Text="Email/Username"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="username" runat="server" class="form-control" type="text" placeholder="Email/Username"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="txtPassword" runat="server" Text="Password"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="password" runat="server" class="form-control" type="text" TextMode="Password" placeholder="Password"></asp:TextBox>

                            </div>
                            <div class="col-md-12">

                                <asp:Label ID="invalid" runat="server" Text="Invalid Credentials"  class="custom-control-label"></asp:Label>

                            </div>
                            <div class="col-md-12">
                                <asp:LinkButton ID="LinkButton4" class="btn" type="Submit" runat="server" OnClick="LoginButton4_Click">Log In</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
