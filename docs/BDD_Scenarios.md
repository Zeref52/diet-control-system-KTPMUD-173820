# Kịch bản nghiệm thu Gherkin BDD

Tất cả Acceptance Criteria được viết theo cú pháp Given-When-Then.

---

## US-01: Đăng ký tài khoản

```gherkin
Feature: Đăng ký tài khoản
  As a người quan tâm đến sức khỏe
  I want to đăng ký tài khoản
  So that tôi có thể bắt đầu theo dõi chế độ ăn

  Scenario: Đăng ký thành công bằng email
    Given tôi chưa có tài khoản trong hệ thống
    When tôi nhập email "nguoidung@example.com" và mật khẩu hợp lệ
    And tôi nhấn nút "Đăng ký"
    Then hệ thống gửi mã OTP đến email của tôi
    And tôi nhập đúng mã OTP
    Then tài khoản của tôi được tạo thành công
    And tôi được chuyển đến trang thiết lập hồ sơ sức khỏe

  Scenario: Đăng ký thất bại do email đã tồn tại
    Given tôi đã có tài khoản với email "nguoidung@example.com"
    When tôi nhập email "nguoidung@example.com" và mật khẩu hợp lệ
    And tôi nhấn nút "Đăng ký"
    Then hệ thống hiển thị thông báo "Email này đã được đăng ký"
    And tài khoản mới không được tạo

  Scenario: Đăng ký thất bại do mật khẩu quá yếu
    Given tôi chưa có tài khoản trong hệ thống
    When tôi nhập email "nguoidung@example.com" và mật khẩu "123"
    And tôi nhấn nút "Đăng ký"
    Then hệ thống hiển thị thông báo "Mật khẩu phải có ít nhất 8 ký tự"
    And tài khoản mới không được tạo
```

## US-02: Thiết lập hồ sơ sức khỏe

```gherkin
Feature: Thiết lập hồ sơ sức khỏe
  As a người dùng
  I want to nhập thông tin cá nhân và mục tiêu sức khỏe
  So that hệ thống tính toán nhu cầu dinh dưỡng phù hợp

  Scenario: Thiết lập hồ sơ thành công
    Given tôi đã đăng nhập vào hệ thống
    And tôi đang ở trang thiết lập hồ sơ
    When tôi nhập tuổi "30", giới tính "Nam", chiều cao "170", cân nặng "65"
    And tôi chọn mức vận động "Vừa phải"
    And tôi nhập bệnh lý nền "Tiểu đường type 2"
    And tôi nhấn nút "Lưu"
    Then hồ sơ của tôi được lưu thành công
    And hệ thống gợi ý mục tiêu dinh dưỡng phù hợp

  Scenario: Nhập chiều cao không hợp lệ
    Given tôi đang ở trang thiết lập hồ sơ
    When tôi nhập chiều cao "0" cm
    And tôi nhấn nút "Lưu"
    Then hệ thống hiển thị thông báo "Chiều cao phải lớn hơn 0"
    And hồ sơ không được lưu

  Scenario: Nhập cân nặng không hợp lệ
    Given tôi đang ở trang thiết lập hồ sơ
    When tôi nhập cân nặng "-5" kg
    And tôi nhấn nút "Lưu"
    Then hệ thống hiển thị thông báo "Cân nặng phải lớn hơn 0"
    And hồ sơ không được lưu

  Scenario: Bỏ trống trường bắt buộc
    Given tôi đang ở trang thiết lập hồ sơ
    When tôi bỏ trống trường "Tuổi"
    And tôi nhấn nút "Lưu"
    Then hệ thống hiển thị thông báo "Vui lòng nhập đầy đủ thông tin bắt buộc"
    And hồ sơ không được lưu
```

## US-03: Tra cứu thực phẩm

```gherkin
Feature: Tra cứu thực phẩm
  As a người dùng
  I want to tìm kiếm món ăn
  So that tôi biết thông tin dinh dưỡng của món tôi sắp ăn

  Scenario: Tìm kiếm thành công bằng tên món
    Given tôi đang ở trang tra cứu thực phẩm
    When tôi tìm kiếm "phở bò"
    Then hệ thống hiển thị danh sách các món có tên chứa "phở bò"
    And mỗi kết quả hiển thị tên món và lượng calo

  Scenario: Tìm kiếm không có kết quả
    Given tôi đang ở trang tra cứu thực phẩm
    When tôi tìm kiếm "xyzabc123"
    Then hệ thống hiển thị thông báo "Không tìm thấy món ăn"
    And hiển thị nút "Thêm món mới"

  Scenario: Quét mã vạch không hợp lệ
    Given tôi đang ở trang tra cứu thực phẩm
    When tôi quét mã vạch "0000000000000"
    Then hệ thống hiển thị thông báo "Không tìm thấy sản phẩm với mã vạch này"
```

