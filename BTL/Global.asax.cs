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
                new User("admin", "123", "0336281153", "admin"),
                new User("user", "123","0321835281",  "user"),
                
            };

            Application["UserList"] = userList;

            List<SanPham> sanPhamList = new List<SanPham>
    {
        new SanPham(1, "Túi Đeo Vai Hobo Minimalist", 1200000, "Túi da tổng hợp, kiểu dáng tối giản.", "pictures/sp_hobo.jpg"),
        new SanPham(2, "Túi đeo vai hobo phối xích", 1115000, "Túi đeo vai hobo phối xích - SHO 0298 - Màu đen", "pictures/sp_kinh.jpg"),
        new SanPham(3, "Túi Khóa Kéo Cá Tính", 1305000, "Thiết kế năng động, nhiều ngăn tiện lợi.", "pictures/sp1.jpg"),
        new SanPham(4, "Giày bit mũi block heel phối khóa trang trí", 865000, "Giày bít mũi block heel phối khóa trang trí - BMN 0740 - Màu kem.", "pictures/sp7.jpg"),
        new SanPham(5, "Túi xách nắp gập cách điệu phối khóa gài", 1495000,"Túi xách nắp gập cách điệu phối khóa gài - SAT 0346 - Màu đen", "pictures/sp9.jpg" ),
        new SanPham(6, "Balo nắp gập nhấn nổi viền", 1255000, "Balo nắp gập nhấn nổi viền - BAC 0232 - Màu đen", "pictures/sp11.jpg"),
        new SanPham(7, "Túi đeo chéo nắp gập may chần", 1025000, "Túi đeo chéo nắp gập may chần - SHO 0305 - Màu kem", "pictures/sp12.jpg"),
        new SanPham(8, "Túi xách nắp gập cách điệu phối khóa gài", 1255000, "Túi xách nắp gập cách điệu phối khóa gài - SAT 0346 - Màu be", "pictures/sp13.jpg"),
        new SanPham(9, "Túi xách monotone nhấn chân quai", 1495000, "Balo nắp gập nhấn nổi viền - BAC 0232 - Màu đen", "pictures/sp14_1.jpg",new List<string> { "pictures/sp14_1.jpg", "pictures/sp14_2.jpg", "pictures/sp14_3.jpg" }),
        new SanPham(10, "Túi đeo vai hobo phối xích", 1115000, "Túi đeo vai hobo phối xích - SHO 0298 - Màu xanh lá", "pictures/sp15_1.jpg", new List<string> { "pictures/sp15_1.jpg", "pictures/sp15_2.jpg", "pictures/sp15_3.jpg" } ),
        new SanPham(11, "Balo mini dáng tròn", 1075000, "Balo mini dáng tròn - BAC 0229 - Màu đen", "pictures/sp16_1.jpg",new List<string> { "pictures/sp16_1.jpg", "pictures/sp16_2.jpg", "pictures/sp16_3.jpg" }),
        new SanPham(12, "Charm dây ngọc trai nhấn nơ hoa", 125000, "Charm dây ngọc trai nhấn nơ hoa - CHM 0046 - Màu trắng đen", "pictures/sp5.jpg",new List<string> { "pictures/sp5_1.jpg", "pictures/sp5_2.jpg" }),
        new SanPham(13, "Túi xách tay nhấn nắp nổi viền", 1245000, "Túi xách tay nhấn nắp nổi viền - SAT 0345 - Màu nâu", "pictures/sp17.jpg",new List<string> { "pictures/sp17_1.jpg", "pictures/sp17_2.jpg", "pictures/sp17_3.jpg" }),
        new SanPham(14, "Túi đeo vai casual tối giản ", 1195000, "Túi đeo vai casual tối giản - TOT 0208 - Màu be", "pictures/sp18.jpg",new List<string> { "pictures/sp18_1.jpg", "pictures/sp18_2.jpg", "pictures/sp18_3.jpg" }),
        new SanPham(15, "Túi tote vải dù đa ngăn  ", 637500, "Túi tote vải dù đa ngăn - TOT 0158 - Màu đen", "pictures/sp19.jpg",new List<string> { "pictures/sp19_1.jpg", "pictures/sp19_2.jpg", "pictures/sp19_3.jpg" }),
        new SanPham(16, "Túi đeo vai y2k nhấn quai bản cá tính ", 497500, "Túi đeo vai y2k nhấn quai bản cá tính - SHO 0253 - Màu denim", "pictures/sp20.jpg",new List<string> { "pictures/sp20_1.jpg", "pictures/sp20_2.jpg", "pictures/sp20_3.jpg" }),
        new SanPham(17, "Túi đeo vai nhấn khóa thanh lịch ", 1195000, "Túi đeo vai nhấn khóa thanh lịch - SHO 0302 - Màu be", "pictures/sp21.jpg",new List<string> { "pictures/sp21_1.jpg", "pictures/sp21_2.jpg", "pictures/sp21_3.jpg" }),
        new SanPham(18, "Nón lưỡi trai năng động màu trơn  ", 285000, "Nón lưỡi trai năng động màu trơn - WOC 0003 - Màu tím", "pictures/sp22.jpg",new List<string> { "pictures/sp22_1.jpg", "pictures/sp22_2.jpg", "pictures/sp22_3.jpg" }),


    };

            Application["SanPhamList"] = sanPhamList;
        }
    }
}