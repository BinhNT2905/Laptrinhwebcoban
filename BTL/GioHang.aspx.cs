using System;
using System.Data;

namespace BTL // Namespace: BTL
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadGioHangData();
            }
        }

        private void LoadGioHangData()
        {
            // GIẢ LẬP DỮ LIỆU GIỎ HÀNG
            DataTable dt = new DataTable();
            dt.Columns.Add("MaSP", typeof(int));
            dt.Columns.Add("TenSP", typeof(string));
            dt.Columns.Add("Gia", typeof(decimal));
            dt.Columns.Add("SoLuong", typeof(int));
            dt.Columns.Add("ThanhTien", typeof(decimal));

            dt.Rows.Add(1, "Túi Đeo Vai Hobo Minimalist", 1200000, 1, 1200000);
            dt.Rows.Add(2, "Kính Mắt Tròn Margot", 1500000, 2, 3000000);

            if (dt.Rows.Count > 0)
            {
                gvGioHang.DataSource = dt;
                gvGioHang.DataBind();

                decimal tongCong = (decimal)dt.Compute("SUM(ThanhTien)", string.Empty);
                lblTongCong.Text = $"Tổng cộng: {tongCong:N0}₫";
            }
            else
            {
                lblMessage.Text = "Giỏ hàng của bạn đang trống.";
                gvGioHang.Visible = false;
                btnThanhToan.Visible = false;
                lblTongCong.Visible = false;
            }
        }

        // CHUYỂN HƯỚNG ĐẾN TRANG THANH TOÁN
        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            // Lý tưởng là kiểm tra giỏ hàng có hàng không, nhưng tạm thời chuyển hướng luôn.
            Response.Redirect("ThanhToan.aspx");
        }
    }
}