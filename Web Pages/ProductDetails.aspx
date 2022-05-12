<%@ Page Title="" Language="C#" MasterPageFile="~/ShopAhoy.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShopAhoy.ProductDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <div class="product-detail">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product-detail-top">
                        <div class="row align-items-center">
                            <div class="col-md-5">
                                <div class="product-slider-single normal-slider">
                                    <img  ID="productImage" src="empty" alt="Product Image" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="product-content">
                                    <div class="title">
                                        <h2>
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
                                        <br />
                                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                        <br />
                                        <h4>Price: Rs.
                                            <asp:Label ID="price" runat="server" Text=""></asp:Label></h4>

                                    </div>
                                    <div class="ratting">
                                        <i id="s1" class="fa fa-star" runat="server"></i>
                                        <i id="s2" class="fa fa-star" runat="server"></i>
                                        <i id="s3" class="fa fa-star" runat="server"></i>
                                        <i id="s4" class="fa fa-star" runat="server"></i>
                                        <i id="s5" class="fa fa-star" runat="server"></i>
                                    </div>
                                    <br />
                                    <asp:Label ID="Label8" runat="server" Text="Out Of Stock"></asp:Label>
                                    <br />
                                    <div id="selectQuantity" class="quantity" runat="server">
                                        <h4>Quantity:</h4>
                                        <div class="qty">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <button id="minus" class="btn-minus" runat="server" onserverclick="decrement"><i class="fa fa-minus"></i></button>
                                                    <asp:TextBox ID="quantity" runat="server" Text="1" Width="26px"></asp:TextBox>
                                                    <button id="plus" class="btn-plus" runat="server" onserverclick="increment"><i class="fa fa-plus"></i></button>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </div>
                                    </div>
                                    <div id="add_to_cart" class="action" runat="server">
<%--                                        <a class="btn" href="#"><i class="fa fa-shopping-cart"></i>Add to Cart</a>--%>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" OnClick="addToCart"><i class="fa fa-shopping-cart"></i>Add to Cart</asp:LinkButton>
                                        <a class="btn" href="CheckOut.aspx"><i class="fa fa-shopping-bag"></i>Buy Now</a>
                                        <asp:Label ID="invalid" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row product-detail-bottom">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-justified">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#reviews">Reviews</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div id="description" class="container tab-pane active">
                                    <h4>Product description</h4>
                                    <p>
                                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                    </p>
                                </div>
                                <div id="reviews" class="container tab-pane ">
                                    <div id="giveReview" class="reviews-submit" runat="server">
                                        <h4>Give your Review:</h4>
                                        <div class="ratting">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="1" CommandName="rate1" OnCommand="rate"><i id="sa1" class="far fa-star" runat="server"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="2" CommandName="rate2" OnCommand="rate"><i id="sa2" class="far fa-star" runat="server"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="3" CommandName="rate3" OnCommand="rate"><i id="sa3" class="far fa-star" runat="server"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="4" CommandName="rate4" OnCommand="rate"><i id="sa4" class="far fa-star" runat="server"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="5" CommandName="rate5" OnCommand="rate"><i id="sa5" class="far fa-star" runat="server"></i></asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="row form">
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="TextBox3"  placeholder="Your Review of the Product" runat="server" Width="50%"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:LinkButton ID="rewviewSubmit" CssClass="btn" runat="server" OnClick="rewviewSubmit_Click">Submit</asp:LinkButton>

                                            </div>
                                        </div>
                                    </div>

                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <div class="review-submitted">
                                                <div class="reviewer">
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("reviewDate") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("review") %>'></asp:Label>

                                                </div>
                                                <br />
                                                <br />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:conString %>' SelectCommand="select Username,review,reviewDate from Shop_Ahoy.Rating inner join Shop_Ahoy.AccountInformation  on Shop_Ahoy.Rating.AccountId=Shop_Ahoy.AccountInformation.AccountId  where Shop_Ahoy.Rating.ProductId="></asp:SqlDataSource>
                                   
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
