<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="TrangChu.aspx.cs" Inherits="BTL.TrangChu" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Trang chủ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section class="banner">
        <div class="slider">
            <div class="slide active">
                <img src="banner1.jpg" alt="Banner 1" />
            </div>
            
            <div class="slide">
                <img src="https://www.vascara.com/uploads/banner/2025/August/25/18281756119351.jpg" alt="Banner 3" />
            </div>
        </div>
    </section>

    <section class="featured">
        <h2>New Arrival</h2>
        <div class="product-grid">
            
            <asp:ListView ID="lvProducts" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="product-card">
                            <a href='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>'>
                                <img src='<%# Eval("HinhAnh") %>' alt='<%# Eval("TenSP") %>' />
                            </a>
                        
                        <h3>
                            <asp:HyperLink ID="lnkTenSP" runat="server" 
                                NavigateUrl='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>' 
                                Text='<%# Eval("TenSP") %>' />
                        </h3>
                        
                        <p class="price"><%# string.Format("{0:N0}", Eval("Gia")) %>₫</p>

                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <p style="text-align: center; grid-column: 1 / -1;">Hiện chưa có sản phẩm nào được bán.</p>
                </EmptyDataTemplate>
            </asp:ListView>
            
        </div>
    </section>
    
</asp:Content>