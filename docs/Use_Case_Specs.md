# Đặc tả Use Case chi tiết

---

## UC-08: Ghi chép bữa ăn

| Thành phần | Nội dung |
|------------|----------|
| **Mã UC** | UC-08 |
| **Tên UC** | Ghi chép bữa ăn |
| **Tác nhân chính** | Người dùng chính |
| **Tác nhân phụ** | Hệ thống (tính toán tự động), Alert Service |
| **Mô tả** | Người dùng tìm kiếm và thêm món ăn vào bữa ăn trong ngày |
| **Tiền điều kiện** | Người dùng đã đăng nhập; đã thiết lập hồ sơ và mục tiêu |
| **Hậu điều kiện** | Bữa ăn được ghi nhận; tổng dinh dưỡng được cập nhật; cảnh báo được kích hoạt nếu cần |
| **Luồng sự kiện chính** | 1. Người dùng chọn bữa ăn (sáng/trưa/tối/phụ)<br>2. Hệ thống hiển thị giao diện tìm kiếm<br>3. Người dùng nhập tên món hoặc quét mã vạch<br>4. Hệ thống hiển thị kết quả<br>5. Người dùng chọn món và nhập khối lượng<br>6. Người dùng nhấn "Thêm vào bữa ăn"<br>7. Hệ thống thêm món và cập nhật tổng dinh dưỡng<br>8. Hệ thống kiểm tra ngưỡng cảnh báo |
| **Luồng phụ** | 3a. Không tìm thấy món → chuyển sang UC-06<br>5a. Không biết khối lượng → chọn ước lượng |
| **Ngoại lệ** | 4a. Không có kết quả → thông báo lỗi<br>7a. Lỗi CSDL → yêu cầu thử lại |

---

## UC-14: Xuất báo cáo PDF

| Thành phần | Nội dung |
|------------|----------|
| **Mã UC** | UC-14 |
| **Tên UC** | Xuất báo cáo PDF |
| **Tác nhân chính** | Người dùng chính |
| **Tác nhân phụ** | Report Service, Cloud Storage |
| **Mô tả** | Người dùng xuất báo cáo tổng hợp dinh dưỡng dạng PDF |
| **Tiền điều kiện** | Đã đăng nhập; có dữ liệu bữa ăn trong khoảng thời gian chọn |
| **Hậu điều kiện** | File PDF được tạo và tải xuống thành công |
| **Luồng sự kiện chính** | 1. Vào trang Báo cáo<br>2. Chọn khoảng thời gian (7/30/90 ngày)<br>3. Nhấn "Xuất báo cáo PDF"<br>4. Hệ thống kiểm tra có dữ liệu<br>5. Truy vấn dữ liệu dinh dưỡng<br>6. Tổng hợp số liệu, vẽ biểu đồ<br>7. Tạo file PDF<br>8. Upload lên Cloud Storage<br>9. Trả về URL file PDF<br>10. Người dùng tải xuống |
| **Luồng phụ** | 3a. Chọn "Chia sẻ với bác sĩ" → UC-15 |
| **Ngoại lệ** | 4a. Không có dữ liệu → thông báo<br>7a. Lỗi tạo PDF → yêu cầu thử lại |

---

## UC-19: Ủy quyền cho người nhà

| Thành phần | Nội dung |
|------------|----------|
| **Mã UC** | UC-19 |
| **Tên UC** | Ủy quyền cho người nhà |
| **Tác nhân chính** | Người dùng chính |
| **Tác nhân phụ** | Người được ủy quyền, Notification Service |
| **Mô tả** | Người dùng chính cấp quyền cho người nhà thao tác hộ |
| **Tiền điều kiện** | Đã đăng nhập và có tài khoản hợp lệ |
| **Hậu điều kiện** | Lời mời ủy quyền được gửi; trạng thái "Đang chờ xác nhận" |
| **Luồng sự kiện chính** | 1. Vào trang "Ủy quyền"<br>2. Nhập SĐT/email người nhà<br>3. Chọn quyền (Nhập liệu hộ/Xem báo cáo)<br>4. Nhấn "Gửi lời mời"<br>5. Hệ thống gửi thông báo<br>6. Người nhà xác nhận đồng ý<br>7. Hệ thống ghi nhận ủy quyền thành công |
| **Luồng phụ** | 6a. Người nhà từ chối → thông báo cho người dùng chính |
| **Ngoại lệ** | 2a. SĐT không hợp lệ → thông báo lỗi<br>5a. Lỗi gửi thông báo → yêu cầu thử lại |

---

## UC-01 đến UC-21: Danh sách đầy đủ

| Mã UC | Tên Use Case | Tác nhân chính |
|-------|--------------|----------------|
| UC-01 | Đăng ký tài khoản | Người dùng chính |
| UC-02 | Thiết lập hồ sơ sức khỏe | Người dùng chính |
| UC-03 | Thiết lập mục tiêu dinh dưỡng | Người dùng chính |
| UC-04 | Tra cứu thực phẩm | Người dùng chính |
| UC-05 | Quét mã vạch sản phẩm | Người dùng chính |
| UC-06 | Thêm thực phẩm mới | Người dùng chính |
| UC-07 | Xem thông tin dinh dưỡng | Người dùng chính |
| UC-08 | Ghi chép bữa ăn | Người dùng chính |
| UC-09 | Tính toán dinh dưỡng tự động | Hệ thống |
| UC-10 | Xem tiến độ hàng ngày | Người dùng chính |
| UC-11 | Nhận cảnh báo vượt ngưỡng | Hệ thống |
| UC-12 | Xem lịch sử bữa ăn | Người dùng chính |
| UC-13 | Xem biểu đồ xu hướng | Người dùng chính |
| UC-14 | Xuất báo cáo PDF | Người dùng chính |
| UC-15 | Chia sẻ báo cáo | Người dùng chính |
| UC-16 | Nhận nhắc nhở ghi chép | Hệ thống |
| UC-17 | Cấu hình nhắc nhở | Người dùng chính |
| UC-18 | Xác nhận bỏ qua bữa ăn | Người dùng chính |
| UC-19 | Ủy quyền cho người nhà | Người dùng chính |
| UC-20 | Ghi vết thao tác | Hệ thống |
| UC-21 | Quản lý CSDL thực phẩm | Admin |
