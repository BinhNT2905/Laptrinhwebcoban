using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;


namespace BTL
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateHeaderLinks();
            }
        }

        private void UpdateHeaderLinks()
        {
            if (Session["CurrentUser"] != null)
            {
                User currentUser = Session["CurrentUser"] as User;

                // Hiển thị khi đã đăng nhập
                phDaDangNhap.Visible = true;
                phChuaDangNhap.Visible = false;
                lblUsername.Text = currentUser.Username;

                // Kiểm tra Role để hiển thị link Admin
                if (currentUser.Role == "admin")
                {
                    phChucNangAdmin.Visible = true;
                }
                else
                {
                    phChucNangAdmin.Visible = false;
                }
            }
            else
            {
                // Khi chưa đăng nhập
                phDaDangNhap.Visible = false;
                phChuaDangNhap.Visible = true;
                phChucNangAdmin.Visible = false;
            }
        }

        protected void lbtDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            // Chuyển hướng về trang Đăng nhập
            Response.Redirect("DangNhap.aspx");
        }
    }
}