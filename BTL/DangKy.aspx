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

    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    <br /><br />

    <!-- Username -->
    <label>Tên đăng nhập:</label>
    <asp:TextBox ID="txtUser" runat="server" CssClass="auth-textbox" Placeholder="Tên đăng nhập"></asp:TextBox>
    <asp:RequiredFieldValidator ControlToValidate="txtUser" ErrorMessage="Không được để trống!" ForeColor="Red" Display="Dynamic" runat="server" />
    <br /><br />

    <!-- Phone -->
    <label>Số điện thoại:</label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="auth-textbox" Placeholder="Số điện thoại"></asp:TextBox>
    <asp:RequiredFieldValidator ControlToValidate="txtPhone" ErrorMessage="Hãy nhập số điện thoại!" ForeColor="Red" Display="Dynamic" runat="server" />
    <asp:RegularExpressionValidator ControlToValidate="txtPhone" runat="server"
        ValidationExpression="^(0[0-9]{9})$"
        ErrorMessage="Số điện thoại không hợp lệ (10 số, bắt đầu bằng 0)" ForeColor="Red" Display="Dynamic"/>
    <br /><br />

    <!-- Password -->
    <label>Mật khẩu:</label>
    <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="auth-textbox" Placeholder="VD:Abc123@"></asp:TextBox>
    <asp:RequiredFieldValidator ControlToValidate="txtPass" ErrorMessage="Nhập mật khẩu!" ForeColor="Red" Display="Dynamic" runat="server" />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPass"
        ErrorMessage="Mật khẩu phải ≥ 8 ký tự, gồm hoa, thường, số & ký tự đặc biệt!"
        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
        ForeColor="Red" Display="Dynamic" />
    <br /><br />

    <!-- Confirm Password -->
    <label>Nhập lại mật khẩu:</label>
    <asp:TextBox ID="txtRePass" TextMode="Password" runat="server" CssClass="auth-textbox" Placeholder="Nhập lại mật khẩu"></asp:TextBox>
    <asp:RequiredFieldValidator ControlToValidate="txtRePass" ErrorMessage="Hãy nhập lại mật khẩu!" ForeColor="Red" Display="Dynamic" runat="server" />
    <asp:CompareValidator ControlToValidate="txtRePass" ControlToCompare="txtPass"
        ErrorMessage="Mật khẩu không khớp!" ForeColor="Red" Display="Dynamic" runat="server" />
    <br /><br />

    <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="auth-button" OnClick="btnRegister_Click" />
    <br /><br />

    <asp:HyperLink NavigateUrl="DangNhap.aspx" Text="Đã có tài khoản? Đăng nhập" runat="server" CssClass="auth-link" />
</div>
</form>
</body>
</html>
