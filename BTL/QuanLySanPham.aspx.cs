using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        private List<SanPham> SanPhamList => Application["SanPhamList"] as List<SanPham>;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null || (Session["CurrentUser"] as User)?.Role != "admin")
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            if (!IsPostBack)
                LoadSanPhamList();
        }

        private void LoadSanPhamList()
        {
            gvSanPham.DataSource = SanPhamList;
            gvSanPham.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtMaSP.Text, out int maSP) || !decimal.TryParse(txtGia.Text, out decimal gia))
            {
                lblMessage.Text = "⚠️ Mã SP & Giá phải là số!";
                return;
            }

            if (SanPhamList.Any(sph => sph.MaSP == maSP))
            {
                lblMessage.Text = "⚠️ Mã sản phẩm đã tồn tại!";
                return;
            }

            var sp = new SanPham(maSP, txtTenSP.Text.Trim(), gia, txtMoTa.Text.Trim(), txtHinhAnh.Text.Trim());

            Application.Lock();
            SanPhamList.Add(sp);
            Application.UnLock();

            lblMessage.Text = "✅ Thêm sản phẩm thành công!";
            txtMaSP.Text = txtTenSP.Text = txtGia.Text = txtMoTa.Text = txtHinhAnh.Text = "";
            LoadSanPhamList();
        }

        protected void gvSanPham_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSanPham.EditIndex = e.NewEditIndex;
            LoadSanPhamList();
            ScriptManager.RegisterStartupScript(this, GetType(), "scrollForm", "scrollToForm();", true);
        }

        protected void gvSanPham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSanPham.EditIndex = -1;
            LoadSanPhamList();
            ScriptManager.RegisterStartupScript(this, GetType(), "scrollForm", "scrollToForm();", true);
        }

        protected void gvSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvSanPham.Rows[e.RowIndex];
            int id = (int)gvSanPham.DataKeys[e.RowIndex].Value;

            string ten = (row.FindControl("txtEditTenSP") as TextBox).Text.Trim();
            string giaText = (row.FindControl("txtEditGia") as TextBox).Text.Trim();

            if (!decimal.TryParse(giaText, out decimal gia))
            {
                lblMessage.Text = "⚠️ Giá không hợp lệ!";
                return;
            }

            Application.Lock();
            var sp = SanPhamList.First(x => x.MaSP == id);
            sp.TenSP = ten;
            sp.Gia = gia;
            Application.UnLock();

            gvSanPham.EditIndex = -1;
            lblMessage.Text = "✅ Cập nhật thành công!";
            LoadSanPhamList();
        }

        protected void gvSanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvSanPham.DataKeys[e.RowIndex].Value;

            Application.Lock();
            SanPhamList.RemoveAll(x => x.MaSP == id);
            Application.UnLock();

            lblMessage.Text = "🗑️ Đã xóa sản phẩm!";
            LoadSanPhamList();
        }

        protected void gvSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            var img = e.Row.FindControl("imgThumb") as Image;
            string raw = DataBinder.Eval(e.Row.DataItem, "HinhAnh")?.ToString().Trim() ?? "";

            if (string.IsNullOrEmpty(raw))
            {
                img.ImageUrl = ResolveUrl("~/pictures/default.png");
                return;
            }

            if (raw.StartsWith("http"))
            {
                img.ImageUrl = raw;
                return;
            }

            img.ImageUrl = ResolveUrl("~/" + raw.TrimStart('/'));
        }
    }
}
