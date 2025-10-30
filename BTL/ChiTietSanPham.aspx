<%@ Page Title="Chi Tiết Sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ChiTietSanPham.aspx.cs" Inherits="BTL.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Chi Tiết Sản phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <!-- Thông báo -->
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true"
            Style="display:block; margin-bottom:20px;"></asp:Label>

        <!-- Chi tiết sản phẩm -->
        <div id="productDetail" runat="server" visible="false" class="product-detail">

            <!-- Khối ảnh -->
            <div class="image-section">
                <img id="mainImage" runat="server" class="main-image" alt="Ảnh sản phẩm" />

                <!-- Gallery ảnh nhỏ -->
                <div id="thumbnailList" runat="server" class="thumb-gallery"></div>

                <script>
                    function changeMainImage(src, thumb) {
                        const mainImg = document.getElementById('<%= mainImage.ClientID %>');
                        if (mainImg) {
                            mainImg.src = src;
                        }
                        // Active border
                        document.querySelectorAll('.thumb-gallery img').forEach(img => img.classList.remove('active'));
                        if (thumb) thumb.classList.add('active');
                    }
                </script>
            </div>

            <!-- Thông tin -->
            <div class="info-section">
                <h1><asp:Label ID="lblTenSP" runat="server"></asp:Label></h1>

                <p class="price">
                    <asp:Label ID="lblGia" runat="server"></asp:Label>
                </p>

                <div class="description">
                    <p><strong>Mã SP:</strong> <asp:Label ID="lblMaSP" runat="server"></asp:Label></p>
                    <asp:Label ID="lblMoTa" runat="server"></asp:Label>
                </div>

                <div class="actions">
                    <label for="txtSoLuong">Số lượng:</label>
                    <asp:TextBox ID="txtSoLuong" runat="server" CssClass="quantity-input" Text="1" TextMode="Number" min="1" oninput="validSoLuong(this)" />

                </div>

                <div class="buttons">
                    <asp:Button ID="btnThemVaoGio" runat="server" CssClass="btn btn-cart" Text="🛒 Thêm vào giỏ hàng"
                        OnClick="btnThemVaoGio_Click" />
                    <asp:Button ID="btnMuaNgay" runat="server" CssClass="btn btn-buy" Text="⚡ Mua ngay"
                        OnClick="btnMuaNgay_Click" />
                </div>

                <a href="TrangChu.aspx" class="back-link">← Quay lại mua sắm</a>
            </div>
        </div>
    </div>
</asp:Content>
