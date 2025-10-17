using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BTL // Đã sửa từ BTL.LTW sang BTL
{
    public partial class QuanLyNguoiDung : System.Web.UI.Page
    {
        // Property truy cập danh sách người dùng
        private List<User> UserList => Application["UserList"] as List<User>;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra phân quyền Admin
            if (Session["CurrentUser"] == null || (Session["CurrentUser"] as User)?.Role != "admin")
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserList();
            }
        }

        private void LoadUserList()
        {
            if (UserList != null && UserList.Count > 0)
            {
                gvUserList.DataSource = UserList;
                gvUserList.DataBind();
                lblMessage.Text = $"Hiện có {UserList.Count} người dùng trong hệ thống.";
            }
            else
            {
                lblMessage.Text = "Hệ thống chưa có người dùng nào.";
            }
        }

        // --- XỬ LÝ SỰ KIỆN CRUD TRÊN GRIDVIEW ---

        // Xóa người dùng
        protected void gvUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string usernameToDelete = gvUserList.DataKeys[e.RowIndex].Value.ToString();

            // Cấm xóa admin chính đang đăng nhập
            if (usernameToDelete == (Session["CurrentUser"] as User).Username)
            {
                lblMessage.Text = "Không thể xóa tài khoản admin đang đăng nhập!";
                return;
            }

            Application.Lock();
            User userToRemove = UserList.FirstOrDefault(u => u.Username == usernameToDelete);
            if (userToRemove != null)
            {
                UserList.Remove(userToRemove);
                lblMessage.Text = $"Đã xóa người dùng: {usernameToDelete}";
            }
            Application.UnLock();

            gvUserList.EditIndex = -1; // Đảm bảo thoát khỏi chế độ chỉnh sửa
            LoadUserList();
        }

        // Bật chế độ chỉnh sửa
        protected void gvUserList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUserList.EditIndex = e.NewEditIndex;
            LoadUserList();
        }

        // Hủy chỉnh sửa
        protected void gvUserList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUserList.EditIndex = -1;
            LoadUserList();
        }

        // Cập nhật người dùng
        protected void gvUserList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvUserList.Rows[e.RowIndex];
            string usernameToUpdate = gvUserList.DataKeys[e.RowIndex].Value.ToString();

            // Lấy giá trị mới từ các controls trong EditItemTemplate
            string newPassword = (row.FindControl("txtEditPassword") as TextBox).Text.Trim();
            string newRole = (row.FindControl("ddlEditRole") as DropDownList).SelectedValue;

            if (string.IsNullOrEmpty(newPassword))
            {
                lblMessage.Text = "Mật khẩu không được để trống!";
                return;
            }

            Application.Lock();
            User userToUpdate = UserList.FirstOrDefault(u => u.Username == usernameToUpdate);
            if (userToUpdate != null)
            {
                userToUpdate.Password = newPassword;
                userToUpdate.Role = newRole;
                lblMessage.Text = $"Đã cập nhật người dùng: {usernameToUpdate}";
            }
            Application.UnLock();

            gvUserList.EditIndex = -1;
            LoadUserList();
        }
    }
}