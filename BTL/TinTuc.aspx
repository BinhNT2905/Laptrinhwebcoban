<%@ Page Title="Tin Tức" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TinTuc.aspx.cs" Inherits="BTL.TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tin Tức
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 40px; max-width: 900px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 30px; text-align: center;">Tin Tức & Khuyến Mãi</h1>
        
        <div style="border: 1px solid #eee; padding: 20px; margin-bottom: 20px; border-radius: 8px;">
            <h2 style="font-size: 20px; color: #555;">💥 BIG SALE cuối năm: Giảm 50% toàn bộ sản phẩm!</h2>
            <p style="font-size: 14px; color: #999; margin-top: 5px;">Đăng ngày: 15/10/2025</p>
            <p style="margin-top: 15px;">Chương trình áp dụng từ 20/10 đến 30/10/2025. Nhanh tay săn ngay túi xách yêu thích!</p>
        </div>
        
        <div style="border: 1px solid #eee; padding: 20px; margin-bottom: 20px; border-radius: 8px;">
            <h2 style="font-size: 20px; color: #555;">Bộ sưu tập Thu Đông 2025 đã lên kệ</h2>
            <p style="font-size: 14px; color: #999; margin-top: 5px;">Đăng ngày: 01/10/2025</p>
            <p style="margin-top: 15px;">Khám phá các mẫu thiết kế mới nhất với tông màu ấm áp và chất liệu cao cấp.</p>
        </div>
        
        <p style="text-align: center; margin-top: 40px;">--- Hết ---</p>
    </div>
</asp:Content>