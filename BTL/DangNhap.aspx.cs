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
            var users = (List<User>)Application["UserList"];
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            // ✅ Check login từ danh sách user
            var found = users.FirstOrDefault(u => u.Username == user && u.Password == pass);

            if (found != null)
            {
                Session["CurrentUser"] = found;

                if (found.Role == "admin")
                    Response.Redirect("Dashboard.aspx");
                else
                    Response.Redirect("TrangChu.aspx");
            }
            else
            {
                lblMsg.Text = "Sai tài khoản hoặc mật khẩu!";
            }
        }

    }
}