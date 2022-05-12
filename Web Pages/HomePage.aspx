<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ShopAhoy.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main Slider Start -->
    <div class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
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
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6">
                    <div class="header-slider normal-slider">
                        <div class="header-slider-item">
                            <img src="Template/Img/slider-1.jpg" alt="Slider Image" />
                            <div class="header-slider-caption">
                                <a class="btn" href="ProductList.aspx" ><i class="fa fa-shopping-cart"></i>Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="header-img">
                        <div class="img-item">
                            <img src="Template/Img/category-5.jpg" />
                            <a id="a5" class="img-text" href="#" runat="server" onserverclick="load_Catagory"></a>
                        </div>
                        <div class="img-item">
                            <img src="Template/Img/category-7.jpg" />
                            <a id="a6" class="img-text" href="#" runat="server" onserverclick="load_Catagory"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Slider End -->


    <!-- Feature Start-->
    <div class="feature">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fab fa-cc-mastercard"></i>
                        <h2>Secure Payment</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-truck"></i>
                        <h2>Worldwide Delivery</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-sync-alt"></i>
                        <h2>90 Days Return</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 feature-col">
                    <div class="feature-content">
                        <i class="fa fa-comments"></i>
                        <h2>24/7 Support</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End-->

    <!-- Category Start-->
<%--    <div class="category">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="Template/Img/category-3.jpg" />
                        <a class="category-name" href="#">
                            <p>Casual Clothing</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-250">
                        <img src="Template/Img/category-4.jpg" />
                        <a class="category-name" href="#">
                            <p>Cosmetics</p>
                        </a>
                    </div>
                    <div class="category-item ch-150">
                        <img src="Template/Img/category-5.jpg" />
                        <a class="category-name" href="#">
                            <p>Accesories</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-150">
                        <img src="Template/Img/category-6.jpg" />
                        <a class="category-name" href="#">
                            <p>Skin Care</p>
                        </a>
                    </div>
                    <div class="category-item ch-250">
                        <img src="Template/Img/category-7.jpg" />
                        <a class="category-name" href="#">
                            <p>Electronics</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="category-item ch-400">
                        <img src="Template/Img/category-8.jpg" />
                        <a class="category-name" href="#">
                            <p>Party Wear</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- Category End-->


    <!-- Featured Product Start -->
    <div class="featured-product product">
        <div class="container-fluid">
            <div class="section-header">
                <h1>Featured Product</h1>
            </div>
            <div class="row align-items-center product-slider product-slider-3">
<%--                <div class="col-lg-3">
                    <div class="product-item">
                        <div class="product-title">
                            <a href="#">Iphone 12</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div class="product-image">
                            <a href="product-detail.html">
                                <img src="Template/Img/pr1.jpg" />
                            </a>
                            <div class="product-action">
                                <a href="#"><i class="fa fa-cart-plus"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                                <a href="#"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="product-price">
                            <h3><span>$</span>700</h3>
                            <a class="btn" href="#"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="product-item">
                        <div class="product-title">
                            <a href="#">Samsun Galaxy S10 lite</a>
                            <div class="ratting">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div class="product-image">
                            <a href="product-detail.html">
                                <img src="Template/Img/pr2.jpg" />
                            </a>
                            <div class="product-action">
                                <a href="#"><i class="fa fa-cart-plus"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                                <a href="#"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="product-price">
                            <h3><span>$</span>1100</h3>
                            <a class="btn" href="#"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="product-item">
                        <div class="product-title">
                            <a href="#">Xiaomi mi 11</a>
                            <div class="ratting">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div class="product-image">
                            <a href="product-detail.html">
                                <img src="Template/Img/pr3.jpeg" />
                            </a>
                            <div class="product-action">
                                <a href="#"><i class="fa fa-cart-plus"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                                <a href="#"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="product-price">
                            <h3><span>$</span>875</h3>
                            <a class="btn" href="#"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="product-item">
                        <div class="product-title">
                            <a href="#">Samsung Galaxy S21</a>
                            <div class="ratting">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div class="product-image">
                            <a href="product-detail.html">
                                <img src="img/product-4.jpg" alt="Product Image"><img src="Template/Img/pr4.jpeg" />
                            </a>
                            <div class="product-action">
                                <a href="#"><i class="fa fa-cart-plus"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                                <a href="#"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="product-price">
                            <h3><span>$</span>2150</h3>
                            <a class="btn" href="#"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                        </div>
                    </div>
                </div>--%>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="171px" RepeatDirection="Horizontal" RepeatColumns="6">
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
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ProductId") %>' CommandName="producDetails" OnCommand="openProduct"><i class="fa fa-search"></i></asp:LinkButton>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E_commerce_storeConnectionString %>" SelectCommand="select top(20) ProductId,ProductName,ProductBrand,ProductPrice,productImage from Shop_Ahoy.Products order by ProductRating desc"></asp:SqlDataSource>

            </div>

        </div>
    </div>
    <!-- Featured Product End -->


</asp:Content>
