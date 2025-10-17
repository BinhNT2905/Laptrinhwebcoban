using System;
using System.Collections.Generic;
using System.Linq;

namespace BTL // Namespace: BTL
{
    public partial class ThemSuaSanPham : System.Web.UI.Page
    {
        // Khai báo lại List (lấy từ Application State)
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Kiểm tra phân quyền Admin
            if (Session["CurrentUser"] == null || (Session["CurrentUser"] as User).Role != "admin")
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // 2. Kiểm tra chế độ SỬA (có MaSP trên QueryString)
                if (Request.QueryString["MaSP"] != null)
                {
                    LoadSanPhamDeSua();
                }
                else
                {
                    // Chế độ THÊM MỚI
                    lblTieuDe.Text = "Thêm Sản Phẩm Mới";
                    txtMaSP.Text = GetNextMaSP().ToString();
                }
            }
        }

        private void LoadSanPhamDeSua()
        {
            if (int.TryParse(Request.QueryString["MaSP"], out int maSP))
            {
                var sanPham = SanPhamList?.FirstOrDefault(sp => sp.MaSP == maSP);

                if (sanPham != null)
                {
                    // Hiển thị dữ liệu lên form
                    lblTieuDe.Text = $"Chỉnh Sửa Sản Phẩm (Mã: {maSP})";
                    txtMaSP.Text = sanPham.MaSP.ToString();
                    txtTenSP.Text = sanPham.TenSP;
                    txtGia.Text = sanPham.Gia.ToString();
                    txtMoTa.Text = sanPham.MoTa;
                    txtHinhAnh.Text = sanPham.HinhAnh;
                    btnLuu.Text = "Cập Nhật Sản phẩm";
                }
                else
                {
                    lblMessage.Text = "Không tìm thấy sản phẩm cần sửa.";
                    // Chuyển về chế độ Thêm mới nếu không tìm thấy
                    lblTieuDe.Text = "Thêm Sản Phẩm Mới";
                    txtMaSP.Text = GetNextMaSP().ToString();
                }
            }
        }

        private int GetNextMaSP()
        {
            // Hàm tìm MaSP lớn nhất hiện có để tạo MaSP mới
            if (SanPhamList == null || SanPhamList.Count == 0)
                return 1;

            return SanPhamList.Max(sp => sp.MaSP) + 1;
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string tenSP = txtTenSP.Text.Trim();
            string moTa = txtMoTa.Text.Trim();
            string hinhAnh = txtHinhAnh.Text.Trim();

            if (!decimal.TryParse(txtGia.Text, out decimal gia) || gia <= 0)
            {
                lblMessage.Text = "Giá sản phẩm không hợp lệ.";
                return;
            }

            if (int.TryParse(txtMaSP.Text, out int maSP))
            {
                if (SanPhamList == null) return; // Bảo vệ nếu list bị null

                // Kiểm tra xem là SỬA hay THÊM MỚI
                var sanPhamHienTai = SanPhamList.FirstOrDefault(sp => sp.MaSP == maSP);

                if (sanPhamHienTai != null)
                {
                    // CHẾ ĐỘ SỬA (Update)
                    sanPhamHienTai.TenSP = tenSP;
                    sanPhamHienTai.Gia = gia;
                    sanPhamHienTai.MoTa = moTa;
                    sanPhamHienTai.HinhAnh = hinhAnh;
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = $"Đã cập nhật sản phẩm mã {maSP} thành công!";
                }
                else
                {
                    // CHẾ ĐỘ THÊM MỚI (Create)
                    SanPham newSP = new SanPham(maSP, tenSP, gia, moTa, hinhAnh);
                    SanPhamList.Add(newSP);
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = $"Đã thêm sản phẩm mới mã {maSP} thành công!";

                    // Chuẩn bị cho lần thêm tiếp theo
                    txtMaSP.Text = GetNextMaSP().ToString();
                    txtTenSP.Text = "";
                    txtGia.Text = "";
                    txtMoTa.Text = "";
                    txtHinhAnh.Text = "";
                }

                // Cập nhật lại Application State sau khi thay đổi
                Application["SanPhamList"] = SanPhamList;
            }
        }
    }
}