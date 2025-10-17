using System;
using System.Web;


namespace BTL // Đã sửa từ BTL.LTW sang BTL
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Kiểm tra đăng nhập
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            User currentUser = Session["CurrentUser"] as User;

            // 2. Kiểm tra phân quyền Admin
            if (currentUser == null || currentUser.Role != "admin")
            {
                Response.Redirect("TrangChu.aspx"); // Không phải admin -> đá về trang chủ
                return;
            }

            // Hiển thị lời chào
            lblWelcomeAdmin.Text = "Xin chào, Quản trị viên <b>" + currentUser.Username + "</b>!";
        }
    }
}