## US-04: Ghi chép bữa ăn

```gherkin
Feature: Ghi chép bữa ăn
  As a người dùng
  I want to ghi lại các món đã ăn
  So that tôi theo dõi được tổng lượng dinh dưỡng tiêu thụ

  Scenario: Ghi chép bữa ăn thành công
    Given tôi đã đăng nhập vào hệ thống
    And tôi đang ở trang ghi chép bữa ăn
    When tôi tìm kiếm món "Phở bò"
    And tôi chọn món "Phở bò" từ kết quả tìm kiếm
    And tôi nhập khối lượng "500g"
    And tôi nhấn nút "Thêm vào bữa ăn"
    Then món "Phở bò" với khối lượng 500g được thêm vào bữa ăn hiện tại
    And tổng lượng calo trong ngày được cập nhật tự động

  Scenario: Ghi chép thất bại do chưa chọn món
    Given tôi đang ở trang ghi chép bữa ăn
    When tôi nhấn nút "Thêm vào bữa ăn" mà chưa chọn món nào
    Then hệ thống hiển thị thông báo "Vui lòng chọn ít nhất một món ăn"
    And không có món nào được thêm vào bữa ăn
```

## US-05: Xem tiến độ dinh dưỡng

```gherkin
Feature: Xem tiến độ dinh dưỡng
  As a người dùng
  I want to xem biểu đồ tiến độ
  So that tôi biết mình đang làm tốt hay cần điều chỉnh

  Scenario: Xem tiến độ thành công
    Given tôi đã ghi chép ít nhất một bữa ăn trong ngày
    When tôi vào trang Dashboard
    Then hệ thống hiển thị thanh tiến độ cho calo, carbs, protein, fat
    And hiển thị màu xanh nếu chưa vượt 80% mục tiêu
    And hiển thị màu vàng nếu đạt 80-100% mục tiêu
    And hiển thị màu đỏ nếu vượt 100% mục tiêu
```

## US-06: Nhận cảnh báo vượt ngưỡng

```gherkin
Feature: Nhận cảnh báo vượt ngưỡng
  As a người dùng có bệnh lý nền
  I want to nhận cảnh báo khi vượt ngưỡng
  So that tôi bảo vệ sức khỏe của mình

  Scenario: Cảnh báo vượt ngưỡng carbohydrate
    Given tôi là người dùng có bệnh lý tiểu đường type 2
    And mục tiêu carbohydrate hàng ngày của tôi là 200g
    And tôi đã tiêu thụ 180g carbohydrate trong ngày
    When tôi thêm món "Cơm trắng" với khối lượng 200g
    Then hệ thống hiển thị cảnh báo "Bạn đã vượt 80% mục tiêu carbohydrate hàng ngày"
    And hệ thống đề xuất các món ăn ít carbohydrate
```

## US-07: Xuất báo cáo cho bác sĩ

```gherkin
Feature: Xuất báo cáo dinh dưỡng
  As a người dùng
  I want to xuất báo cáo dạng PDF
  So that tôi có thể chia sẻ với bác sĩ

  Scenario: Xuất báo cáo thành công
    Given tôi đã ghi chép đầy đủ bữa ăn trong 30 ngày qua
    When tôi nhấn nút "Xuất báo cáo PDF"
    And tôi chọn khoảng thời gian "30 ngày gần nhất"
    Then hệ thống tạo file PDF chứa tổng calo TB, tỷ lệ đạt mục tiêu, biểu đồ xu hướng
    And file PDF được tải xuống thiết bị của tôi

  Scenario: Không có dữ liệu để xuất báo cáo
    Given tôi chưa ghi chép bữa ăn nào trong 30 ngày qua
    When tôi nhấn nút "Xuất báo cáo PDF"
    Then hệ thống hiển thị thông báo "Không có dữ liệu để xuất báo cáo"
```

## US-08: Ủy quyền cho người nhà

```gherkin
Feature: Ủy quyền cho người nhà
  As a người dùng
  I want to ủy quyền cho người nhà nhập liệu hộ
  So that duy trì việc ghi chép ngay khi tôi không thể tự làm

  Scenario: Ủy quyền thành công
    Given tôi đã đăng nhập với vai trò người dùng chính
    When tôi vào trang "Ủy quyền"
    And tôi nhập số điện thoại của người nhà "0912345678"
    And tôi chọn quyền "Nhập liệu hộ"
    And tôi nhấn "Gửi lời mời"
    Then hệ thống gửi thông báo đến số điện thoại của người nhà
    And trạng thái ủy quyền là "Đang chờ xác nhận"

  Scenario: Người nhà từ chối ủy quyền
    Given người nhà đã nhận được lời mời ủy quyền
    When người nhà nhấn "Từ chối"
    Then hệ thống thông báo cho người dùng chính "Người nhà đã từ chối ủy quyền"
```