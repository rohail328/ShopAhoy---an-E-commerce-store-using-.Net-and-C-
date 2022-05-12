<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="StoreContact.aspx.cs" Inherits="ShopAhoy.StoreContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-info">
                        <h2>Contact Us</h2>
                        <h3><i class="fa fa-map-marker"></i>Faisal Town Lahore</h3>
                        <h3><i class="fa fa-envelope"></i>shopahoy@gmail.com</h3>
                        <h3><i class="fa fa-phone"></i>+xxx-xxx-xxx </h3>
                        <div class="social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="contact-form">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server" Text="Your Name"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Name" runat="server" Width="230px"></asp:TextBox>

                            </div>
                            <div class="col-md-7">
                                <asp:Label ID="Label2" runat="server" Text="Your Email"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Email" AutoCompleteType="Email" runat="server" Width="233px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            &nbsp;
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Message"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox1" CssClass="form-control" Rows="5" placeholder="Message" runat="server" Height="95px" Width="292px"></asp:TextBox>
                        </div>
                        <div>
                            <asp:LinkButton ID="LinkButton1" CssClass="btn" type="Submit" runat="server">Send Message</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
