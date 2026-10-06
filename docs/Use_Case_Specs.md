# Đặc tả Use Case chi tiết

---
# Đặc tả Use Case chi tiết

---

## UC-01: Đăng ký tài khoản

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                                                       |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-01                                                                                                                                                                                                                                                                                                          |
| **Tên UC**              | Đăng ký tài khoản                                                                                                                                                                                                                                                                                              |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                                                               |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                                                       |
| **Mô tả**               | Người dùng tạo tài khoản mới để sử dụng hệ thống quản lý dinh dưỡng                                                                                                                                                                                                                                            |
| **Tiền điều kiện**      | Người dùng chưa có tài khoản trên hệ thống                                                                                                                                                                                                                                                                     |
| **Hậu điều kiện**       | Tài khoản người dùng được tạo thành công                                                                                                                                                                                                                                                                       |
| **Luồng sự kiện chính** | 1. Người dùng chọn chức năng "Đăng ký"<br>2. Hệ thống hiển thị biểu mẫu đăng ký<br>3. Người dùng nhập thông tin tài khoản<br>4. Hệ thống kiểm tra tính hợp lệ của thông tin<br>5. Hệ thống kiểm tra tài khoản đã tồn tại hay chưa<br>6. Hệ thống tạo tài khoản mới<br>7. Hệ thống thông báo đăng ký thành công |
| **Luồng phụ**           | 3a. Người dùng sử dụng số điện thoại thay cho email để đăng ký                                                                                                                                                                                                                                                 |
| **Ngoại lệ**            | 4a. Thông tin không hợp lệ → thông báo lỗi và yêu cầu nhập lại<br>5a. Tài khoản đã tồn tại → thông báo và yêu cầu đăng nhập                                                                                                                                                                                    |

---

## UC-02: Thiết lập hồ sơ sức khỏe

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                                           |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-02                                                                                                                                                                                                                                                                                              |
| **Tên UC**              | Thiết lập hồ sơ sức khỏe                                                                                                                                                                                                                                                                           |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                                                   |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                                           |
| **Mô tả**               | Người dùng nhập và cập nhật các thông tin sức khỏe phục vụ quản lý dinh dưỡng                                                                                                                                                                                                                      |
| **Tiền điều kiện**      | Người dùng đã đăng nhập                                                                                                                                                                                                                                                                            |
| **Hậu điều kiện**       | Thông tin hồ sơ sức khỏe được lưu vào hệ thống                                                                                                                                                                                                                                                     |
| **Luồng sự kiện chính** | 1. Người dùng truy cập trang "Hồ sơ sức khỏe"<br>2. Hệ thống hiển thị biểu mẫu hồ sơ<br>3. Người dùng nhập các thông tin sức khỏe cần thiết<br>4. Người dùng nhấn "Lưu"<br>5. Hệ thống kiểm tra tính hợp lệ của dữ liệu<br>6. Hệ thống lưu thông tin hồ sơ<br>7. Hệ thống thông báo lưu thành công |
| **Luồng phụ**           | 3a. Người dùng chỉnh sửa thông tin hồ sơ đã có                                                                                                                                                                                                                                                     |
| **Ngoại lệ**            | 5a. Dữ liệu không hợp lệ → thông báo lỗi<br>6a. Lỗi lưu dữ liệu → yêu cầu người dùng thử lại                                                                                                                                                                                                       |

---

