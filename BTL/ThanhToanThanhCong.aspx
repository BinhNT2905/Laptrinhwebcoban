<%@ Page Title="Đặt hàng thành công" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThanhToanThanhCong.aspx.cs" Inherits="BTL.ThanhToanThanhCong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Đặt hàng thành công
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 60px; max-width: 600px; margin: 40px auto; text-align: center; border: 2px solid #d62b70; border-radius: 10px; background-color: #f9f9f9;">
        <i class="fas fa-check-circle" style="font-size: 60px; color: #28a745; margin-bottom: 20px;"></i>
        <h1 style="color: #28a745; margin-bottom: 15px;">ĐẶT HÀNG THÀNH CÔNG!</h1>
        <p style="font-size: 16px; margin-bottom: 30px;">Cảm ơn bạn đã tin tưởng và mua hàng tại TMB. Chúng tôi sẽ liên hệ xác nhận đơn hàng sớm nhất.</p>
        
        <asp:HyperLink ID="lnkTrangChu" runat="server" NavigateUrl="TrangChu.aspx" CssClass="auth-button" Style="display: inline-block; padding: 10px 30px;">
            Quay lại Trang Chủ
        </asp:HyperLink>
    </div>
</asp:Content>