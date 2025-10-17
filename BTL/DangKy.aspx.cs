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
            // 1. Lấy danh sách người dùng từ Application
            var users = (List<User>)Application["UserList"];
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass))
            {
                lblMsg.Text = "Tên đăng nhập và mật khẩu không được để trống!";
                return;
            }

            // 2. Kiểm tra tên người dùng đã tồn tại chưa (không phân biệt chữ hoa/thường)
            if (users.Any(u => u.Username.Equals(user, StringComparison.OrdinalIgnoreCase)))
            {
                lblMsg.Text = "Tên người dùng đã tồn tại!";
                return;
            }

            // 3. Đăng ký thành công: Tạo User mới và thêm vào danh sách
            User newUser = new User(user, pass, "user");
            users.Add(newUser);
            Application["UserList"] = users; // Cập nhật lại danh sách

            // 4. Thông báo và chuyển hướng (hoặc gợi ý đăng nhập)
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Đăng ký thành công! Hãy đăng nhập.";

            // Xóa nội dung cũ
            txtUser.Text = "";
            txtPass.Text = "";
        }
    }
}