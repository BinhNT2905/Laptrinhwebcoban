<%@ Page Title="Thanh Toán" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThanhToan.aspx.cs" Inherits="BTL.ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Thanh Toán
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 40px; max-width: 800px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 30px; text-align: center;">Thông Tin Thanh Toán</h1>
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Style="display: block; margin-bottom: 15px;"></asp:Label>

        <div style="border: 1px solid #ccc; padding: 30px; border-radius: 8px; margin-bottom: 30px;">
            <h2 style="color: #555; margin-bottom: 20px; font-size: 20px;">1. Thông tin giao hàng</h2>
            
            <div class="form-group">
                <label>Họ tên người nhận <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Số điện thoại <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtDienThoai" runat="server" TextMode="Number" CssClass="form-control" required="required"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Địa chỉ giao hàng <span style="color: red;">*</span></label>
                <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" required="required"></asp:TextBox>
            </div>
        </div>

        <div style="border: 1px solid #ccc; padding: 30px; border-radius: 8px;">
            <h2 style="color: #555; margin-bottom: 20px; font-size: 20px;">2. Tóm tắt đơn hàng</h2>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                <span>Tạm tính (2 Sản phẩm):</span>
                <asp:Label ID="lblTamTinh" runat="server" Text="4,200,000₫"></asp:Label>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px; border-bottom: 1px solid #eee; padding-bottom: 10px;">
                <span>Phí vận chuyển:</span>
                <span>30,000₫</span>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                <span style="font-weight: bold; font-size: 18px;">Tổng cộng:</span>
                <asp:Label ID="lblTongCong" runat="server" Text="4,230,000₫" style="font-weight: bold; font-size: 18px; color: #d62b70;"></asp:Label>
            </div>

            <h2 style="color: #555; margin-bottom: 15px; font-size: 20px;">3. Phương thức thanh toán</h2>
            <asp:RadioButtonList ID="rblPhuongThuc" runat="server" RepeatDirection="Vertical" CssClass="form-control" Style="margin-bottom: 20px;">
                <asp:ListItem Value="COD" Selected="True">Thanh toán khi nhận hàng (COD)</asp:ListItem>
                <asp:ListItem Value="Transfer">Chuyển khoản ngân hàng</asp:ListItem>
            </asp:RadioButtonList>

            <asp:Button ID="btnHoanTat" runat="server" Text="Hoàn tất Đặt hàng" OnClick="btnHoanTat_Click" CssClass="auth-button" Style="width: 100%; font-size: 18px; padding: 15px;"/>
        </div>
    </div>
</asp:Content>