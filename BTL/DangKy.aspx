<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BTL.DangKy" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Đăng ký - LuxeBag</title>
    <link rel="stylesheet" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-container">
            <h2 style="text-align:center;">Tạo tài khoản mới</h2>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label><br /><br />
            <asp:TextBox ID="txtUser" runat="server" Placeholder="Tên đăng nhập" CssClass="auth-textbox"></asp:TextBox><br /><br />
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Placeholder="Mật khẩu" CssClass="auth-textbox"></asp:TextBox><br /><br />
            <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" OnClick="btnRegister_Click" CssClass="auth-button" /><br /><br />
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="DangNhap.aspx" CssClass="auth-link">Đã có tài khoản? Đăng nhập</asp:HyperLink>
        </div>
    </form>
</body>
</html>