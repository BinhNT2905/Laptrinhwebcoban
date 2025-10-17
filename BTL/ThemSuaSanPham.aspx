<%@ Page Title="Thêm / Sửa Sản phẩm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThemSuaSanPham.aspx.cs" Inherits="BTL.ThemSuaSanPham" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Thêm/Sửa Sản phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container" style="max-width: 600px; margin-top: 40px;">
        <h1 class="dashboard-title">
            <asp:Label ID="lblTieuDe" runat="server" Text="Thêm Sản Phẩm Mới"></asp:Label>
        </h1>
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Style="display: block; margin-bottom: 15px;"></asp:Label>

        <div class="form-group">
            <label>Mã Sản phẩm (Tự động)</label>
            <asp:TextBox ID="txtMaSP" runat="server" ReadOnly="True" CssClass="form-control" Style="background-color: #eee;"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Tên Sản phẩm <span style="color: red;">*</span></label>
            <asp:TextBox ID="txtTenSP" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Giá (VNĐ) <span style="color: red;">*</span></label>
            <asp:TextBox ID="txtGia" runat="server" TextMode="Number" CssClass="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Mô tả ngắn</label>
            <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Hình ảnh (Tên file, ví dụ: sp_moi.jpg) <span style="color: red;">*</span></label>
            <asp:TextBox ID="txtHinhAnh" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            <i style="font-size: 12px; color: #666;">*Lưu ý: Bạn phải tự upload file ảnh vào thư mục project</i>
        </div>

        <asp:Button ID="btnLuu" runat="server" Text="Lưu Sản phẩm" OnClick="btnLuu_Click" CssClass="auth-button" Style="margin-top: 20px;" />
        <asp:HyperLink ID="lnkQuayLai" runat="server" NavigateUrl="QuanLySanPham.aspx" CssClass="auth-button secondary-button" Style="margin-left: 10px;">Quay Lại</asp:HyperLink>
    </div>
</asp:Content>