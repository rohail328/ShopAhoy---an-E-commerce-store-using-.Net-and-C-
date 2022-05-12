<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="ShopAhoy.AdminAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>SHOPAHOY!</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link href="Template/Img/bag.png" rel="icon" />

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet" />

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="Template/lib-slick/slick.css" rel="stylesheet" />
    <link href="Template/lib-slick/slick-theme.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="Template/lib-easing/easing.min.js"></script>
    <script src="Template/lib-slick/slick.min.js"></script>

    <link href="Template/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top-bar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <i class="fa fa-envelope"></i>
                            shopahoy@gmail.com
                        </div>
                        <div class="col-sm-6">
                            <i class="fa fa-phone-alt"></i>
                            +xxx-xxx-xxx
                        </div>
                    </div>
                </div>
            </div>
            <div class="border-bottom">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-3">
                            <div class="logo">
                                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="#"> <img src="Template/Img/logo1.png" alt="Logo" /></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="my-account">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" data-toggle="pill" href="#account-tab">Account Details</a>
                                <a class="nav-link" data-toggle="pill" href="#product-add">Add Products</a>
                                <a class="nav-link" data-toggle="pill" href="#product-delete">Delete a Product</a>
                                <a class="nav-link" data-toggle="pill" href="#product-edit">Edit a Product</a>
                                <a class="nav-link" data-toggle="pill" href="#user-record">User Records</a>
                                <a class="nav-link" data-toggle="pill" href="#product-record">Product Records</a>
                                <a class="nav-link" data-toggle="pill" href="#catagory-record">Catagory Records</a>
                                <a class="nav-link" data-toggle="pill" href="#order-record">Order Records</a>
                                <a class="nav-link" data-toggle="pill" href="#stock-record">Stock Records</a>
                                <a class="nav-link" data-toggle="pill" href="#shipment-record">Shipment Records</a>
                                <a class="nav-link" data-toggle="pill" href="#transaction-record">Transaction Records</a>

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
                                            <asp:TextBox ID="userType" runat="server" class="form-control" type="text" Text="Admin Account" Width="540px" ForeColor="Black"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="username" runat="server" class="form-control" type="text" placeholder="Username" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server"  OnClick="LogOutButton_Click" >Log Out</asp:LinkButton>
                                            <br />
                                            <br />
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
                                            <asp:Button ID="SaveChange" runat="server" Text="Save Changes" class="btn" OnClick="SaveChange_Click" ></asp:Button>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:Label ID="invalid" runat="server" Text="" class="custom-control-label"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                 <div class="container tab-pane " id="product-add">
                                    <h4>Add Products

                                    </h4>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="pname" runat="server" class="form-control" type="text" placeholder="Product Name" ></asp:TextBox>
                                            <asp:TextBox ID="brand" runat="server" class="form-control" type="text" placeholder="Brand Name" ></asp:TextBox>
                                            <asp:TextBox ID="rating" runat="server" class="form-control" type="text" placeholder="Rating" ></asp:TextBox>
                                            <asp:TextBox ID="category" runat="server" class="form-control" type="text" placeholder="Category" ></asp:TextBox>
                                            <asp:TextBox ID="description" runat="server" class="form-control" type="text" placeholder="Description" ></asp:TextBox>
                                            <asp:TextBox ID="price" runat="server" class="form-control" type="text" placeholder="Price" ></asp:TextBox>
                                            <asp:TextBox ID="image" runat="server" class="form-control" type="text" placeholder="image name" ></asp:TextBox> 
                                            <asp:TextBox ID="stock" runat="server" class="form-control" type="text" placeholder="Amount of the product" ></asp:TextBox> 
                                            <br />
                                            <asp:Button ID="addprodproceed" runat="server" Text="Add" class="btn" OnClick="add_Click" ></asp:Button>
                                            <br />
                                            <asp:Label ID="productadded" runat="server" Text="" class="custom-control-label"></asp:Label>
                                            </div>
                                         </div>

                                </div>
                                 <div class="container tab-pane " id="product-delete">
                                    <h4>Delete a Product</h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                             
                                            <asp:TextBox ID="delname" runat="server" class="form-control" type="text" placeholder="Enter the Product Name" ></asp:TextBox>
                                            <asp:Button ID="delbutton" runat="server" Text="Delete" class="btn" OnClick="delete_Click" ></asp:Button>
                                            <br />
                                            <asp:Label ID="producteleted" runat="server" Text="" class="custom-control-label"></asp:Label>
                                        </div>
                                         </div>
                                    </div>

                                 <div class="container tab-pane " id="product-edit">
                                    <h4>Edit a Product</h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                             
                                            <asp:TextBox ID="edname" runat="server" class="form-control" type="text" placeholder="Enter the Product Name" ></asp:TextBox>
                                            <asp:RadioButtonList ID="change" runat="server">
                                            <asp:ListItem>Description</asp:ListItem>
                                            <asp:ListItem>Price</asp:ListItem>
                                            <asp:ListItem>Stock</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                            <asp:TextBox ID="changeline" runat="server" class="form-control" type="text" placeholder="Enter the respective changing" ></asp:TextBox>
                                            <asp:Button ID="editbutton" runat="server" Text="Edit" class="btn" OnClick="edit_Click" ></asp:Button>
                                            <asp:Label ID="productedited" runat="server" Text="" class="custom-control-label"></asp:Label>
                                        </div>
                                         </div>
                                    </div>

                                <div class="container tab-pane " id="user-record">
                                    <h4>User Records</h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="accountsview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>
                                    </div>

                               

                                <div class="container tab-pane " id="product-record">
                                    <h4>Product Records</h4>
                                     <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="productview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>

                                </div>
                                <div class="container tab-pane " id="catagory-record">
                                    <h4>Catagory Records</h4>
                                    <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="categoryview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>
                                </div>
                                <div class="container tab-pane " id="order-record">
                                    <h4>Order Records</h4>
                                   <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="orderview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>

                                </div>
                                <div class="container tab-pane " id="stock-record">
                                    <h4>Stock Records</h4>
                                     <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="stockview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>
                                </div>
                                <div class="container tab-pane " id="shipment-record">
                                    <h4>Shipment Records</h4>
                                     <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="shipmentview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>
                                </div>
                                <div class="container tab-pane " id="transaction-record">
                                    <h4>Transaction Records</h4>
                                     <div class="row">
                                        <div class="col-md-6">
                                                <asp:GridView ID="transactionview" runat="server" CssClass="table table-bordered" HeaderStyle-CssClass="thead-dark"></asp:GridView>
                                            </div>
                                         </div>
                                </div>
                            </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            
            <div class="footer-bottom">
                <div class="col-md-6 copyright">
                    <p>Copyright &copy; <a href="ProductDetails.aspx">ShopAhoy</a>. All Rights Reserved</p>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
