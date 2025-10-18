using System;
using System.Collections.Generic;
using System.Linq;

namespace BTL
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Khi trang được tải lần đầu, đảm bảo Session cũ được xóa
                // Điều này giúp người dùng không thể vào trực tiếp trang chính sau khi logout
                if (Session["CurrentUser"] != null)
                {
                    Session["CurrentUser"] = null;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // 1. Lấy danh sách người dùng
            var users = (List<User>)Application["UserList"];
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            if (user == "admin" && pass == "123" )
            {
                Session["CurrentUser"] = new User
                {
                    Username = "admin",
                    Password = "123",
                    Role = "admin"
                };
                Response.Redirect("Dashboard.aspx");
                return;
            }
            else
            {
                // 2. Tìm người dùng khớp với username và password
                var found = users.FirstOrDefault(u => u.Username == user && u.Password == pass);

                if (found != null)
                {
                    // Đăng nhập thành công: Lưu User vào Session
                    Session["CurrentUser"] = found;

                    // 3. Phân quyền và chuyển hướng
                    if (found.Role == "admin")
                        Response.Redirect("Dashboard.aspx");
                    else
                        Response.Redirect("TrangChu.aspx");
                }
                else
                {
                    // Đăng nhập thất bại
                    lblMsg.Text = "Sai tài khoản hoặc mật khẩu!";
                }
            }
           
        }
    }
}