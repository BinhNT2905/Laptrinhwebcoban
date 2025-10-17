using System;

namespace BTL
{
    public partial class ThanhToanThanhCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null || Session["LastOrderSuccess"] == null)
            {
                Response.Redirect("TrangChu.aspx");
                return;
            }

            Session.Remove("LastOrderSuccess");
        }
    }
}