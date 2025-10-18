using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTL;

namespace BTL
{
    // Cần đảm bảo Class GioHangItem và SanPham được định nghĩa
    // (Tôi dùng lại định nghĩa GioHangItem từ TrangChu.aspx.cs)
    public class GioHangItem
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public decimal Gia { get; set; }
        public int SoLuong { get; set; }
        public decimal ThanhTien => Gia * SoLuong;

        public GioHangItem(int maSP, string tenSP, decimal gia, int soLuong)
        {
            MaSP = maSP;
            TenSP = tenSP;
            Gia = gia;
            SoLuong = soLuong;
        }
    }

    public partial class SanPhamMoi : System.Web.UI.Page
    {
        // Property truy cập danh sách sản phẩm và giỏ hàng
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

        private List<GioHangItem> GioHang
        {
            get
            {
                if (Session["GioHang"] == null)
                {
                    Session["GioHang"] = new List<GioHangItem>();
                }
                return (List<GioHangItem>)Session["GioHang"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra đăng nhập
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProductList();
            }
        }

        private void LoadProductList()
        {
            // Tải toàn bộ danh sách sản phẩm lên ListView
            if (SanPhamList != null)
            {
                // Có thể sắp xếp để mô phỏng "Sản phẩm mới" (ví dụ: theo MaSP giảm dần)
                var products = SanPhamList.OrderByDescending(sp => sp.MaSP).ToList();
                lvProducts.DataSource = products;
                lvProducts.DataBind();
            }
        }

        // Xử lý sự kiện khi click vào nút "Thêm vào giỏ" trong ListView
        protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int maSP))
                {
                    var sp = SanPhamList?.FirstOrDefault(s => s.MaSP == maSP);

                    if (sp != null)
                    {
                        var itemTrongGio = GioHang.FirstOrDefault(i => i.MaSP == maSP);

                        if (itemTrongGio != null)
                        {
                            itemTrongGio.SoLuong += 1;
                        }
                        else
                        {
                            GioHangItem newItem = new GioHangItem(sp.MaSP, sp.TenSP, sp.Gia, 1);
                            GioHang.Add(newItem);
                        }

                        // Hiển thị thông báo JavaScript
                        string message = $"Đã thêm {sp.TenSP} vào giỏ hàng!";
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
                    }
                }
            }
        }
    }
}