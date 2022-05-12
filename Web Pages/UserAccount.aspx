<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="ShopAhoy.UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- My Account Start -->
    <div class="my-account">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" data-toggle="pill" href="#account-tab">Account Details</a>
                        <a class="nav-link" data-toggle="pill" href="#orders-tab">Orders</a>

                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="container tab-pane active" id="account-tab">
                            <h4>Account Details</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="name" runat="server" class="form-control" type="text" placeholder="Full Name" ForeColor="Black"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <asp:TextBox ID="email" runat="server" class="form-control" type="text" placeholder="E-mail" Width="540px" ForeColor="Black"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <asp:TextBox ID="dob" runat="server" class="form-control" type="text" placeholder="Date of Birth" Width="540px" ForeColor="Black"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <asp:TextBox ID="userType" runat="server" class="form-control" type="text" Text="User Account" Width="540px" ForeColor="Black"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <asp:TextBox ID="username" runat="server" class="form-control" type="text" placeholder="Username" ForeColor="Black"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" OnClick="LogOutButton_Click">Log Out</asp:LinkButton>
                                    <br>
                                    <br>
                                </div>
                            </div>
                            <h4>Password change</h4>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:TextBox ID="pass" runat="server" class="form-control" type="text" placeholder="Current Password" TextMode="Password" Width="540px"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="newPass" runat="server" class="form-control" type="text" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <asp:Button ID="SaveChange" runat="server" Text="Save Changes" class="btn" OnClick="SaveChange_Click"></asp:Button>
                                </div>
                                <div class="col-md-12">
                                    <asp:Label ID="invalid" runat="server" Text="" class="custom-control-label"></asp:Label>
                                </div>
                                </div>
                        </div>
                        <div class="container tab-pane " id="orders-tab">
                            <h4>Orders</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:GridView ID="orders" runat="server" CssClass="table table-bordered"></asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
