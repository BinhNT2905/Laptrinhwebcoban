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
        // Cập nhật người dùng
        protected void gvUserList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvUserList.Rows[e.RowIndex];
            string usernameToUpdate = gvUserList.DataKeys[e.RowIndex].Value.ToString();

            string newPassword = (row.FindControl("txtEditPassword") as TextBox).Text.Trim();
            string newPhone = (row.FindControl("txtEditPhone") as TextBox).Text.Trim(); // ✅ lấy phone
            string newRole = (row.FindControl("ddlEditRole") as DropDownList).SelectedValue;

            if (string.IsNullOrEmpty(newPassword))
            {
                lblMessage.Text = "Mật khẩu không được để trống!";
                return;
            }

            // ✅ validate số điện thoại (10 số)
            if (string.IsNullOrEmpty(newPhone) || newPhone.Length != 10 || !newPhone.All(char.IsDigit))
            {
                lblMessage.Text = "Số điện thoại phải gồm 10 chữ số!";
                return;
            }

            Application.Lock();
            User userToUpdate = UserList.FirstOrDefault(u => u.Username == usernameToUpdate);
            if (userToUpdate != null)
            {
                userToUpdate.Password = newPassword;
                userToUpdate.Phone = newPhone;   // ✅ cập nhật phone
                userToUpdate.Role = newRole;

                // ✅ update luôn session nếu là user đang đăng nhập
                var current = Session["CurrentUser"] as User;
                if (current != null && current.Username == usernameToUpdate)
                {
                    current.Password = newPassword;
                    current.Phone = newPhone;
                    current.Role = newRole;
                    Session["CurrentUser"] = current;
                }

                lblMessage.Text = $"Đã cập nhật người dùng: {usernameToUpdate}";
            }
            Application.UnLock();

            gvUserList.EditIndex = -1;
            LoadUserList();
        }


    }
}