## UC-03: Thiết lập mục tiêu dinh dưỡng

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                                                                     |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-03                                                                                                                                                                                                                                                                                                                        |
| **Tên UC**              | Thiết lập mục tiêu dinh dưỡng                                                                                                                                                                                                                                                                                                |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                                                                             |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                                                                     |
| **Mô tả**               | Người dùng thiết lập mục tiêu dinh dưỡng cá nhân để theo dõi lượng dinh dưỡng hàng ngày                                                                                                                                                                                                                                      |
| **Tiền điều kiện**      | Người dùng đã đăng nhập và có hồ sơ sức khỏe                                                                                                                                                                                                                                                                                 |
| **Hậu điều kiện**       | Mục tiêu dinh dưỡng được lưu thành công                                                                                                                                                                                                                                                                                      |
| **Luồng sự kiện chính** | 1. Người dùng truy cập trang "Mục tiêu dinh dưỡng"<br>2. Hệ thống hiển thị mục tiêu hiện tại hoặc biểu mẫu thiết lập<br>3. Người dùng nhập các chỉ tiêu dinh dưỡng mong muốn<br>4. Người dùng nhấn "Lưu mục tiêu"<br>5. Hệ thống kiểm tra dữ liệu<br>6. Hệ thống lưu mục tiêu dinh dưỡng<br>7. Hệ thống thông báo thành công |
| **Luồng phụ**           | 3a. Người dùng sử dụng mức mục tiêu do hệ thống đề xuất                                                                                                                                                                                                                                                                      |
| **Ngoại lệ**            | 5a. Giá trị mục tiêu không hợp lệ → thông báo lỗi<br>6a. Lỗi lưu dữ liệu → yêu cầu thử lại                                                                                                                                                                                                                                   |

---

## UC-04: Tra cứu thực phẩm

| Thành phần              | Nội dung                                                                                                                                                                                                                                                      |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-04                                                                                                                                                                                                                                                         |
| **Tên UC**              | Tra cứu thực phẩm                                                                                                                                                                                                                                             |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                              |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                      |
| **Mô tả**               | Người dùng tìm kiếm thực phẩm trong cơ sở dữ liệu để xem và lựa chọn                                                                                                                                                                                          |
| **Tiền điều kiện**      | Người dùng đã đăng nhập                                                                                                                                                                                                                                       |
| **Hậu điều kiện**       | Danh sách thực phẩm phù hợp với yêu cầu tìm kiếm được hiển thị                                                                                                                                                                                                |
| **Luồng sự kiện chính** | 1. Người dùng truy cập chức năng "Tra cứu thực phẩm"<br>2. Hệ thống hiển thị ô tìm kiếm<br>3. Người dùng nhập tên thực phẩm<br>4. Hệ thống tìm kiếm trong cơ sở dữ liệu<br>5. Hệ thống hiển thị danh sách kết quả<br>6. Người dùng lựa chọn thực phẩm cần xem |
| **Luồng phụ**           | 3a. Người dùng lọc kết quả theo nhóm hoặc loại thực phẩm                                                                                                                                                                                                      |
| **Ngoại lệ**            | 4a. Không tìm thấy thực phẩm → thông báo không có kết quả phù hợp<br>4b. Lỗi truy vấn CSDL → yêu cầu thử lại                                                                                                                                                  |

---

## UC-05: Quét mã vạch sản phẩm

| Thành phần              | Nội dung                                                                                                                                                                                                                                                   |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-05                                                                                                                                                                                                                                                      |
| **Tên UC**              | Quét mã vạch sản phẩm                                                                                                                                                                                                                                      |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                           |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                   |
| **Mô tả**               | Người dùng sử dụng camera để quét mã vạch của sản phẩm và tìm kiếm thông tin dinh dưỡng                                                                                                                                                                    |
| **Tiền điều kiện**      | Người dùng đã đăng nhập; thiết bị có camera                                                                                                                                                                                                                |
| **Hậu điều kiện**       | Thông tin sản phẩm được tìm thấy và hiển thị                                                                                                                                                                                                               |
| **Luồng sự kiện chính** | 1. Người dùng chọn chức năng "Quét mã vạch"<br>2. Hệ thống yêu cầu quyền truy cập camera<br>3. Người dùng đưa mã vạch vào vùng quét<br>4. Hệ thống nhận diện mã vạch<br>5. Hệ thống tìm kiếm sản phẩm tương ứng<br>6. Hệ thống hiển thị thông tin sản phẩm |
| **Luồng phụ**           | 5a. Không tìm thấy sản phẩm → chuyển sang UC-06 để thêm thực phẩm mới                                                                                                                                                                                      |
| **Ngoại lệ**            | 2a. Người dùng không cấp quyền camera → thông báo và yêu cầu cấp quyền<br>4a. Không nhận diện được mã vạch → yêu cầu quét lại<br>5b. Lỗi truy vấn CSDL → yêu cầu thử lại                                                                                   |

---

