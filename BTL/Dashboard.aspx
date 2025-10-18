<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
    Inherits="BTL.Dashboard" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Dashboard Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container">
        <h1 class="dashboard-title">Quản Lý Hệ Thống</h1>
        <asp:Label ID="lblWelcomeAdmin" runat="server" CssClass="dashboard-welcome"></asp:Label>

        <div class="dashboard-menu">
            <a href="QuanLySanPham.aspx" class="dashboard-link">
                <i class="fas fa-boxes"></i> Quản Lý Sản Phẩm
            </a>
            <a href="QuanLyNguoiDung.aspx" class="dashboard-link">
                <i class="fas fa-users"></i> Quản Lý Người Dùng
            </a>
        </div>
    </div>
</asp:Content>