using System;
using System.Collections.Generic;
using BTL;
using System.Linq;

namespace BTL // Đã sửa từ BTL.LTW sang BTL
{
    public partial class TrangChu : System.Web.UI.Page
    {
        // Khai báo List Sản phẩm
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
                // Tải danh sách sản phẩm lên ListView
                if (SanPhamList != null)
                {
                    lvProducts.DataSource = SanPhamList;
                    lvProducts.DataBind();
                }
            }
        }
    }
}