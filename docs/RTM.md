# Requirements Traceability Matrix (RTM)
## Hệ thống Kiểm soát Chế độ Ăn uống (Diet Control System)

**Phiên bản:** 1.0
**Ngày cập nhật:** Sprint 1
**Người thực hiện:** Nhóm KTPM_UD_17.38.20

---

## 1. Giới thiệu

Requirements Traceability Matrix (RTM) là bảng truy vết yêu cầu, dùng để:
- Liên kết giữa **User Story** ↔ **Business Requirement (BR)** ↔ **Use Case** ↔ **Test Case (BDD Scenario)**
- Đảm bảo mọi yêu cầu đều được hiện thực hóa và kiểm thử
- Phát hiện yêu cầu thiếu, thừa hoặc chưa được kiểm thử

---

## 2. Ma trận truy vết tổng thể

| Mã US | Tên User Story | Business Requirement | Use Case | BDD Scenario | API Endpoint | Sprint |
|-------|---------------|----------------------|----------|--------------|--------------|--------|
| US-01 | Đăng ký tài khoản | BR-01 | UC-01 | SC-01 | POST /api/auth/register | Sprint 1 |
| US-02 | Đăng nhập hệ thống | BR-01 | UC-02 | SC-02 | POST /api/auth/login | Sprint 1 |
| US-03 | Khai báo hồ sơ sức khỏe | BR-02 | UC-03 | SC-03 | POST /api/users/profile | Sprint 1 |
| US-04 | Tìm kiếm thực phẩm | BR-03 | UC-04 | SC-04 | GET /api/foods/search | Sprint 1 |
| US-05 | Xem chi tiết dinh dưỡng thực phẩm | BR-03 | UC-05 | SC-05 | GET /api/foods/{id} | Sprint 1 |
| US-06 | Ghi chép bữa ăn hằng ngày | BR-04 | UC-06 | SC-06, SC-07 | POST /api/meals | Sprint 1 |
| US-07 | Thiết lập mục tiêu calo | BR-05 | UC-07 | SC-08 | POST /api/goals | Sprint 1 |
| US-08 | Theo dõi tiến độ calo | BR-06 | UC-08 | SC-09 | GET /api/reports/daily | Sprint 1 |
| US-09 | Xem báo cáo dinh dưỡng tuần | BR-07 | UC-09 | SC-10 | GET /api/reports/weekly | Sprint 1 |
| US-10 | Xuất báo cáo PDF | BR-07 | UC-10 | SC-11 | GET /api/reports/export | Sprint 2 |
| US-11 | Cảnh báo vượt ngưỡng calo | BR-08 | UC-11 | SC-12 | POST /api/alerts/check | Sprint 1 |
| US-12 | Cảnh báo dị ứng thực phẩm | BR-09 | UC-12 | SC-13 | POST /api/alerts/allergy | Sprint 1 |
| US-13 | Gợi ý thực đơn thông minh | BR-10 | UC-13 | SC-14 | GET /api/meals/suggest | Sprint 2 |
| US-14 | Chế độ đơn giản cho người già | BR-11 | UC-14 | SC-15 | PUT /api/users/preferences | Sprint 2 |
| US-15 | Chia sẻ hồ sơ với bác sĩ | BR-12 | UC-15 | SC-16 | POST /api/share/doctor | Sprint 3 |

---

## 3. Truy vết theo Business Requirement

| Mã BR | Tên Business Requirement | User Story liên kết | Use Case | Trạng thái |
|-------|-------------------------|--------------------|---------| ----------|
| BR-01 | Quản lý người dùng và xác thực | US-01, US-02 | UC-01, UC-02 | ✅ Hoàn thành |
| BR-02 | Quản lý hồ sơ sức khỏe người dùng | US-03 | UC-03 | ✅ Hoàn thành |
| BR-03 | Tra cứu cơ sở dữ liệu thực phẩm | US-04, US-05 | UC-04, UC-05 | ✅ Hoàn thành |
| BR-04 | Ghi chép và theo dõi bữa ăn | US-06 | UC-06 | ✅ Hoàn thành |
| BR-05 | Thiết lập mục tiêu dinh dưỡng | US-07 | UC-07 | ✅ Hoàn thành |
| BR-06 | Theo dõi tiến độ calo hằng ngày | US-08 | UC-08 | ✅ Hoàn thành |
| BR-07 | Báo cáo dinh dưỡng định kỳ | US-09, US-10 | UC-09, UC-10 | ⚠️ Một phần |
| BR-08 | Cảnh báo vượt ngưỡng calo | US-11 | UC-11 | ✅ Hoàn thành |
| BR-09 | Cảnh báo dị ứng thực phẩm | US-12 | UC-12 | ✅ Hoàn thành |
| BR-10 | Gợi ý thực đơn thông minh | US-13 | UC-13 | ❌ Chưa làm (Sprint 2) |
| BR-11 | Hỗ trợ người cao tuổi | US-14 | UC-14 | ❌ Chưa làm (Sprint 2) |
| BR-12 | Chia sẻ dữ liệu với bác sĩ | US-15 | UC-15 | ❌ Chưa làm (Sprint 3) |

