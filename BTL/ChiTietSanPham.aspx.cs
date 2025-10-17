using System;
using System.Collections.Generic;
using System.Linq;
using BTL;

namespace BTL // Namespace: BTL
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
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
                LoadProductDetail();
            }
        }

        private void LoadProductDetail()
        {
            if (Request.QueryString["MaSP"] != null && int.TryParse(Request.QueryString["MaSP"], out int maSP))
            {
                var sanPham = SanPhamList?.FirstOrDefault(sp => sp.MaSP == maSP);

                if (sanPham != null)
                {
                    lblTenSP.Text = sanPham.TenSP;
                    lblGia.Text = string.Format("{0:N0}₫", sanPham.Gia);
                    lblMaSP.Text = sanPham.MaSP.ToString();
                    lblMoTa.Text = sanPham.MoTa;
                    imgHinhAnh.ImageUrl = sanPham.HinhAnh;

                    productDetail.Visible = true;
                    lblMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "Không tìm thấy sản phẩm này.";
                    productDetail.Visible = false;
                }
            }
            else
            {
                lblMessage.Text = "Mã sản phẩm không hợp lệ.";
                productDetail.Visible = false;
            }
        }

        protected void btnThemVaoGio_Click(object sender, EventArgs e)
        {
            lblMessage.ForeColor = System.Drawing.Color.Blue;
            lblMessage.Text = "Chức năng thêm vào giỏ hàng đang được phát triển!";
        }
    }
}