using System;

namespace BTL // Namespace: BTL
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }
        }

        protected void btnHoanTat_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtHoTen.Text) || string.IsNullOrWhiteSpace(txtDienThoai.Text) || string.IsNullOrWhiteSpace(txtDiaChi.Text))
            {
                lblMessage.Text = "Vui lòng điền đầy đủ thông tin giao hàng.";
                return;
            }

            // Ghi nhận đơn hàng (Sẽ lưu DB sau)

            // Giả lập thành công
            Session["LastOrderSuccess"] = true; // Lưu cờ thành công
            Response.Redirect("ThanhToanThanhCong.aspx");
        }
    }
}