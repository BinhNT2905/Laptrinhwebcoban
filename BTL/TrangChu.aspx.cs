using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class TrangChu : System.Web.UI.Page
    {
        // 🔹 Lấy danh sách sản phẩm từ Application (đã khởi tạo ở Global.asax)
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (SanPhamList != null)
                {
                    lvProducts.DataSource = SanPhamList;
                    lvProducts.DataBind();
                }
            }
        }

        // ⚙️ Xử lý khi người dùng bấm nút "Thêm vào giỏ"
        protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "ThemVaoGio")
            {
                string maSP = e.CommandArgument.ToString();

                // 🔹 Tìm sản phẩm trong danh sách
                int id = int.Parse(maSP);
                SanPham sp = SanPhamList.FirstOrDefault(p => p.MaSP == id);
                if (sp == null) return;

                // 🔹 Thêm vào giỏ hàng (Session)
                ThemVaoGio(sp);
            }
        }

        private void ThemVaoGio(SanPham sp)
        {
            // Kiểm tra giỏ hàng
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

            // Kiểm tra sản phẩm có sẵn chưa
            DataRow existingRow = null;
            foreach (DataRow row in gioHang.Rows)
            {
                if (row["MaSP"].ToString() == sp.MaSP.ToString())
                {
                    existingRow = row;
                    break;
                }
            }

            if (existingRow != null)
            {
                // 🔸 Cập nhật số lượng
                int currentQty = (int)existingRow["SoLuong"];
                existingRow["SoLuong"] = currentQty + 1;
                existingRow["ThanhTien"] = (decimal)existingRow["Gia"] * (int)existingRow["SoLuong"];
            }
            else
            {
                // 🔸 Thêm mới sản phẩm
                DataRow newRow = gioHang.NewRow();
                newRow["MaSP"] = sp.MaSP;
                newRow["TenSP"] = sp.TenSP;
                newRow["Gia"] = sp.Gia;
                newRow["SoLuong"] = 1;
                newRow["ThanhTien"] = sp.Gia;
                newRow["HinhAnh"] = sp.HinhAnh;
                gioHang.Rows.Add(newRow);
            }

            // 🔹 Cập nhật giỏ hàng vào Session
            Session["GioHang"] = gioHang;

            // 🔹 Hiển thị thông báo popup
            ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                "alert('✅ Sản phẩm đã được thêm vào giỏ hàng!');", true);
        }
    }
}