## UC-06: Thêm thực phẩm mới

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                                      |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-06                                                                                                                                                                                                                                                                                         |
| **Tên UC**              | Thêm thực phẩm mới                                                                                                                                                                                                                                                                            |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                                              |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                                      |
| **Mô tả**               | Người dùng thêm thông tin thực phẩm chưa có trong cơ sở dữ liệu                                                                                                                                                                                                                               |
| **Tiền điều kiện**      | Người dùng đã đăng nhập; thực phẩm chưa tồn tại trong hệ thống                                                                                                                                                                                                                                |
| **Hậu điều kiện**       | Thực phẩm mới được lưu vào cơ sở dữ liệu                                                                                                                                                                                                                                                      |
| **Luồng sự kiện chính** | 1. Người dùng chọn chức năng "Thêm thực phẩm mới"<br>2. Hệ thống hiển thị biểu mẫu<br>3. Người dùng nhập tên và thông tin dinh dưỡng của thực phẩm<br>4. Người dùng nhấn "Lưu"<br>5. Hệ thống kiểm tra dữ liệu<br>6. Hệ thống lưu thực phẩm vào CSDL<br>7. Hệ thống thông báo thêm thành công |
| **Luồng phụ**           | 3a. Người dùng nhập thêm mã vạch sản phẩm                                                                                                                                                                                                                                                     |
| **Ngoại lệ**            | 5a. Thiếu thông tin bắt buộc → thông báo lỗi<br>5b. Thực phẩm đã tồn tại → thông báo và yêu cầu kiểm tra lại<br>6a. Lỗi CSDL → yêu cầu thử lại                                                                                                                                                |

---

## UC-07: Xem thông tin dinh dưỡng

| Thành phần              | Nội dung                                                                                                                                                                                                          |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-07                                                                                                                                                                                                             |
| **Tên UC**              | Xem thông tin dinh dưỡng                                                                                                                                                                                          |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                  |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                          |
| **Mô tả**               | Người dùng xem chi tiết các thông tin dinh dưỡng của một thực phẩm                                                                                                                                                |
| **Tiền điều kiện**      | Thực phẩm tồn tại trong cơ sở dữ liệu                                                                                                                                                                             |
| **Hậu điều kiện**       | Thông tin dinh dưỡng của thực phẩm được hiển thị                                                                                                                                                                  |
| **Luồng sự kiện chính** | 1. Người dùng chọn một thực phẩm<br>2. Hệ thống truy vấn thông tin thực phẩm<br>3. Hệ thống lấy thông tin dinh dưỡng<br>4. Hệ thống hiển thị calories, carbohydrate, protein, chất béo và các thông tin liên quan |
| **Luồng phụ**           | 1a. Người dùng chọn thực phẩm từ kết quả của UC-04 hoặc UC-05                                                                                                                                                     |
| **Ngoại lệ**            | 2a. Không tìm thấy thực phẩm → thông báo lỗi<br>2b. Lỗi CSDL → yêu cầu thử lại                                                                                                                                    |

---

## UC-09: Tính toán dinh dưỡng tự động

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                           |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-09                                                                                                                                                                                                                                                                              |
| **Tên UC**              | Tính toán dinh dưỡng tự động                                                                                                                                                                                                                                                       |
| **Tác nhân chính**      | Hệ thống                                                                                                                                                                                                                                                                           |
| **Tác nhân phụ**        | Người dùng chính                                                                                                                                                                                                                                                                   |
| **Mô tả**               | Hệ thống tự động tính tổng giá trị dinh dưỡng dựa trên các thực phẩm và khối lượng đã ghi nhận                                                                                                                                                                                     |
| **Tiền điều kiện**      | Bữa ăn đã được ghi nhận ít nhất một thực phẩm                                                                                                                                                                                                                                      |
| **Hậu điều kiện**       | Tổng giá trị dinh dưỡng của bữa ăn và trong ngày được cập nhật                                                                                                                                                                                                                     |
| **Luồng sự kiện chính** | 1. Người dùng thêm hoặc thay đổi thực phẩm trong bữa ăn<br>2. Hệ thống lấy thông tin dinh dưỡng của thực phẩm<br>3. Hệ thống lấy khối lượng thực phẩm<br>4. Hệ thống tính giá trị dinh dưỡng tương ứng<br>5. Hệ thống cộng tổng giá trị dinh dưỡng<br>6. Hệ thống cập nhật kết quả |
| **Luồng phụ**           | 1a. Người dùng xóa thực phẩm → hệ thống tự động tính lại tổng dinh dưỡng                                                                                                                                                                                                           |
| **Ngoại lệ**            | 2a. Không tìm thấy thông tin dinh dưỡng → thông báo lỗi<br>3a. Khối lượng không hợp lệ → yêu cầu nhập lại<br>5a. Lỗi tính toán → yêu cầu thử lại                                                                                                                                   |

