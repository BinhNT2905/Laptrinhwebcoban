using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace BTL
{ 
    public partial class DangKy : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
          
            var users = (List<User>)Application["UserList"];
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass))
            {
                lblMsg.Text = "Tên đăng nhập và mật khẩu không được để trống!";
                return;
            }

            if (users.Any(u => u.Username.Equals(user, StringComparison.OrdinalIgnoreCase)))
            {
                lblMsg.Text = "Tên người dùng đã tồn tại!";
                return;
            }
            User newUser = new User(user, pass, "user");
            users.Add(newUser);
            Application["UserList"] = users;
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Đăng ký thành công! Hãy đăng nhập.";
            txtUser.Text = "";
            txtPass.Text = "";
        }
    }
}