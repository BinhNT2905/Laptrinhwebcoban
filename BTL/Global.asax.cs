using System;
using System.Collections.Generic;
using System.Web;

namespace BTL
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            List<User> userList = new List<User>
            {
                new User("admin", "123", "admin"),
                new User("user", "123", "user"),
                
            };

            Application["UserList"] = userList;

            List<SanPham> sanPhamList = new List<SanPham>
    {
        new SanPham(1, "Túi Đeo Vai Hobo Minimalist", 1200000, "Túi da tổng hợp, kiểu dáng tối giản.", "pictures/sp_hobo.jpg"),
        new SanPham(2, "Kính Mắt Tròn Margot", 1500000, "Kính râm thời trang, chống tia UV.", "pictures/sp6.jpg"),
        new SanPham(3, "Túi Khóa Kéo Cá Tính", 1305000, "Thiết kế năng động, nhiều ngăn tiện lợi.", "pictures/sp1.jpg"),
        new SanPham(4, "Giày bit mũi block heel phối khóa trang trí", 865000, "Giày bít mũi block heel phối khóa trang trí - BMN 0740 - Màu kem.", "pictures/sp7.jpg"),

    };

            Application["SanPhamList"] = sanPhamList;
        }
    }
}