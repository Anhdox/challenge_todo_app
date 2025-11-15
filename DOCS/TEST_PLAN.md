# Giai đoạn 3: Kế hoạch Kiểm thử (Test Plan)

Kế hoạch này dùng để xác minh (UAT - User Acceptance Testing) rằng tất cả các tính năng trong `PROJECT_BRIEF.md` đã được hoàn thành.

## 1. Kịch bản Kiểm thử Tính năng (Feature Test Cases)

---

**ID: T-01**
* **Tính năng (Feature):** F-01 (Thêm)
* **Kịch bản (Scenario):**
    1.  Mở app.
    2.  Gõ "Test 1" vào `TextField`.
    3.  Nhấn Enter.
* **Kết quả mong đợi (Expected):**
    1.  "Test 1" xuất hiện trong danh sách.
    2.  `TextField` trở nên trống.

---

**ID: T-02**
* **Tính năng (Feature):** F-03 (Toggle)
* **Kịch bản (Scenario):**
    1.  Thêm "Test 1".
    2.  Nhấn vào `Checkbox` bên cạnh "Test 1".
    3.  Nhấn lại `Checkbox` lần nữa.
* **Kết quả mong đợi (Expected):**
    1.  `Checkbox` được chọn.
    2.  `Checkbox` được bỏ chọn.

---

**ID: T-03**
* **Tính năng (Feature):** F-04 (Đếm)
* **Kịch bản (Scenario):**
    1.  Thêm "Test 1".
    2.  Thêm "Test 2".
    3.  Nhấn `Checkbox` của "Test 1".
* **Kết quả mong đợi (Expected):**
    1.  Text "items left" hiển thị "2".
    2.  Text "items left" cập nhật thành "1".

---

**ID: T-04**
* **Tính năng (Feature):** F-05 (Lọc)
* **Kịch bản (Scenario):**
    1.  Thêm "Test 1" (Active).
    2.  Thêm "Test 2" (Active).
    3.  Đánh dấu "Test 1" là Completed.
    4.  Nhấn filter "Active".
    5.  Nhấn filter "Completed".
    6.  Nhấn filter "All".
* **Kết quả mong đợi (Expected):**
    1.  Danh sách chỉ hiển thị "Test 2".
    2.  Danh sách chỉ hiển thị "Test 1".
    3.  Danh sách hiển thị cả hai.

---

## 2. Kịch bản Kiểm thử Ràng buộc (Constraint Test Cases)

---

**ID: T-05**
* **Ràng buộc (Constraint):** C-01 (State)
* **Kịch bản (Scenario):**
    1.  Kiểm tra file `pubspec.yaml`.
    2.  Kiểm tra code `lib/main.dart`.
* **Kết quả mong đợi (Expected):**
    1.  Không có package quản lý state (Provider, Riverpod, etc.).
    2.  Logic cập nhật state chỉ sử dụng `setState`.

---

**ID: T-06**
* **Ràng buộc (Constraint):** C-02 (Reset)
* **Kịch bản (Scenario):**
    1.  Thêm 3 todo item.
    2.  Đóng hoàn toàn app (force close).
    3.  Mở lại app.
* **Kết quả mong đợi (Expected):**
    1.  Danh sách todo trống (dữ liệu state đã reset).
```eof