using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
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
            DataTable dt = Session["GioHang"] as DataTable;

            if (dt != null && dt.Rows.Count > 0)
            {
                gvGioHang.DataSource = dt;
                gvGioHang.DataBind();

                decimal tongCong = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["ThanhTien"]));
                lblTongCong.Text = $"Tổng cộng: {tongCong:N0}₫";

                lblMessage.Text = "";
                gvGioHang.Visible = true;
                btnThanhToan.Visible = true;
                lblTongCong.Visible = true;
            }
            else
            {
                lblMessage.Text = "🛒 Giỏ hàng của bạn đang trống.";
                gvGioHang.Visible = false;
                btnThanhToan.Visible = false;
                lblTongCong.Visible = false;
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            DataTable gioHang = Session["GioHang"] as DataTable;

            if (gioHang == null || gioHang.Rows.Count == 0)
            {
                lblMessage.Text = "⚠️ Giỏ hàng trống, không thể thanh toán.";
                return;
            }

            Response.Redirect("ThanhToan.aspx");
        }

        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                string maSP = e.CommandArgument.ToString();
                DataTable gioHang = Session["GioHang"] as DataTable;

                if (gioHang != null)
                {
                    DataRow row = gioHang.AsEnumerable()
                                         .FirstOrDefault(r => r["MaSP"].ToString() == maSP);

                    if (row != null)
                        gioHang.Rows.Remove(row);

                    Session["GioHang"] = gioHang;
                }

                LoadGioHangData();
            }
        }

        protected void txtSoLuong_TextChanged(object sender, EventArgs e)
        {
            TextBox txtSoLuong = sender as TextBox;
            GridViewRow row = (GridViewRow)txtSoLuong.NamingContainer;

            string maSP = gvGioHang.DataKeys[row.RowIndex].Value.ToString();
            DataTable gioHang = Session["GioHang"] as DataTable;

            if (gioHang != null)
            {
                DataRow spRow = gioHang.AsEnumerable()
                                       .FirstOrDefault(r => r["MaSP"].ToString() == maSP);

                if (spRow != null)
                {
                    int soLuongMoi;
                    if (int.TryParse(txtSoLuong.Text, out soLuongMoi) && soLuongMoi > 0)
                    {
                        decimal gia = Convert.ToDecimal(spRow["Gia"]);
                        spRow["SoLuong"] = soLuongMoi;
                        spRow["ThanhTien"] = soLuongMoi * gia;

                        Session["GioHang"] = gioHang;
                    }
                }

                LoadGioHangData();
            }
        }
    }
}
