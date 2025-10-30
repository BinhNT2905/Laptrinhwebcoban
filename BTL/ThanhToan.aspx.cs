using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace BTL
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

            if (!IsPostBack)
            {
                LoadCartSummary();
            }
        }

        private void LoadCartSummary()
        {
            var dt = Session["GioHang"] as System.Data.DataTable;

            if (dt == null || dt.Rows.Count == 0)
            {
                Response.Redirect("GioHang.aspx");
                return;
            }

            int soSP = dt.AsEnumerable().Sum(row => Convert.ToInt32(row["SoLuong"]));
            decimal tamTinh = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["ThanhTien"]));
            decimal phiShip = 30000;
            decimal tong = tamTinh + phiShip;

            lblSoSanPham.Text = soSP.ToString();
            lblTamTinh.Text = tamTinh.ToString("#,##0") + "₫";
            lblTongCong.Text = tong.ToString("#,##0") + "₫";
}


        protected void btnHoanTat_Click(object sender, EventArgs e)
        {
            if (txtHoTen.Text.Trim() == "" || txtDiaChi.Text.Trim() == "" || txtDienThoai.Text.Trim() == "")
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin giao hàng!";
                return;
            }

            // Clear cart after order success
            Session["Cart"] = null;
            Response.Redirect("CamOn.aspx");
        }
    }
}
