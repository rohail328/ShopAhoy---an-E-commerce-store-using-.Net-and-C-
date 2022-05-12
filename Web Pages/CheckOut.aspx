<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="ShopAhoy.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Checkout Start -->
        <div class="checkout">
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-inner">
                            <div class="billing-address">
                                <h2>Delivery Information</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Mobile No</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TextBox5"  CssClass="form-control" type="text" placeholder="Mobile No" runat="server"></asp:TextBox>
                                        
                                    </div>
                                    <div class="col-md-12">
                                        <label>Address</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TextBox6"  CssClass="form-control" type="text" placeholder="Address"  runat="server"></asp:TextBox>
                                        
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="checkout-inner">
                            <div class="checkout-summary">
                                <h1>Cart Total</h1>
<%--                                <p class="sub-total">Sub Total<span>$99</span></p>--%>
                                <p class="ship-cost"> Rs.
                                    <asp:Label ID="shipCost" runat="server" Text="0"></asp:Label><span>$1</span></p>
                                <h2>Grand Total<span><asp:Label ID="Total" runat="server" Text="0"></asp:Label></span></h2>
                            </div>

                            <div class="checkout-payment">
                                <div class="payment-methods">
                                    <h1>Payment Methods</h1>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="RequiredField" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="paymentMethodSelecetd">
                                        <asp:ListItem>Cash On Delivery</asp:ListItem>
                                        <asp:ListItem>Credit/Debit card Payment</asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                    <asp:TextBox ID="creditCard" runat="server" CssClass="form-control" type="text" placeholder="credit card number" ></asp:TextBox>
                                </div>
                                <div class="checkout-btn">
                                    <asp:LinkButton ID="LinkButton2" class="btn" type="Submit" runat="server" OnClick="Placeorder">Place order</asp:LinkButton>
                                    <asp:Label ID="invalid" runat="server" Text=""></asp:Label>
                                </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- Checkout End -->
</asp:Content>