---

## 4. Truy vết Use Case ↔ BDD Scenario ↔ Test Case

| Use Case | Tên Use Case | BDD Scenario | Test Case | Trạng thái |
|----------|--------------|--------------|-----------|------------|
| UC-01 | Đăng ký tài khoản | SC-01 | TC-01 | ✅ Pass |
| UC-02 | Đăng nhập | SC-02 | TC-02 | ✅ Pass |
| UC-03 | Khai báo hồ sơ sức khỏe | SC-03 | TC-03 | ✅ Pass |
| UC-04 | Tìm kiếm thực phẩm | SC-04 | TC-04 | ✅ Pass |
| UC-05 | Xem chi tiết thực phẩm | SC-05 | TC-05 | ✅ Pass |
| UC-06 | Ghi chép bữa ăn | SC-06, SC-07 | TC-06, TC-07 | ✅ Pass |
| UC-07 | Thiết lập mục tiêu calo | SC-08 | TC-08 | ✅ Pass |
| UC-08 | Theo dõi tiến độ calo | SC-09 | TC-09 | ✅ Pass |
| UC-09 | Xem báo cáo tuần | SC-10 | TC-10 | ✅ Pass |
| UC-10 | Xuất báo cáo PDF | SC-11 | TC-11 | ⏳ Sprint 2 |
| UC-11 | Cảnh báo vượt ngưỡng calo | SC-12 | TC-12 | ✅ Pass |
| UC-12 | Cảnh báo dị ứng | SC-13 | TC-13 | ✅ Pass |
| UC-13 | Gợi ý thực đơn | SC-14 | TC-14 | ⏳ Sprint 2 |
| UC-14 | Chế độ người già | SC-15 | TC-15 | ⏳ Sprint 2 |
| UC-15 | Chia sẻ với bác sĩ | SC-16 | TC-16 | ⏳ Sprint 3 |

---

## 5. Truy vết theo API Endpoint

| API Endpoint | Method | User Story | Use Case | Sprint |
|--------------|--------|-----------|----------|--------|
| /api/auth/register | POST | US-01 | UC-01 | Sprint 1 |
| /api/auth/login | POST | US-02 | UC-02 | Sprint 1 |
| /api/users/profile | POST | US-03 | UC-03 | Sprint 1 |
| /api/users/preferences | PUT | US-14 | UC-14 | Sprint 2 |
| /api/foods/search | GET | US-04 | UC-04 | Sprint 1 |
| /api/foods/{id} | GET | US-05 | UC-05 | Sprint 1 |
| /api/meals | POST | US-06 | UC-06 | Sprint 1 |
| /api/meals/suggest | GET | US-13 | UC-13 | Sprint 2 |
| /api/goals | POST | US-07 | UC-07 | Sprint 1 |
| /api/reports/daily | GET | US-08 | UC-08 | Sprint 1 |
| /api/reports/weekly | GET | US-09 | UC-09 | Sprint 1 |
| /api/reports/export | GET | US-10 | UC-10 | Sprint 2 |
| /api/alerts/check | POST | US-11 | UC-11 | Sprint 1 |
| /api/alerts/allergy | POST | US-12 | UC-12 | Sprint 1 |
| /api/share/doctor | POST | US-15 | UC-15 | Sprint 3 |

---
## 6. Thống kê độ phủ yêu cầu

| Chỉ số | Số lượng | Tỷ lệ |
|--------|----------|-------|
| Tổng Business Requirements | 12 | 100% |
| BR đã hoàn thành Sprint 1 | 9 | 75% |
| BR chuyển sang Sprint 2 | 2 | 17% |
| BR chuyển sang Sprint 3 | 1 | 8% |
| Tổng User Stories | 15 | 100% |
| US đã hoàn thành Sprint 1 | 12 | 80% |
| Tổng Use Cases | 15 | 100% |
| UC đã hoàn thành Sprint 1 | 12 | 80% |
| Tổng BDD Scenarios | 16 | 100% |
| SC đã kiểm thử Sprint 1 | 13 | 81% |

---

## 7. Ghi chú

- **✅ Hoàn thành:** Đã đặc tả, thiết kế API, viết BDD scenario và skeleton code trong Sprint 1
- **⚠️ Một phần:** Đã đặc tả nhưng chưa triển khai đầy đủ (VD: xuất PDF chỉ có skeleton)
- **❌ Chưa làm:** Sẽ triển khai ở Sprint 2 hoặc Sprint 3
- **⏳ Sprint 2/3:** Yêu cầu đã được ghi nhận, chuyển sang sprint sau

---

## 8. Liên kết tài liệu liên quan

- [SRS v1.0](./SRS_v1.0.md)
- [User Stories](./User_Stories.md)
- [BDD Scenarios](./BDD_Scenarios.md)
- [Use Case Specifications](./Use_Case_Specs.md)
- [Data Dictionary](./Data_Dictionary.md)
- [OpenAPI Specification](../api/openapi.yaml)