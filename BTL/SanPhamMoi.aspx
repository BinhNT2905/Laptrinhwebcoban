<%@ Page Title="Sản phẩm mới" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="SanPhamMoi.aspx.cs" Inherits="BTL.SanPhamMoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sản phẩm mới
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="featured">
        <h2>NEW ARRIVAL</h2>

        <!-- Danh sách sản phẩm -->
        <div class="product-grid">
            <asp:ListView ID="lvProducts" runat="server"
                OnItemCommand="lvProducts_ItemCommand"
                OnPagePropertiesChanging="lvProducts_PagePropertiesChanging">

                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </LayoutTemplate>

                <ItemTemplate>
                    <div class="product-card">
                        <a href='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>'>
                            <img src='<%# Eval("HinhAnh") %>' alt='<%# Eval("TenSP") %>' />
                        </a>

                        <h3>
                            <asp:HyperLink ID="lnkTenSP" runat="server"
                                NavigateUrl='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>'
                                Text='<%# Eval("TenSP") %>' />
                        </h3>

                        <p class="price"><%# string.Format("{0:N0}", Eval("Gia")) %>₫</p>

                    </div>
                </ItemTemplate>

                <EmptyDataTemplate>
                    <p style="text-align:center; grid-column:1/-1;">Hiện chưa có sản phẩm nào được bán.</p>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

        <!-- Phân trang -->
        <div class="pagination-container">
            <asp:DataPager ID="pagerProducts" runat="server" PagedControlID="lvProducts" PageSize="8">
                <Fields>
                    <asp:NumericPagerField ButtonCount="5" />
                </Fields>
            </asp:DataPager>

        </div>
    </div>

    <style>
        .featured {
            padding: 60px 0;
            text-align: center;
            background: linear-gradient(180deg, #fff, #fdf3f8);
        }

        .featured h2 {
            font-size: 32px;
            color: #d62b70;
            font-weight: 800;
            margin-bottom: 40px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 35px;
            justify-items: center;
            padding: 0 60px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 15px;
            max-width: 270px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(214, 43, 112, 0.25);
            border-color: #d62b70;
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.4s ease;
        }

        .product-card:hover img {
            transform: scale(1.07);
        }

        .product-card h3 {
            font-size: 17px;
            font-weight: 600;
            color: #6a0dad;
            margin: 10px 0 8px;
        }

        .product-card .price {
            color: #d62b70;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 12px;
        }

        .btn-buy {
            background: linear-gradient(90deg, #6a0dad, #d62b70);
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-buy:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(214, 43, 112, 0.4);
        }

        .pagination-container {
            text-align: center;
            margin-top: 40px;
        }

        /* Các trang khác (link <a>) */
        .pagination-container {
            text-align: center;
            margin-top: 40px;
        }

        /* Nút các trang khác */
        .pagination-container a {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 14px;
            border: 1px solid #f4a6c6;
            border-radius: 12px;
            color: #d65a92;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        /* Hover cho nút khác */
        .pagination-container a:hover {
            background: linear-gradient(90deg, #fbc1dc, #f58ab5);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(245, 138, 181, 0.3);
        }

        /* Nút trang hiện tại */
        .pagination-container span {
            background: linear-gradient(90deg, #f58ab5, #fbc1dc);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            padding: 8px 14px;
            box-shadow: 0 4px 10px rgba(245, 138, 181, 0.4);
        }


    </style>
</asp:Content>
