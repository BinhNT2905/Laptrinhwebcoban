<%@ Page Title="Sản phẩm mới" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="SanPhamMoi.aspx.cs" Inherits="BTL.SanPhamMoi" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sản phẩm mới
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="padding: 40px; max-width: 1200px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 30px; text-align: center;">TẤT CẢ SẢN PHẨM</h1>
        
        <div class="product-grid">
            
            <asp:ListView ID="lvProducts" runat="server" OnItemCommand="lvProducts_ItemCommand">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </LayoutTemplate>
                
                <ItemTemplate>
                    <div class="product-card">
                        <%-- Link đến trang chi tiết sản phẩm --%>
                        <a href='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>'>
                            <img src='<%# Eval("HinhAnh") %>' alt='<%# Eval("TenSP") %>' />
                        </a>
                        
                        <h3>
                            <asp:HyperLink ID="lnkTenSP" runat="server" 
                                NavigateUrl='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>' 
                                Text='<%# Eval("TenSP") %>' />
                        </h3>
                        
                        <%-- Hiển thị giá và format tiền tệ --%>
                        <p class="price"><%# string.Format("{0:N0}", Eval("Gia")) %>₫</p>
                        
                        <%-- Nút Thêm vào giỏ hàng --%>
                        <asp:LinkButton ID="btnThemVaoGio" runat="server" CssClass="btn-buy" 
                                CommandName="AddToCart" CommandArgument='<%# Eval("MaSP") %>' Text="Thêm vào giỏ" />
                    </div>
                </ItemTemplate>
                
                <EmptyDataTemplate>
                    <p style="text-align: center; grid-column: 1 / -1;">Hiện chưa có sản phẩm nào được bán.</p>
                </EmptyDataTemplate>
            </asp:ListView>
            
        </div>
    </div>
</asp:Content>