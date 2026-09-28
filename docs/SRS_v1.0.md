# Đặc tả Yêu cầu Phần mềm (SRS) v1.0

**Dự án:** Hệ thống kiểm soát chế độ ăn cho người quan tâm tới sức khỏe
**Phiên bản:** 1.0
**Ngày:** 28/09/2026
**Chuẩn:** IEEE 830 / ISO/IEC/IEEE 29148

---

## 1. Yêu cầu chức năng (FR)

### Nhóm A — Quản lý tài khoản và hồ sơ sức khỏe

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-01 | Đăng ký tài khoản bằng email/SĐT với xác thực OTP | Must-have |
| FR-02 | Tạo/cập nhật hồ sơ sức khỏe cá nhân (tuổi, giới tính, chiều cao, cân nặng, bệnh lý nền, dị ứng) | Must-have |
| FR-03 | Thiết lập mục tiêu dinh dưỡng hàng ngày (calo, macro, vi chất) | Must-have |

### Nhóm B — Tra cứu và quản lý thực phẩm

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-04 | CSDL thực phẩm Việt Nam 500 món với thông tin dinh dưỡng chi tiết | Must-have |
| FR-05 | Tìm kiếm theo tên, nhóm, quét mã vạch | Must-have |
| FR-06 | Thêm thực phẩm mới vào CSDL cá nhân | Should-have |
| FR-07 | Hiển thị thông tin dinh dưỡng trực quan (biểu đồ, màu cảnh báo) | Should-have |

### Nhóm C — Ghi chép và theo dõi bữa ăn

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-08 | Ghi chép bữa ăn với khối lượng ước lượng hoặc chính xác | Must-have |
| FR-09 | Tự động tính tổng calo, macro, vi chất trong ngày | Must-have |
| FR-10 | Hiển thị tiến độ so với mục tiêu (thanh tiến độ, biểu đồ) | Must-have |
| FR-11 | Cảnh báo khi vượt ngưỡng cho phép (ví dụ: carbs > 80% mục tiêu) | Must-have |
| FR-12 | Xem lịch sử bữa ăn theo ngày/tuần/tháng | Must-have |

### Nhóm D — Phân tích và báo cáo

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-13 | Biểu đồ xu hướng dinh dưỡng theo tuần/tháng | Should-have |
| FR-14 | Xuất báo cáo PDF tổng hợp | Should-have |
| FR-15 | Chia sẻ báo cáo qua email hoặc mã QR | Could-have |

### Nhóm E — Nhắc nhở và tương tác

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-16 | Gửi thông báo nhắc nhở ghi chép bữa ăn | Should-have |
| FR-17 | Cảnh báo khi chưa ghi chép trong 4 giờ | Should-have |
| FR-18 | Xác nhận bỏ qua bữa ăn bằng 1 thao tác | Must-have |

### Nhóm F — Quản lý ủy quyền và ghi vết

| Mã | Mô tả | Ưu tiên |
|----|-------|---------|
| FR-19 | Ủy quyền cho người nhà nhập liệu hộ | Should-have |
| FR-20 | Ghi nhận rõ ai thực hiện thao tác | Should-have |
| FR-21 | Ghi log mọi thao tác [Timestamp, User, Action, Status] | Must-have |

---

## 2. Yêu cầu phi chức năng (NFR) theo ISO 25010

| Mã | Thuộc tính ISO 25010 | Chỉ số định lượng |
|----|----------------------|-------------------|
| NFR-01 | Performance Efficiency | API tra cứu thực phẩm ≤ 200ms (P95) |
| NFR-02 | Performance Efficiency | Tải trang chủ ≤ 2s trên 4G |
| NFR-03 | Performance Efficiency | Chịu tải 10.000 users đồng thời, lỗi ≤ 1% |
| NFR-04 | Reliability | Độ sẵn sàng ≥ 99.9% (8.76h downtime/năm) |
| NFR-05 | Reliability | Khôi phục dữ liệu ≤ 4 giờ |
| NFR-06 | Reliability | Tỷ lệ lỗi 5xx ≤ 0.1% |
| NFR-07 | Security | Mật khẩu bcrypt cost ≥ 12 hoặc Argon2id |
| NFR-08 | Security | HTTPS/TLS 1.3, không hỗ trợ TLS 1.0/1.1 |
| NFR-09 | Security | Tuân thủ NĐ 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân |
| NFR-10 | Security | Mã hóa dữ liệu sức khỏe AES-256 at-rest |
| NFR-11 | Usability | Font ≥ 16px (chế độ người già: 24px) |
| NFR-12 | Usability | Ghi chép bữa ăn đầu tiên < 3 phút |
| NFR-13 | Usability | Contrast ratio ≥ 4.5:1 (WCAG 2.1 AA) |
| NFR-14 | Usability | Tối đa 5 thao tác để ghi chép bữa ăn |
| NFR-15 | Maintainability | Unit test coverage ≥ 70% cho module lõi |
| NFR-16 | Maintainability | Kiến trúc module, thay thế được từng phần |
| NFR-17 | Maintainability | Docs API cập nhật đồng thời với code |
| NFR-18 | Compatibility | Chrome, Firefox, Safari, Edge (2 phiên bản mới) |
| NFR-19 | Compatibility | Android 8.0+ và iOS 13.0+ |
| NFR-20 | Compatibility | REST API chuẩn (JSON, HTTP/1.1+) |
| NFR-21 | Portability | Đóng gói Docker, deploy trên AWS/GCP/Azure |
| NFR-22 | Portability | Migration tự động, không phụ thuộc vendor |

---

## 3. Ma trận truy vết yêu cầu (RTM)

Xem file đầy đủ tại: [`RTM.md`](./RTM.md)

---

## 4. Tài liệu liên quan

- [User Stories (INVEST)](./User_Stories.md)
- [BDD Scenarios (Gherkin)](./BDD_Scenarios.md)
- [Use Case Specifications](./Use_Case_Specs.md)
- [Data Dictionary](./Data_Dictionary.md)
- [Architecture Diagrams](./architecture/)

---

## 5. Lịch sử phiên bản

| Phiên bản | Ngày | Mô tả | Tác giả |
|-----------|------|-------|---------|
| 1.0 | 28/09/2026 | Phiên bản đầu tiên cho Sprint 1 |