<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="AccountSignUp.aspx.cs" Inherits="ShopAhoy.AccountSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="login">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="register-form">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textbox2" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="textbox2" runat="server" class="form-control" type="text" placeholder="Full Name" MaxLength="30" ></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="Label2" runat="server" Text="E-mail"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textbox3" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="textbox3" runat="server" class="form-control" type="text" placeholder="E-mail" MaxLength="225"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label4" runat="server" Text="Username"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textbox4" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="textbox4" runat="server" class="form-control" type="text" placeholder="Username" MaxLength="30"></asp:TextBox>

                            </div>
                            <div class="col-md-12">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                    <asp:Label ID="LabelDOB" runat="server" Text="Date of Birth"></asp:Label>
                                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="textbox6" ControlToValidate="textbox5" ErrorMessage="CompareValidator" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                                <asp:TextBox ID="textbox5" runat="server" class="form-control" type="text" placeholder="Password" MaxLength="30" TextMode="Password"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label6" runat="server" Text="Retype Password"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textbox6" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="textbox6" runat="server" class="form-control" type="text" placeholder="Retype Password" MaxLength="30" TextMode="Password"></asp:TextBox>

                            </div>
<%--                            <div class="col-md-6">
                                <asp:Label ID="Labelacc" runat="server" Text="Account type"></asp:Label>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                    <asp:ListItem>User</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>--%>
                            <div class="col-md-12">
                                <br />
                                <asp:LinkButton ID="LinkButton2" class="btn" type="Submit" runat="server" OnClick="CreateAccount">Sign Up</asp:LinkButton>
                            </div>
                            <div class="col-md-12">
                                <asp:Label ID="invalid" runat="server" Text="" class="custom-control-label"></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