---

## UC-10: Xem tiến độ hàng ngày

| Thành phần              | Nội dung                                                                                                                                                                                                                                                    |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-10                                                                                                                                                                                                                                                       |
| **Tên UC**              | Xem tiến độ hàng ngày                                                                                                                                                                                                                                       |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                            |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                    |
| **Mô tả**               | Người dùng xem mức độ hoàn thành mục tiêu dinh dưỡng trong ngày                                                                                                                                                                                             |
| **Tiền điều kiện**      | Người dùng đã đăng nhập và đã thiết lập mục tiêu dinh dưỡng                                                                                                                                                                                                 |
| **Hậu điều kiện**       | Tiến độ dinh dưỡng trong ngày được hiển thị                                                                                                                                                                                                                 |
| **Luồng sự kiện chính** | 1. Người dùng mở trang "Tiến độ hàng ngày"<br>2. Hệ thống lấy mục tiêu dinh dưỡng<br>3. Hệ thống lấy dữ liệu các bữa ăn trong ngày<br>4. Hệ thống tính tổng lượng dinh dưỡng đã sử dụng<br>5. Hệ thống so sánh với mục tiêu<br>6. Hệ thống hiển thị tiến độ |
| **Luồng phụ**           | 3a. Chưa có bữa ăn → hệ thống hiển thị tiến độ bằng 0                                                                                                                                                                                                       |
| **Ngoại lệ**            | 3b. Không lấy được dữ liệu bữa ăn → thông báo lỗi<br>5a. Không có mục tiêu dinh dưỡng → yêu cầu thiết lập mục tiêu                                                                                                                                          |

---

## UC-11: Nhận cảnh báo vượt ngưỡng

| Thành phần              | Nội dung                                                                                                                                                                                                                                    |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-11                                                                                                                                                                                                                                       |
| **Tên UC**              | Nhận cảnh báo vượt ngưỡng                                                                                                                                                                                                                   |
| **Tác nhân chính**      | Hệ thống                                                                                                                                                                                                                                    |
| **Tác nhân phụ**        | Người dùng chính, Alert Service                                                                                                                                                                                                             |
| **Mô tả**               | Hệ thống phát hiện và gửi cảnh báo khi lượng dinh dưỡng vượt quá ngưỡng mục tiêu                                                                                                                                                            |
| **Tiền điều kiện**      | Người dùng đã thiết lập mục tiêu dinh dưỡng                                                                                                                                                                                                 |
| **Hậu điều kiện**       | Cảnh báo được tạo và gửi đến người dùng                                                                                                                                                                                                     |
| **Luồng sự kiện chính** | 1. Người dùng ghi nhận hoặc cập nhật bữa ăn<br>2. Hệ thống tính tổng dinh dưỡng<br>3. Hệ thống so sánh với mục tiêu<br>4. Hệ thống phát hiện chỉ số vượt ngưỡng<br>5. Hệ thống tạo cảnh báo<br>6. Alert Service gửi cảnh báo đến người dùng |
| **Luồng phụ**           | 4a. Các chỉ số không vượt ngưỡng → hệ thống không tạo cảnh báo                                                                                                                                                                              |
| **Ngoại lệ**            | 5a. Lỗi tạo cảnh báo → ghi nhận lỗi hệ thống<br>6a. Lỗi gửi thông báo → lưu cảnh báo để gửi lại                                                                                                                                             |

---

## UC-12: Xem lịch sử bữa ăn

