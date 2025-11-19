# Giai đoạn 0: Tài liệu Yêu cầu (Project Brief) - v2 (Riverpod Refactor)

**1. Tên dự án:**
Daily Challenge - TODO App (Riverpod Refactor)

**2. Mục tiêu (Objective):**
Refactor (tái cấu trúc) ứng dụng TODO hiện có để đạt được kiến trúc tách biệt rõ ràng giữa Logic và UI, sử dụng thư viện **Riverpod**.

**3. Các tính năng chính (Key Features):**
* **F-01 (Thêm Todo):** Người dùng nhập văn bản vào `TextField` và nhấn Enter để thêm một công việc mới.
* **F-02 (Xem danh sách):** Hiển thị toàn bộ danh sách công việc dưới dạng cuộn (`ListView`).
* **F-03 (Cập nhật trạng thái):** Người dùng nhấn vào `Checkbox` để đánh dấu hoàn thành (completed) hoặc chưa hoàn thành (active).
* **F-04 (Bộ đếm):** Hiển thị số lượng công việc *chưa hoàn thành* còn lại (Ví dụ: "2 items left").
* **F-05 (Bộ lọc):** Người dùng có thể chuyển đổi giữa 3 chế độ xem: "All" (Tất cả), "Active" (Chưa xong), "Completed" (Đã xong).

**4. Yêu cầu Kỹ thuật & Ràng buộc (Technical Requirements & Constraints):**

* **C-01 (State Management Strategy):**
    * Sử dụng thư viện **`flutter_riverpod`** làm giải pháp quản lý state chính.
    * **Lý do:** Tận dụng khả năng truy cập state toàn cục an toàn, dễ dàng kết hợp các state (composability), và khả năng test độc lập của Riverpod.

* **C-02 (Architecture - Separation of Concerns):**
    * BẮT BUỘC tách biệt hoàn toàn **Logic Nghiệp vụ** (Business Logic) ra khỏi **Giao diện** (UI).
    * **File Structure:** Code logic (quản lý danh sách, lọc, đếm) PHẢI được chuyển sang các file `.dart` riêng biệt (ví dụ: `todo_provider.dart`).
    * **UI Responsibility:** File `main.dart` và các Widget chỉ chịu trách nhiệm hiển thị và gọi hàm từ Provider. Tuyệt đối không viết logic xử lý dữ liệu bên trong Widget.

* **C-03 (Clean Code):**
    * Loại bỏ hoàn toàn việc sử dụng `setState` cho logic nghiệp vụ.
    * UI phải là `ConsumerWidget` hoặc sử dụng `Consumer` để lắng nghe thay đổi từ Provider một cách tối ưu.

* **C-04 (Persistence):**
    * *(Chưa yêu cầu)* Dữ liệu vẫn reset khi khởi động lại ứng dụng.