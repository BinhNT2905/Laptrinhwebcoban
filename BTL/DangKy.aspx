<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BTL.DangKy" UnobtrusiveValidationMode="None" %>

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

            <!-- Thông báo lỗi hoặc thành công -->
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            <br /><br />

            <!-- Ô nhập tên đăng nhập -->
            <label for="txtUser">Tên đăng nhập:</label>
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
                ErrorMessage="Tên đăng nhập không được để trống." 
                ForeColor="Red" 
                Display="Dynamic" />
            <br /><br />

            <!-- Ô nhập mật khẩu -->
            <label for="txtPass">Mật khẩu:</label>
            <asp:TextBox 
                ID="txtPass" 
                runat="server" 
                TextMode="Password" 
                CssClass="auth-textbox" 
                Placeholder="Mật khẩu ít nhất 6 ký tự">
            </asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvPass" 
                runat="server" 
                ControlToValidate="txtPass" 
                ErrorMessage="Vui lòng nhập mật khẩu." 
                ForeColor="Red" 
                Display="Dynamic" />
            <asp:RegularExpressionValidator 
                ID="revPass" 
                runat="server" 
                ControlToValidate="txtPass" 
                ValidationExpression="^.{6,}$" 
                ErrorMessage="Mật khẩu phải có ít nhất 6 ký tự." 
                ForeColor="Red" 
                Display="Dynamic" />
            <br /><br />

            <!-- Nút đăng ký -->
            <asp:Button 
                ID="btnRegister" 
                runat="server" 
                Text="Đăng ký" 
                OnClick="btnRegister_Click" 
                CssClass="auth-button" />
            <br /><br />

            <!-- Liên kết đăng nhập -->
            <asp:HyperLink 
                ID="lnkLogin" 
                runat="server" 
                NavigateUrl="DangNhap.aspx" 
                CssClass="auth-link">
                Đã có tài khoản? Đăng nhập
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>
