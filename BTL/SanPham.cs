using System.Collections.Generic;

namespace BTL
{
    public class SanPham
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public decimal Gia { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; } // Ảnh chính
        public List<string> HinhAnhPhu { get; set; } // Nhiều ảnh phụ

        public SanPham(int maSP, string tenSP, decimal gia, string moTa, string hinhAnh, List<string> hinhAnhPhu = null)
        {
            MaSP = maSP;
            TenSP = tenSP;
            Gia = gia;
            MoTa = moTa;
            HinhAnh = hinhAnh;
            HinhAnhPhu = hinhAnhPhu ?? new List<string>();
        }
    }
}
