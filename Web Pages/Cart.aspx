<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShopAhoy.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

    <div class="cart-page">
        <div class="container-fluid">
<%--            <div class="row">--%>
                <div class="col-lg-8">
                    <div class="cart-page-inner">

                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="171px" RepeatDirection="Horizontal" RepeatColumns="3">
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#">
                                                <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("productname") %>' /></a>
                                            <br />
                                            <asp:Label ID="ProductBrandLabel" runat="server" Text='<%# Eval("productbrand") %>' />
                                        </div>
                                        <div class="product-image">
                                            <img src='<%# Eval("productimage") %>' alt="Product Image" />
                                            <div class="product-action">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("prID") %>' CommandName="removal" OnCommand="removeProduct"><i class="fa fa-trash"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="product-price">
                                            <a href="#">Qunatity:
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("qunatity") %>'></asp:Label></a>
                                            <br />
                                            <a href="#">Product Price:
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productPrice") %>'></asp:Label></a>
                                            <br />
                                            <a href="#">Totalprice:
                                            <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Eval("totalprice") %>' /></a>
                                        </div>
                                        </a>
                                    </div>
                                    <br />
                                    <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E_commerce_storeConnectionString %>" SelectCommand="SELECT products.productid as prID, productname, productbrand,ProductPrice,ProductPrice*qunatity as totalprice, productimage, qunatity
                        from Shop_Ahoy.products inner join shop_Ahoy.orderedproducts on orderedproducts.productid=products.productid
                        inner join shop_ahoy.shoppingcart on shoppingcart.orderid=orderedproducts.orderid where orderedproducts.orderid=(select orderid from shop_ahoy.shoppingcart where cartID ="></asp:SqlDataSource>

                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="cart-page-inner">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="cart-summary">
                                    <div class="cart-content">
                                        <h1>Cart Summary</h1>
                                        <h2>Grand Total<span>Rs.
                                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                       </span></h2>
                                    </div>

                                    <div class="cart-btn">
                                        <button runat="server">
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/CheckOut.aspx">Check Out</asp:HyperLink>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--            </div>--%>
        </div>
    </div>
</asp:Content>
