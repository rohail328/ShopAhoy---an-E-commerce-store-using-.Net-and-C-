<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ShopAhoy.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Product List Start -->
    <div class="product-view">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-view-top">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="product-short">
                                            <div class="dropdown">
                                                <div class="dropdown-toggle" data-toggle="dropdown">Product sort by</div>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <asp:LinkButton ID="LinkButton2" CssClass="dropdown-item" runat="server" CommandArgument="1" CommandName="sort" OnCommand="sortItems">Rating</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton3" CssClass="dropdown-item" runat="server" CommandArgument="2" CommandName="sort" OnCommand="sortItems">Price</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton4" CssClass="dropdown-item" runat="server" CommandArgument="3" CommandName="sort" OnCommand="sortItems">Alphabetically</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="product-price-range">
                                            <div class="dropdown">
                                                <div class="dropdown-toggle" data-toggle="dropdown">Product price range</div>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <asp:LinkButton ID="LinkButton5" CssClass="dropdown-item" CommandArgument="1" CommandName="filter" OnCommand="filterItems" runat="server">Rs.50 to Rs.500</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton6" CssClass="dropdown-item" CommandArgument="2" CommandName="filter" OnCommand="filterItems" runat="server">Rs.500 to Rs.5000</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton7" CssClass="dropdown-item" CommandArgument="3" CommandName="filter" OnCommand="filterItems" runat="server"> above Rs.5000</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="171px" RepeatDirection="Horizontal" RepeatColumns="3">
                            <ItemTemplate>
                                <div class="col-md-4">
                                        <div class="product-item" onclick="openProduct">
                                            <div class="product-title">
                                                <a href="#">
                                                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' /></a>
                                                <br />
                                                <asp:Label ID="ProductBrandLabel" runat="server" Text='<%# Eval("ProductBrand") %>' />
                                            </div>
                                            <div class="product-image">
                                                <img src='<%# Eval("productImage") %>' alt="Product Image" />
                                                <div class="product-action">
                                                    <asp:LinkButton ID="LinkButton1" runat="server"  CommandArgument='<%# Eval("ProductId") %>' CommandName="producDetails" OnCommand="openProduct"><i class="fa fa-search"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="product-price">
                                                <h3>
                                                    <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Eval("ProductPrice") %>' /></h3>
                                                <a class="btn"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                            </div>
                                    </a>
                                </div>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E_commerce_storeConnectionString %>" SelectCommand="select ProductId,ProductName,ProductBrand,ProductPrice,productImage from Shop_Ahoy.Products"></asp:SqlDataSource>

                    </div>

                </div>

                <!-- Side Bar Start -->
                <div class="col-lg-4 sidebar">
                    <div class="sidebar-widget category">
                        <h2 class="title">Category</h2>
                        <nav class="navbar bg-light">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a id="s5" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-tshirt" runat="server"></i>Fashion</a>
                                </li>
                                <li class="nav-item">
                                    <a id="s2" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-shopping-bag"></i>Groceries</a>
                                </li>
                                <li class="nav-item">
                                    <a id="s6" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-car"></i>Automotive Parts</a>
                                </li>
                                <li class="nav-item">
                                    <a id="s3" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-female"></i>Cosmetics</a>
                                </li>
                                <li class="nav-item">
                                    <a id="s1" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-microchip"></i>Electronics</a>
                                </li>
                                <li class="nav-item">
                                    <a id="s4" class="nav-link" href="#" runat="server" onserverclick="load_Catagory"><i class="fa fa-hockey-puck"></i>Sports</a>
                                </li>
                                <li class="nav-item">
                                    <a id="A1" class="nav-link" href="ProductList.aspx" runat="server"><i class="fa fa-infinity"></i>All Products</a>
                                </li>

                            </ul>
                        </nav>
                    </div>


                </div>
                <!-- Side Bar End -->
            </div>
        </div>
    </div>
    <!-- Product List End -->
</asp:Content>
