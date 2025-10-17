<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs"
    Inherits="BTL.QuanLySanPham" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản Lý Sản Phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 30px; max-width: 1000px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 20px;">Quản Lý Sản Phẩm</h1>
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true" Style="display: block; margin: 15px 0;"></asp:Label>

        <div style="border: 1px solid #ccc; padding: 20px; margin-bottom: 30px; border-radius: 8px;">
            <h2 style="font-size: 18px; color: #555; margin-bottom: 15px;">Thêm Sản phẩm mới</h2>
            
            <div class="form-group-inline">
                <label>Mã SP:</label>
                <asp:TextBox ID="txtMaSP" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="form-group-inline">
                <label>Tên SP:</label>
                <asp:TextBox ID="txtTenSP" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group-inline">
                <label>Giá:</label>
                <asp:TextBox ID="txtGia" runat="server" CssClass="form-control" TextMode="Number" />
            </div>
            <div class="form-group-inline">
                <label>Ảnh (Tên file):</label>
                <asp:TextBox ID="txtHinhAnh" runat="server" CssClass="form-control" Placeholder="vd: sp_moi.jpg" />
            </div>
            <div class="form-group">
                <label>Mô tả:</label>
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" />
            </div>
            
            <asp:Button ID="btnThem" runat="server" Text="Thêm Sản phẩm" OnClick="btnThem_Click" CssClass="auth-button" Style="width: 200px;"/>
        </div>
        
        <h2 style="font-size: 20px; color: #d62b70; margin-bottom: 15px;">Danh sách Sản phẩm</h2>

        <asp:GridView ID="gvSanPham" runat="server" AutoGenerateColumns="false" 
            CssClass="grid-view" GridLines="None" CellPadding="10" DataKeyNames="MaSP"
            OnRowDeleting="gvSanPham_RowDeleting"
            OnRowEditing="gvSanPham_RowEditing"
            OnRowUpdating="gvSanPham_RowUpdating"
            OnRowCancelingEdit="gvSanPham_RowCancelingEdit"
            Style="width: 100%; border-collapse: collapse;">
            
            <Columns>
                <asp:BoundField DataField="MaSP" HeaderText="Mã SP" ReadOnly="True" />
                <asp:TemplateField HeaderText="Ảnh" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <img src='<%# Eval("HinhAnh") %>' style='width: 50px; height: 50px; object-fit: cover;' alt="Ảnh SP"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên Sản phẩm">
                    <ItemTemplate><%# Eval("TenSP") %></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtEditTenSP" runat="server" Text='<%# Bind("TenSP") %>' /></EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giá">
                    <ItemTemplate><%# string.Format("{0:N0}", Eval("Gia")) %></ItemTemplate>
                    <EditItemTemplate><asp:TextBox ID="txtEditGia" runat="server" Text='<%# Bind("Gia") %>' TextMode="Number"/></EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" EditText="Sửa" UpdateText="Lưu" CancelText="Hủy" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Xóa" />
            </Columns>
            
            <HeaderStyle BackColor="#f3f3f3" Font-Bold="True" ForeColor="#333" />
            <RowStyle BackColor="#ffffff" BorderColor="#eee" />
        </asp:GridView>
        
        <p style="margin-top: 20px;"><a href="Dashboard.aspx" style="color: #555; text-decoration: none;"><i class="fas fa-chevron-left"></i> Quay lại Dashboard</a></p>

    </div>
</asp:Content>