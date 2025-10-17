<%@ Page Title="Chi Tiết Sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ChiTietSanPham.aspx.cs" Inherits="BTL.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Chi Tiết Sản phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 40px; max-width: 1200px; margin: 0 auto;">
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Style="display: block; margin-bottom: 20px;"></asp:Label>

        <div id="productDetail" runat="server" visible="false" style="display: flex; gap: 40px;">
            
            <div style="flex: 1; max-width: 500px;">
                <asp:Image ID="imgHinhAnh" runat="server" style="width: 100%; border: 1px solid #eee; border-radius: 8px;" />
            </div>

            <div style="flex: 1.5; padding-top: 10px;">
                <h1 style="color: #333; margin-bottom: 15px;">
                    <asp:Label ID="lblTenSP" runat="server"></asp:Label>
                </h1>
                
                <p style="font-size: 24px; color: #d62b70; font-weight: bold; margin-bottom: 25px;">
                    <asp:Label ID="lblGia" runat="server"></asp:Label>
                </p>

                <div style="margin-bottom: 25px; padding-bottom: 25px; border-bottom: 1px solid #eee;">
                    <h3 style="font-size: 18px; margin-bottom: 10px; color: #555;">Mô tả sản phẩm:</h3>
                    <p>Mã SP: <asp:Label ID="lblMaSP" runat="server"></asp:Label></p>
                    <asp:Label ID="lblMoTa" runat="server" style="line-height: 1.8;"></asp:Label>
                </div>
                
                <div style="display: flex; align-items: center; gap: 20px; margin-bottom: 30px;">
                    <label>Số lượng:</label>
                    <asp:TextBox ID="txtSoLuong" runat="server" Text="1" TextMode="Number" CssClass="form-control" 
                        Style="width: 60px; text-align: center;" />
                </div>

                <asp:Button ID="btnThemVaoGio" runat="server" Text="Thêm vào Giỏ hàng" CssClass="auth-button" Style="width: 250px; font-size: 16px; padding: 12px;" OnClick="btnThemVaoGio_Click"/>
                
                <p style="margin-top: 30px;"><a href="TrangChu.aspx" style="color: #555; text-decoration: none;"><i class="fas fa-chevron-left"></i> Quay lại mua sắm</a></p>
            </div>
        </div>
    </div>
</asp:Content>