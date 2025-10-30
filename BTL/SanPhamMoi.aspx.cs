using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
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
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

        private List<GioHangItem> GioHang
        {
            get
            {
                if (Session["GioHang"] == null)
                    Session["GioHang"] = new List<GioHangItem>();
                return (List<GioHangItem>)Session["GioHang"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
                LoadProductList();
        }

        private void LoadProductList()
        {
            if (SanPhamList != null)
            {
                var products = SanPhamList.OrderByDescending(sp => sp.MaSP).ToList();
                lvProducts.DataSource = products;
                lvProducts.DataBind();
            }
        }

        protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int maSP))
                {
                    var sp = SanPhamList?.FirstOrDefault(s => s.MaSP == maSP);
                    if (sp != null)
                    {
                        var item = GioHang.FirstOrDefault(i => i.MaSP == maSP);
                        if (item != null)
                            item.SoLuong++;
                        else
                            GioHang.Add(new GioHangItem(sp.MaSP, sp.TenSP, sp.Gia, 1));

                        // Không alert — chỉ cập nhật dữ liệu
                        LoadProductList();
                    }
                }
            }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            pagerProducts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadProductList();
        }
    }
}
