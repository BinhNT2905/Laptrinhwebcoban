<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="GioHang.aspx.cs" Inherits="BTL.GioHang" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Giỏ hàng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 40px; max-width: 1000px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 30px; text-align: center;">Giỏ Hàng Của Bạn</h1>
        
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Style="display: block; margin: 15px 0; color: #333;"></asp:Label>

        <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="false" 
            CssClass="grid-view" GridLines="None" CellPadding="10"
            Style="width: 100%; border-collapse: collapse;">
            
            <Columns>
                <asp:TemplateField HeaderText="Ảnh">
                    <ItemTemplate>
                        <img src='sp_hobo.jpg' style='width: 50px; height: 50px; object-fit: cover;' alt="Ảnh sản phẩm"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Tên Sản phẩm" DataField="TenSP" />
                <asp:BoundField HeaderText="Giá" DataField="Gia" DataFormatString="{0:N0}₫" ItemStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="Số lượng" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' TextMode="Number" Style="width: 50px; text-align: center;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Thành tiền" DataField="ThanhTien" DataFormatString="{0:N0}₫" ItemStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="Xóa">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtXoa" runat="server" Text="Xóa" ForeColor="Red" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <HeaderStyle BackColor="#f3f3f3" Font-Bold="True" ForeColor="#333" />
            <RowStyle BackColor="#ffffff" BorderColor="#eee" />
        </asp:GridView>

        <div style="text-align: right; margin-top: 20px;">
            <asp:Label ID="lblTongCong" runat="server" Font-Size="Large" Font-Bold="True" Text="Tổng cộng: 0₫"></asp:Label>
            <br />
            <asp:Button ID="btnThanhToan" runat="server" Text="Tiến hành Thanh toán" 
                CssClass="auth-button" Style="width: 250px; margin-top: 15px;" OnClick="btnThanhToan_Click" />
        </div>

    </div>
</asp:Content>