| Thành phần              | Nội dung                                                                                                                                                                                                                                                |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-12                                                                                                                                                                                                                                                   |
| **Tên UC**              | Xem lịch sử bữa ăn                                                                                                                                                                                                                                      |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                        |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                |
| **Mô tả**               | Người dùng xem lại các bữa ăn đã ghi chép trong những ngày trước                                                                                                                                                                                        |
| **Tiền điều kiện**      | Người dùng đã đăng nhập                                                                                                                                                                                                                                 |
| **Hậu điều kiện**       | Danh sách lịch sử bữa ăn được hiển thị                                                                                                                                                                                                                  |
| **Luồng sự kiện chính** | 1. Người dùng truy cập "Lịch sử bữa ăn"<br>2. Hệ thống hiển thị bộ lọc thời gian<br>3. Người dùng chọn ngày hoặc khoảng thời gian<br>4. Hệ thống truy vấn dữ liệu<br>5. Hệ thống hiển thị danh sách bữa ăn<br>6. Người dùng chọn bữa ăn để xem chi tiết |
| **Luồng phụ**           | 3a. Người dùng chọn ngày hiện tại để xem bữa ăn trong ngày                                                                                                                                                                                              |
| **Ngoại lệ**            | 4a. Không có dữ liệu → thông báo chưa có lịch sử<br>4b. Lỗi CSDL → yêu cầu thử lại                                                                                                                                                                      |

---

## UC-13: Xem biểu đồ xu hướng

| Thành phần              | Nội dung                                                                                                                                                                                                                                      |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-13                                                                                                                                                                                                                                         |
| **Tên UC**              | Xem biểu đồ xu hướng                                                                                                                                                                                                                          |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                              |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                      |
| **Mô tả**               | Người dùng xem biểu đồ thể hiện xu hướng dinh dưỡng theo thời gian                                                                                                                                                                            |
| **Tiền điều kiện**      | Người dùng đã đăng nhập và có dữ liệu bữa ăn                                                                                                                                                                                                  |
| **Hậu điều kiện**       | Biểu đồ xu hướng được hiển thị                                                                                                                                                                                                                |
| **Luồng sự kiện chính** | 1. Người dùng mở trang "Biểu đồ xu hướng"<br>2. Người dùng chọn khoảng thời gian<br>3. Hệ thống truy vấn dữ liệu dinh dưỡng<br>4. Hệ thống tổng hợp dữ liệu theo từng ngày<br>5. Hệ thống tạo dữ liệu biểu đồ<br>6. Hệ thống hiển thị biểu đồ |
| **Luồng phụ**           | 2a. Người dùng chọn khoảng thời gian 7/30/90 ngày                                                                                                                                                                                             |
| **Ngoại lệ**            | 3a. Không có dữ liệu → thông báo<br>3b. Lỗi truy vấn dữ liệu → yêu cầu thử lại                                                                                                                                                                |

---

## UC-15: Chia sẻ báo cáo

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-15                                                                                                                                                                                                                                                                   |
| **Tên UC**              | Chia sẻ báo cáo                                                                                                                                                                                                                                                         |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                        |
| **Tác nhân phụ**        | Hệ thống, Người nhận báo cáo                                                                                                                                                                                                                                            |
| **Mô tả**               | Người dùng chia sẻ báo cáo dinh dưỡng cho người được chỉ định                                                                                                                                                                                                           |
| **Tiền điều kiện**      | Người dùng đã đăng nhập và đã có báo cáo                                                                                                                                                                                                                                |
| **Hậu điều kiện**       | Báo cáo được chia sẻ thành công                                                                                                                                                                                                                                         |
| **Luồng sự kiện chính** | 1. Người dùng chọn báo cáo cần chia sẻ<br>2. Chọn chức năng "Chia sẻ báo cáo"<br>3. Nhập thông tin người nhận<br>4. Hệ thống kiểm tra thông tin<br>5. Người dùng xác nhận chia sẻ<br>6. Hệ thống tạo quyền truy cập báo cáo<br>7. Hệ thống gửi thông báo cho người nhận |
| **Luồng phụ**           | 3a. Người dùng chia sẻ báo cáo cho người đã từng nhận báo cáo                                                                                                                                                                                                           |
| **Ngoại lệ**            | 4a. Thông tin người nhận không hợp lệ → thông báo lỗi<br>6a. Người dùng không có quyền chia sẻ → từ chối yêu cầu<br>7a. Lỗi gửi thông báo → yêu cầu thử lại                                                                                                             |

