# Giai đoạn 0: Tài liệu Yêu cầu (Project Brief)

**1. Tên dự án:**
Daily Challenge - TODO App

**2. Mục tiêu (Objective):**
Xây dựng một ứng dụng TODO list đơn giản, hoạt động đầy đủ trên một trang duy nhất, dựa trên hình ảnh mẫu.

**3. Các tính năng chính (Key Features):**
* **F-01 (Thêm Todo):** Người dùng có thể nhập văn bản vào một `TextField` và nhấn Enter (hoặc nút `Submit`) để thêm một "todo item" mới vào danh sách.
* **F-02 (Xem danh sách Todo):** Hiển thị tất cả các todo item trong một danh sách cuộn (`ListView`).
* **F-03 (Thay đổi trạng thái):** Người dùng có thể nhấn vào `Checkbox` bên cạnh mỗi item để đánh dấu là "hoàn thành" (completed) hoặc "chưa hoàn thành" (active).
* **F-04 (Xem số lượng):** Hiển thị một dòng văn bản cho biết số lượng todo item *chưa hoàn thành* (active) còn lại. (Ví dụ: "2 items left").
* **F-05 (Lọc danh sách):** Cung cấp 3 bộ lọc ("All", "Active", "Completed"). Nhấn vào một bộ lọc sẽ thay đổi danh sách todo được hiển thị cho phù hợp.

**4. Ràng buộc & Phạm vi (Constraints & Scope):**
* **C-01 (State Management):** BẮT BUỘC chỉ sử dụng `setState` và các `StatefulWidget` cơ bản của Flutter. KHÔNG được phép sử dụng bất kỳ thư viện quản lý state bên ngoài nào (Provider, Riverpod, Bloc, v.v.).
* **C-02 (Persistence):** KHÔNG cần lưu trữ dữ liệu lâu dài (như Firebase hay local storage). State sẽ được reset mỗi khi khởi động lại ứng dụng.
* **C-03 (UI):** Giao diện phải tuân thủ các nguyên tắc cơ bản của Material Design 3.