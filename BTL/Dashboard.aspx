<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
    Inherits="BTL.Dashboard" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Dashboard Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-wrapper">

        <div class="dashboard-header">
            <h1>📊 Dashboard Quản Trị</h1>
            <asp:Label ID="lblWelcomeAdmin" runat="server" CssClass="welcome-text"></asp:Label>
        </div>

        <div class="dashboard-cards">

            <a href="QuanLySanPham.aspx" class="card">
                <i class="fas fa-box-open card-icon"></i>
                <h3>Quản lý sản phẩm</h3>
                <p>Thêm, sửa, xóa & quản lý sản phẩm</p>
            </a>

            <a href="QuanLyNguoiDung.aspx" class="card">
                <i class="fas fa-user-shield card-icon"></i>
                <h3>Quản lý người dùng</h3>
                <p>Phân quyền & quản lý tài khoản</p>
            </a>

            <a href="#" class="card">
                <i class="fas fa-shopping-cart card-icon"></i>
                <h3>Đơn hàng</h3>
                <p>Xem & xử lý đơn đặt hàng</p>
            </a>

            <a href="#" class="card">
                <i class="fas fa-chart-line card-icon"></i>
                <h3>Thống kê</h3>
                <p>Thống kê doanh thu & bán hàng</p>
            </a>

        </div>

    </div>
</asp:Content>
