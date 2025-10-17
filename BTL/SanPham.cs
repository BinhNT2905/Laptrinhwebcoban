namespace BTL
{
    public class SanPham
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public decimal Gia { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; } // Tên file ảnh

        public SanPham(int maSP, string tenSP, decimal gia, string moTa, string hinhAnh)
        {
            MaSP = maSP;
            TenSP = tenSP;
            Gia = gia;
            MoTa = moTa;
            HinhAnh = hinhAnh;
        }
    }
}