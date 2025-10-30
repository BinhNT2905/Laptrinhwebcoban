<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="GioHang.aspx.cs" Inherits="BTL.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Giỏ hàng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cart-container {
            padding: 40px;
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
        }

        h1 {
            color: #d62b70;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 700;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            font-family: "Segoe UI", sans-serif;
            font-size: 15px;
        }

        .grid-view th {
            background-color: #f5f5f5;
            text-align: center;
            padding: 12px;
            color: #222;
            font-weight: 600;
            border-bottom: 2px solid #ddd;
        }

        .grid-view td {
            padding: 14px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        .grid-view tr:hover {
            background-color: #fafafa;
        }

        .grid-view img {
            width: 65px;
            height: 65px;
            object-fit: cover;
            border-radius: 8px;
        }

        .price, .subtotal {
            text-align: right;
            width: 130px;
            font-weight: 500;
        }

        .quantity {
            text-align: center;
            width: 90px;
        }

        .quantity input {
            width: 55px;
            text-align: center;
            padding: 4px 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .delete-link {
            color: #e60000;
            text-decoration: none;
            font-weight: 500;
        }

        .delete-link:hover {
            text-decoration: underline;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }

        .checkout-button {
            background: linear-gradient(90deg, #7209b7, #d0006f);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 24px;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .checkout-button:hover {
            opacity: 0.9;
        }
    </style>

    <div class="cart-container">
        <h1>Giỏ Hàng Của Bạn</h1>

        <asp:Label ID="lblMessage" runat="server" Font-Bold="true"
                   Style="display: block; margin: 15px 0; color: #333;"></asp:Label>

        <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="false"
            CssClass="grid-view" GridLines="None" CellPadding="10"
            OnRowCommand="gvGioHang_RowCommand"
            DataKeyNames="MaSP">

            <Columns>
                <%-- Cột ảnh --%>
                <asp:TemplateField HeaderText="Ảnh" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                    <ItemTemplate>
                        <asp:Image ID="imgSP" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' AlternateText="Ảnh sản phẩm" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Tên sản phẩm --%>
                <asp:BoundField HeaderText="Tên Sản phẩm" DataField="TenSP" ItemStyle-Width="320px" />

                <%-- Giá --%>
                <asp:BoundField HeaderText="Giá" DataField="Gia"
                    DataFormatString="{0:N0}₫"
                    ItemStyle-CssClass="price" />

                <%-- Số lượng --%>
                <asp:TemplateField HeaderText="Số lượng" ItemStyle-CssClass="quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSoLuong" runat="server" 
                                     Text='<%# Eval("SoLuong") %>'
                                     TextMode="Number" 
                                     min="1"
                                     AutoPostBack="true"
                                     OnTextChanged="txtSoLuong_TextChanged" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%-- Thành tiền --%>
                <asp:BoundField HeaderText="Thành tiền" DataField="ThanhTien"
                    DataFormatString="{0:N0}₫"
                    ItemStyle-CssClass="subtotal" />

                <%-- Xóa --%>
                <asp:TemplateField HeaderText="Xóa" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtXoa" runat="server" Text="Xóa"
                                        CssClass="delete-link"
                                        CommandName="Xoa"
                                        CommandArgument='<%# Eval("MaSP") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="total-section">
            <asp:Label ID="lblTongCong" runat="server" Text="Tổng cộng: 0₫"></asp:Label><br />
            <asp:Button ID="btnThanhToan" runat="server" Text="Tiến hành Thanh toán"
                        CssClass="checkout-button" OnClick="btnThanhToan_Click" />
        </div>
    </div>
</asp:Content>
