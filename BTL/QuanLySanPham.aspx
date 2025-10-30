<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs"
    Inherits="BTL.QuanLySanPham" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản Lý Sản Phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<div class="admin-page">
    <div class="admin-header">
        <h1>👜 Quản Lý Sản Phẩm</h1>
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </div>

    <!-- Form -->
    <div class="card" id="formSanPham">
        <h2 class="card-title">Thêm sản phẩm mới</h2>

        <div class="form-grid">
            <div>
                <label>Mã SP</label>
                <asp:TextBox ID="txtMaSP" runat="server" CssClass="input" TextMode="Number"/>
            </div>

            <div>
                <label>Tên SP</label>
                <asp:TextBox ID="txtTenSP" runat="server" CssClass="input"/>
            </div>

            <div>
                <label>Giá</label>
                <asp:TextBox ID="txtGia" runat="server" CssClass="input" TextMode="Number"/>
            </div>

            <div>
                <label>Ảnh (file hoặc url)</label>
                <asp:TextBox ID="txtHinhAnh" runat="server" CssClass="input" Placeholder="vd: pictures/sp1.jpg"/>
            </div>

            <div class="grid-full">
                <label>Mô tả</label>
                <asp:TextBox ID="txtMoTa" runat="server" CssClass="input textarea" TextMode="MultiLine"/>
            </div>
        </div>

        <asp:Button ID="btnThem" runat="server" Text="➕ Thêm sản phẩm" CssClass="btn-primary" OnClick="btnThem_Click"/>
    </div>

    <!-- Table -->
    <div class="card">
        <h2 class="card-title">Danh sách sản phẩm</h2>

        <asp:GridView ID="gvSanPham" runat="server" AutoGenerateColumns="false"
            CssClass="table" GridLines="None" CellPadding="10" DataKeyNames="MaSP"
            OnRowDeleting="gvSanPham_RowDeleting"
            OnRowEditing="gvSanPham_RowEditing"
            OnRowUpdating="gvSanPham_RowUpdating"
            OnRowCancelingEdit="gvSanPham_RowCancelingEdit"
            OnRowDataBound="gvSanPham_RowDataBound">

            <Columns>
                <asp:BoundField DataField="MaSP" HeaderText="Mã SP" ReadOnly="True" />

                <asp:TemplateField HeaderText="Ảnh" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:Image ID="imgThumb" runat="server"
                            ImageUrl='<%# Eval("HinhAnh") %>'
                            Width="55px" Height="55px" CssClass="table-img" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Tên sản phẩm">
                    <ItemTemplate><%# Eval("TenSP") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditTenSP" runat="server" CssClass="input" Text='<%# Bind("TenSP") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Giá" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate><%# string.Format("{0:N0}", Eval("Gia")) %> đ</ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditGia" runat="server" CssClass="input" Text='<%# Bind("Gia") %>' TextMode="Number" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Hành động">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text="✏️ Sửa" OnClientClick="scrollToForm();" />&nbsp;&nbsp;
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"
                            OnClientClick="return confirm('Bạn có chắc muốn xóa?');" Text="🗑️ Xóa" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="💾 Lưu" />&nbsp;&nbsp;
                        <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="❌ Hủy" />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <a href="Dashboard.aspx" class="link-back"><i class="fas fa-arrow-left"></i> Quay lại Dashboard</a>
    </div>
</div>
    <script>
    function scrollToForm() {
        document.getElementById("formSanPham").scrollIntoView({ behavior: "smooth" });
    }
    </script>

</asp:Content>
