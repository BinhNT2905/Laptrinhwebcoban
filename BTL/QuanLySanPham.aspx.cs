using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BTL // Namespace: BTL
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        // Property truy cập danh sách sản phẩm
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

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
                LoadSanPhamList();
            }
        }

        private void LoadSanPhamList()
        {
            if (SanPhamList != null)
            {
                gvSanPham.DataSource = SanPhamList;
                gvSanPham.DataBind();
                lblMessage.Text = $"Hiện có {SanPhamList.Count} sản phẩm.";
            }
            else
            {
                lblMessage.Text = "Hệ thống chưa có sản phẩm nào.";
            }
        }

        // --- XỬ LÝ THÊM SẢN PHẨM ---
        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtMaSP.Text, out int maSP) && decimal.TryParse(txtGia.Text, out decimal gia))
            {
                // Kiểm tra trùng Mã SP
                if (SanPhamList.Any(sp => sp.MaSP == maSP))
                {
                    lblMessage.Text = "Lỗi: Mã sản phẩm đã tồn tại!";
                    return;
                }

                // Tạo Sản phẩm mới
                SanPham newSP = new SanPham(
                    maSP,
                    txtTenSP.Text.Trim(),
                    gia,
                    txtMoTa.Text.Trim(),
                    txtHinhAnh.Text.Trim()
                );

                Application.Lock();
                SanPhamList.Add(newSP);
                Application.UnLock();

                lblMessage.ForeColor = System.Drawing.Color.Blue;
                lblMessage.Text = $"Đã thêm sản phẩm: {newSP.TenSP}";

                // Reset form
                txtMaSP.Text = string.Empty;
                txtTenSP.Text = string.Empty;
                txtGia.Text = string.Empty;
                txtMoTa.Text = string.Empty;
                txtHinhAnh.Text = string.Empty;

                LoadSanPhamList();
            }
            else
            {
                lblMessage.Text = "Lỗi: Mã SP và Giá phải là số hợp lệ!";
            }
        }

        // --- XỬ LÝ SỬA/XÓA TRÊN GRIDVIEW ---

        protected void gvSanPham_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSanPham.EditIndex = e.NewEditIndex;
            LoadSanPhamList();
        }

        protected void gvSanPham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSanPham.EditIndex = -1;
            LoadSanPhamList();
        }

        protected void gvSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvSanPham.Rows[e.RowIndex];
            int maSPToUpdate = (int)gvSanPham.DataKeys[e.RowIndex].Value;

            // Lấy giá trị mới
            string newTenSP = (row.FindControl("txtEditTenSP") as TextBox).Text.Trim();
            string newGiaText = (row.FindControl("txtEditGia") as TextBox).Text.Trim();

            if (string.IsNullOrEmpty(newTenSP) || !decimal.TryParse(newGiaText, out decimal newGia))
            {
                lblMessage.Text = "Lỗi: Tên SP không được trống và Giá phải là số hợp lệ.";
                return;
            }

            Application.Lock();
            SanPham spToUpdate = SanPhamList.FirstOrDefault(sp => sp.MaSP == maSPToUpdate);
            if (spToUpdate != null)
            {
                spToUpdate.TenSP = newTenSP;
                spToUpdate.Gia = newGia;
                // Có thể cập nhật thêm Mô tả và Hình Ảnh nếu cần
                lblMessage.Text = $"Đã cập nhật sản phẩm: {spToUpdate.TenSP}";
            }
            Application.UnLock();

            gvSanPham.EditIndex = -1;
            LoadSanPhamList();
        }

        protected void gvSanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int maSPToDelete = (int)gvSanPham.DataKeys[e.RowIndex].Value;

            Application.Lock();
            SanPham spToRemove = SanPhamList.FirstOrDefault(sp => sp.MaSP == maSPToDelete);
            if (spToRemove != null)
            {
                SanPhamList.Remove(spToRemove);
                lblMessage.Text = $"Đã xóa sản phẩm: {spToRemove.TenSP}";
            }
            Application.UnLock();

            gvSanPham.EditIndex = -1;
            LoadSanPhamList();
        }
    }
}