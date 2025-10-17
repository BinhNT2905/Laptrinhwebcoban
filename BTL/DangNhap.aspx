<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BTL.DangNhap" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Đăng nhập - LuxeBag</title>
    <link rel="stylesheet" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-container">
            <h2 style="text-align:center;">Đăng nhập hệ thống</h2>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label><br /><br />
            <asp:TextBox ID="txtUser" runat="server" Placeholder="Tên đăng nhập" CssClass="auth-textbox"></asp:TextBox><br /><br />
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Placeholder="Mật khẩu" CssClass="auth-textbox"></asp:TextBox><br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" CssClass="auth-button" /><br /><br />
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="DangKy.aspx" CssClass="auth-link">Chưa có tài khoản? Đăng ký</asp:HyperLink>
        </div>
    </form>
</body>
</html>