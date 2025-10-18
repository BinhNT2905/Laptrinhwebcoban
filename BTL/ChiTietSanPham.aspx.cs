using System;
using System.Data;

namespace BTL
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy mã sản phẩm từ URL
                string maSP = Request.QueryString["MaSP"];
                if (string.IsNullOrEmpty(maSP))
                {
                    lblMessage.Text = "Không tìm thấy sản phẩm!";
                    productDetail.Visible = false;
                    return;
                }

                // Ở đây bạn có thể truy vấn DB hoặc lấy từ Application["ProductList"]
                // Ví dụ tạm thời (giả lập):
                lblMaSP.Text = maSP;
                lblTenSP.Text = "Túi Đeo Vai Hobo Minimalist";
                lblGia.Text = "1,200,000 ₫";
                lblMoTa.Text = "Chiếc túi thời trang cao cấp với phong cách tối giản.";
                imgHinhAnh.ImageUrl = ResolveUrl("~/pictures/sp_hobo.jpg");
                productDetail.Visible = true;
            }
        }

        protected void btnThemVaoGio_Click(object sender, EventArgs e)
        {
            // Kiểm tra đăng nhập
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            // Lấy thông tin sản phẩm từ giao diện
            string maSP = lblMaSP.Text;
            string tenSP = lblTenSP.Text;
            decimal gia = decimal.Parse(lblGia.Text.Replace("₫", "").Replace(",", "").Trim());
            int soLuong = int.Parse(txtSoLuong.Text);

            // Tạo DataTable nếu giỏ hàng chưa tồn tại
            DataTable gioHang;
            if (Session["GioHang"] == null)
            {
                gioHang = new DataTable();
                gioHang.Columns.Add("MaSP", typeof(string));
                gioHang.Columns.Add("TenSP", typeof(string));
                gioHang.Columns.Add("Gia", typeof(decimal));
                gioHang.Columns.Add("SoLuong", typeof(int));
                gioHang.Columns.Add("ThanhTien", typeof(decimal));
            }
            else
            {
                gioHang = (DataTable)Session["GioHang"];
            }

            // Kiểm tra sản phẩm đã có trong giỏ chưa
            DataRow existingRow = null;
            foreach (DataRow row in gioHang.Rows)
            {
                if (row["MaSP"].ToString() == maSP)
                {
                    existingRow = row;
                    break;
                }
            }

            if (existingRow != null)
            {
                // Nếu đã có → tăng số lượng
                int currentQty = (int)existingRow["SoLuong"];
                existingRow["SoLuong"] = currentQty + soLuong;
                existingRow["ThanhTien"] = (decimal)existingRow["Gia"] * (int)existingRow["SoLuong"];
            }
            else
            {
                // Nếu chưa có → thêm mới
                DataRow newRow = gioHang.NewRow();
                newRow["MaSP"] = maSP;
                newRow["TenSP"] = tenSP;
                newRow["Gia"] = gia;
                newRow["SoLuong"] = soLuong;
                newRow["ThanhTien"] = gia * soLuong;
                gioHang.Rows.Add(newRow);
            }

            // Lưu lại vào Session
            Session["GioHang"] = gioHang;

            // Hiển thị thông báo
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "✅ Sản phẩm đã được thêm vào giỏ hàng!";

            // (Tùy chọn) Chuyển hướng sang giỏ hàng:
            // Response.Redirect("GioHang.aspx");
        }
    }
}