---

## UC-16: Nhận nhắc nhở ghi chép

| Thành phần              | Nội dung                                                                                                                                                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Mã UC**               | UC-16                                                                                                                                                                                                                                |
| **Tên UC**              | Nhận nhắc nhở ghi chép                                                                                                                                                                                                               |
| **Tác nhân chính**      | Hệ thống                                                                                                                                                                                                                             |
| **Tác nhân phụ**        | Người dùng chính, Notification Service                                                                                                                                                                                               |
| **Mô tả**               | Hệ thống gửi thông báo nhắc người dùng ghi chép bữa ăn theo thời gian đã cấu hình                                                                                                                                                    |
| **Tiền điều kiện**      | Người dùng đã bật chức năng nhắc nhở                                                                                                                                                                                                 |
| **Hậu điều kiện**       | Thông báo nhắc nhở được gửi đến người dùng                                                                                                                                                                                           |
| **Luồng sự kiện chính** | 1. Hệ thống xác định thời điểm nhắc nhở<br>2. Hệ thống kiểm tra trạng thái ghi chép của người dùng<br>3. Hệ thống phát hiện bữa ăn chưa được ghi nhận<br>4. Hệ thống tạo thông báo nhắc nhở<br>5. Notification Service gửi thông báo |
| **Luồng phụ**           | 3a. Người dùng đã ghi chép bữa ăn → hệ thống không gửi nhắc nhở                                                                                                                                                                      |
| **Ngoại lệ**            | 5a. Lỗi gửi thông báo → hệ thống ghi nhận lỗi và thực hiện gửi lại                                                                                                                                                                   |

---

## UC-17: Cấu hình nhắc nhở

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Mã UC**               | UC-17                                                                                                                                                                                                                                                                    |
| **Tên UC**              | Cấu hình nhắc nhở                                                                                                                                                                                                                                                        |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                                                         |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                 |
| **Mô tả**               | Người dùng thiết lập thời gian và trạng thái nhắc nhở ghi chép bữa ăn                                                                                                                                                                                                    |
| **Tiền điều kiện**      | Người dùng đã đăng nhập                                                                                                                                                                                                                                                  |
| **Hậu điều kiện**       | Cấu hình nhắc nhở được lưu thành công                                                                                                                                                                                                                                    |
| **Luồng sự kiện chính** | 1. Người dùng truy cập trang "Cấu hình nhắc nhở"<br>2. Hệ thống hiển thị cấu hình hiện tại<br>3. Người dùng thiết lập thời gian nhắc nhở<br>4. Người dùng bật hoặc tắt nhắc nhở<br>5. Người dùng nhấn "Lưu"<br>6. Hệ thống kiểm tra cấu hình<br>7. Hệ thống lưu cấu hình |
| **Luồng phụ**           | 3a. Người dùng thiết lập nhiều thời điểm nhắc nhở trong ngày                                                                                                                                                                                                             |
| **Ngoại lệ**            | 6a. Thời gian không hợp lệ → thông báo lỗi<br>7a. Lỗi lưu dữ liệu → yêu cầu thử lại                                                                                                                                                                                      |

---

## UC-18: Xác nhận bỏ qua bữa ăn

| Thành phần              | Nội dung                                                                                                                                                                                                                                 |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-18                                                                                                                                                                                                                                    |
| **Tên UC**              | Xác nhận bỏ qua bữa ăn                                                                                                                                                                                                                   |
| **Tác nhân chính**      | Người dùng chính                                                                                                                                                                                                                         |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                 |
| **Mô tả**               | Người dùng xác nhận bỏ qua một bữa ăn mà hệ thống đang nhắc ghi chép                                                                                                                                                                     |
| **Tiền điều kiện**      | Người dùng có lời nhắc hoặc bữa ăn chưa được ghi nhận                                                                                                                                                                                    |
| **Hậu điều kiện**       | Bữa ăn được đánh dấu là đã bỏ qua                                                                                                                                                                                                        |
| **Luồng sự kiện chính** | 1. Người dùng nhận lời nhắc ghi chép<br>2. Người dùng chọn "Bỏ qua bữa ăn"<br>3. Hệ thống hiển thị yêu cầu xác nhận<br>4. Người dùng xác nhận<br>5. Hệ thống ghi nhận trạng thái bỏ qua<br>6. Hệ thống không tiếp tục nhắc cho bữa ăn đó |
| **Luồng phụ**           | 3a. Người dùng chọn "Hủy" → quay lại màn hình trước                                                                                                                                                                                      |
| **Ngoại lệ**            | 5a. Lỗi lưu trạng thái → thông báo và yêu cầu thử lại                                                                                                                                                                                    |

