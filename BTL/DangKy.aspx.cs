using System;
using System.Configuration;
using System.Data.SqlClient;

namespace BTL
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string user = txtUser.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string pass = txtPass.Text.Trim();

            string conn = ConfigurationManager.ConnectionStrings["ConnDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                connection.Open();

                // Check user exist
                string checkUser = "SELECT COUNT(*) FROM Users WHERE Username = @u";
                SqlCommand cmdCheck = new SqlCommand(checkUser, connection);
                cmdCheck.Parameters.AddWithValue("@u", user);

                int exists = (int)cmdCheck.ExecuteScalar();
                if (exists > 0)
                {
                    lblMsg.Text = "Tên đăng nhập đã tồn tại!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Insert user
                string sql = "INSERT INTO Users (Username, Password, Phone) VALUES (@u, @p, @ph)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@u", user);
                cmd.Parameters.AddWithValue("@p", pass);
                cmd.Parameters.AddWithValue("@ph", phone);
                cmd.ExecuteNonQuery();

                lblMsg.Text = "Đăng ký thành công!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}
