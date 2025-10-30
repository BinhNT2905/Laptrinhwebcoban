<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BTL.DangNhap" UnobtrusiveValidationMode="None" %>

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
            <h2 style="text-align:center;">Đăng nhập</h2>

            <!-- Thông báo lỗi hoặc thông tin -->
            <asp:Label 
                ID="lblMsg" 
                runat="server" 
                ForeColor="Red">
            </asp:Label>
            <br /><br />

            <!-- Ô nhập tên đăng nhập -->
            <label for="txtUser"><b>Tên đăng nhập:</b></label>
            <asp:TextBox 
                ID="txtUser" 
                runat="server" 
                CssClass="auth-textbox" 
                Placeholder="Nhập tên đăng nhập">
            </asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvUser" 
                runat="server" 
                ControlToValidate="txtUser" 
                ErrorMessage="Vui lòng nhập tên đăng nhập." 
                ForeColor="Red" 
                Display="Dynamic" />
            <br /><br />

            <!-- Ô nhập mật khẩu -->
            <label for="txtPass"><b>Mật khẩu:</b></label>
            <asp:TextBox 
                ID="txtPass" 
                runat="server" 
                TextMode="Password" 
                CssClass="auth-textbox" 
                Placeholder="Nhập mật khẩu">
            </asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvPass" 
                runat="server" 
                ControlToValidate="txtPass" 
                ErrorMessage="Vui lòng nhập mật khẩu." 
                ForeColor="Red" 
                Display="Dynamic" />
            <br /><br />

            <!-- Nút đăng nhập -->
            <asp:Button 
                ID="btnLogin" 
                runat="server" 
                Text="Đăng nhập" 
                OnClick="btnLogin_Click" 
                CssClass="auth-button" />
            <br /><br />

            <!-- Liên kết sang trang đăng ký -->
            <asp:HyperLink 
                ID="lnkRegister" 
                runat="server" 
                NavigateUrl="DangKy.aspx" 
                CssClass="auth-link">
                Chưa có tài khoản? Đăng ký
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>
