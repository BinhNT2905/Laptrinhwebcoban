<%@ Page Title="Thanh Toán" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThanhToan.aspx.cs" Inherits="BTL.ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Thanh Toán
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
.checkout-container {
    max-width: 700px;
    margin: 0 auto;
    padding: 25px;
    background: #fff;
}
.checkout-title {
    text-align: center;
    color: #d62b70;
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 25px;
}
.section-box {
    background: #fafafa;
    padding: 22px;
    border: 1px solid #eee;
    border-radius: 10px;
    margin-bottom: 22px;
}
.section-title {
    font-size: 19px;
    font-weight: 600;
    margin-bottom: 14px;
    color: #444;
}
.form-group {
    margin-bottom: 14px;
}
.form-group label {
    font-weight: 500;
    margin-bottom: 4px;
    display: block;
}
.input-box {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
.summary-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
.summary-label {
    color: #555;
}
.total-price {
    font-weight: bold;
    font-size: 20px;
    color: #d62b70;
}
.btn-checkout {
    background: #d62b70;
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    color: white;
    cursor: pointer;
    font-weight: 600;
}
.btn-checkout:hover {
    background: #b91b5e;
}
</style>

<div class="checkout-container">
    <h2 class="checkout-title">Thanh Toán Đơn Hàng</h2>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true"
        Style="margin-bottom: 15px; display: block;"></asp:Label>

    <!-- Thông tin giao hàng -->
    <div class="section-box">
        <div class="section-title">Thông tin giao hàng</div>

        <div class="form-group">
            <label>Họ tên người nhận *</label>
            <asp:TextBox ID="txtHoTen" CssClass="input-box" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Số điện thoại *</label>
            <asp:TextBox ID="txtDienThoai" CssClass="input-box" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Địa chỉ giao hàng *</label>
            <asp:TextBox ID="txtDiaChi" CssClass="input-box" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
        </div>
    </div>

    <!-- Tóm tắt đơn -->
    <div class="section-box">
        <div class="section-title">Tóm tắt đơn hàng</div>

        <div class="summary-row">
            <span>Sản phẩm:</span>
            <asp:Label ID="lblSoSanPham" runat="server"></asp:Label>
        </div>

        <div class="summary-row">
            <span class="summary-label">Tạm tính:</span>
            <asp:Label ID="lblTamTinh" runat="server"></asp:Label>
        </div>
        <div class="summary-row" style="border-bottom:1px solid #eee; padding-bottom:8px;">
            <span class="summary-label">Phí ship:</span>
            <span>30,000₫</span>
        </div>
        <div class="summary-row">
            <span class="total-price">Tổng cộng:</span>
            <asp:Label ID="lblTongCong" CssClass="total-price" runat="server"></asp:Label>
        </div>

        <div class="form-group" style="margin-top:12px;">
            <label>Phương thức thanh toán:</label>
            <asp:RadioButtonList ID="rblPhuongThuc" runat="server">
                <asp:ListItem Value="COD" Selected="True">Thanh toán khi nhận hàng (COD)</asp:ListItem>
                <asp:ListItem Value="Transfer">Chuyển khoản ngân hàng</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>

    <asp:Button ID="btnHoanTat" CssClass="btn-checkout" runat="server" Text="Hoàn tất đặt hàng" OnClick="btnHoanTat_Click" />
</div>

</asp:Content>