---

## UC-20: Ghi vết thao tác

| Thành phần              | Nội dung                                                                                                                                                                                                                                              |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-20                                                                                                                                                                                                                                                 |
| **Tên UC**              | Ghi vết thao tác                                                                                                                                                                                                                                      |
| **Tác nhân chính**      | Hệ thống                                                                                                                                                                                                                                              |
| **Tác nhân phụ**        | Người dùng chính, Admin                                                                                                                                                                                                                               |
| **Mô tả**               | Hệ thống ghi nhận các thao tác quan trọng của người dùng và Admin để phục vụ việc kiểm tra và truy vết                                                                                                                                                |
| **Tiền điều kiện**      | Hệ thống đang hoạt động                                                                                                                                                                                                                               |
| **Hậu điều kiện**       | Thao tác được lưu vào nhật ký hệ thống                                                                                                                                                                                                                |
| **Luồng sự kiện chính** | 1. Người dùng hoặc Admin thực hiện thao tác<br>2. Hệ thống xác định thao tác cần ghi nhận<br>3. Hệ thống thu thập thông tin người thực hiện, thời gian và nội dung thao tác<br>4. Hệ thống ghi thông tin vào nhật ký<br>5. Hệ thống hoàn tất thao tác |
| **Luồng phụ**           | 1a. Admin thực hiện thao tác quản trị → hệ thống ghi nhận tương tự                                                                                                                                                                                    |
| **Ngoại lệ**            | 4a. Không thể ghi nhật ký → hệ thống ghi nhận lỗi kỹ thuật và xử lý theo chính sách hệ thống                                                                                                                                                          |

---

## UC-21: Quản lý CSDL thực phẩm

| Thành phần              | Nội dung                                                                                                                                                                                                                                                                                                                   |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mã UC**               | UC-21                                                                                                                                                                                                                                                                                                                      |
| **Tên UC**              | Quản lý CSDL thực phẩm                                                                                                                                                                                                                                                                                                     |
| **Tác nhân chính**      | Admin                                                                                                                                                                                                                                                                                                                      |
| **Tác nhân phụ**        | Hệ thống                                                                                                                                                                                                                                                                                                                   |
| **Mô tả**               | Admin quản lý thông tin thực phẩm trong cơ sở dữ liệu của hệ thống                                                                                                                                                                                                                                                         |
| **Tiền điều kiện**      | Admin đã đăng nhập và có quyền quản trị                                                                                                                                                                                                                                                                                    |
| **Hậu điều kiện**       | Thông tin thực phẩm được thêm, cập nhật hoặc xóa thành công                                                                                                                                                                                                                                                                |
| **Luồng sự kiện chính** | 1. Admin truy cập chức năng "Quản lý CSDL thực phẩm"<br>2. Hệ thống hiển thị danh sách thực phẩm<br>3. Admin chọn thêm, sửa hoặc xóa thực phẩm<br>4. Admin nhập hoặc chỉnh sửa thông tin<br>5. Hệ thống kiểm tra tính hợp lệ<br>6. Hệ thống cập nhật CSDL<br>7. Hệ thống ghi vết thao tác<br>8. Hệ thống thông báo kết quả |
| **Luồng phụ**           | 3a. Admin tìm kiếm thực phẩm trước khi chỉnh sửa<br>3b. Admin hủy thao tác → dữ liệu không thay đổi                                                                                                                                                                                                                        |
| **Ngoại lệ**            | 5a. Dữ liệu không hợp lệ → thông báo lỗi<br>6a. Thực phẩm đang được sử dụng → cảnh báo trước khi xóa<br>6b. Lỗi CSDL → yêu cầu thử lại                                                                                                                                                                                     |

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
