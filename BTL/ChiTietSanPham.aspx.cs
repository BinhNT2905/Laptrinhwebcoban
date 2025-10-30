using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string maSP = Request.QueryString["MaSP"];
                if (string.IsNullOrEmpty(maSP))
                {
                    lblMessage.Text = "❌ Không tìm thấy sản phẩm!";
                    productDetail.Visible = false;
                    return;
                }

                LayThongTinSanPham(maSP);
            }
        }

        private void LayThongTinSanPham(string maSP)
        {
            var dsSanPham = Application["SanPhamList"] as List<SanPham>;
            if (dsSanPham == null)
            {
                lblMessage.Text = "⚠️ Không có dữ liệu sản phẩm!";
                productDetail.Visible = false;
                return;
            }

            SanPham sp = dsSanPham.Find(s => s.MaSP.ToString() == maSP);
            if (sp == null)
            {
                lblMessage.Text = "⚠️ Không tìm thấy sản phẩm!";
                productDetail.Visible = false;
                return;
            }

            lblMaSP.Text = sp.MaSP.ToString();
            lblTenSP.Text = sp.TenSP;
            lblGia.Text = string.Format("{0:N0} ₫", sp.Gia);
            lblMoTa.Text = sp.MoTa;
            mainImage.Src = ResolveUrl("~/" + sp.HinhAnh);

            if (sp.HinhAnhPhu != null && sp.HinhAnhPhu.Count > 0)
            {
                string html = "";
                foreach (string anh in sp.HinhAnhPhu)
                {
                    string url = ResolveUrl("~/" + anh);
                    html += $"<img src='{url}' onclick='changeMainImage(this.src, this)' alt='Ảnh phụ' />";
                }
                thumbnailList.InnerHtml = html;
            }

            productDetail.Visible = true;
        }

        protected void btnThemVaoGio_Click(object sender, EventArgs e) => ThemVaoGioHang(false);

        protected void btnMuaNgay_Click(object sender, EventArgs e) => ThemVaoGioHang(true);

        private void ThemVaoGioHang(bool diDenGioHang)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            string maSP = lblMaSP.Text;
            string tenSP = lblTenSP.Text;

            decimal gia;
            string giaStr = lblGia.Text.Replace("₫", "").Replace(",", "").Trim();
            decimal.TryParse(giaStr, out gia);

            int soLuong;
            int.TryParse(txtSoLuong.Text, out soLuong);
            if (soLuong <= 0) soLuong = 1;

            string hinhAnh = mainImage.Src;

            DataTable gioHang;
            if (Session["GioHang"] == null)
            {
                gioHang = new DataTable();
                gioHang.Columns.Add("MaSP", typeof(string));
                gioHang.Columns.Add("TenSP", typeof(string));
                gioHang.Columns.Add("Gia", typeof(decimal));
                gioHang.Columns.Add("SoLuong", typeof(int));
                gioHang.Columns.Add("ThanhTien", typeof(decimal));
                gioHang.Columns.Add("HinhAnh", typeof(string));
            }
            else
            {
                gioHang = (DataTable)Session["GioHang"];
            }

            DataRow existingRow = null;
            foreach (DataRow row in gioHang.Rows)
                if (row["MaSP"].ToString() == maSP)
                    existingRow = row;

            if (existingRow != null)
            {
                existingRow["SoLuong"] = (int)existingRow["SoLuong"] + soLuong;
                existingRow["ThanhTien"] = (decimal)existingRow["Gia"] * (int)existingRow["SoLuong"];
            }
            else
            {
                DataRow newRow = gioHang.NewRow();
                newRow["MaSP"] = maSP;
                newRow["TenSP"] = tenSP;
                newRow["Gia"] = gia;
                newRow["SoLuong"] = soLuong;
                newRow["ThanhTien"] = gia * soLuong;
                newRow["HinhAnh"] = hinhAnh;
                gioHang.Rows.Add(newRow);
            }

            Session["GioHang"] = gioHang;

            if (diDenGioHang)
                Response.Redirect("GioHang.aspx");
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "✅ Sản phẩm đã được thêm vào giỏ hàng!";
            }
        }
    }
}
