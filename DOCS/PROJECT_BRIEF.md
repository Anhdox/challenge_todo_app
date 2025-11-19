# Giai đoạn 0: Tài liệu Yêu cầu (Project Brief) - v5 (Final Version)

**1. Tên dự án:**
Daily Challenge - TODO App (Riverpod Refactor)

**2. Mục tiêu (Objective):**
Refactor (tái cấu trúc) ứng dụng TODO hiện có để đạt được kiến trúc tách biệt rõ ràng giữa Logic và UI, sử dụng thư viện **Riverpod** và các tính năng hiện đại của **Dart 3**.

**3. Các tính năng chính (Key Features):**
* **F-01 (Thêm Todo):** Người dùng nhập văn bản vào `TextField` và nhấn Enter để thêm một công việc mới.
* **F-02 (Xem danh sách):** Hiển thị toàn bộ danh sách công việc dưới dạng cuộn (`ListView`).
* **F-03 (Cập nhật trạng thái):** Người dùng nhấn vào `Checkbox` để đánh dấu hoàn thành (completed) hoặc chưa hoàn thành (active).
* **F-04 (Bộ đếm):** Hiển thị số lượng công việc *chưa hoàn thành* còn lại (Ví dụ: "2 items left").
* **F-05 (Bộ lọc):** Người dùng có thể chuyển đổi giữa 3 chế độ xem: "All" (Tất cả), "Active" (Chưa xong), "Completed" (Đã xong).

**4. Yêu cầu Kỹ thuật & Ràng buộc (Technical Requirements & Constraints):**

* **C-01 (State Management - Explicit Mode):**
    * Sử dụng thư viện **`flutter_riverpod` version 3.0**.
    * **Lưu ý học tập:** KHÔNG sử dụng `riverpod_generator` (tag `@riverpod`). Phải khai báo Provider thủ công (Manual Definition) bằng `NotifierProvider` hoặc `Provider` để nắm vững cơ chế hoạt động.

* **C-02 (Language & Syntax - Modern Dart):**
    * BẮT BUỘC ưu tiên sử dụng **Static Namespace Shorthands (Dot Shorthands)** của Dart để code ngắn gọn.
    * Kết hợp với **Switch Expressions** và **Pattern Matching**.

* **C-03 (Architecture - Separation of Concerns):**
    * Tách biệt hoàn toàn Logic (trong các file `_provider.dart`) và UI (trong các file Widget).
    * UI chỉ chịu trách nhiệm hiển thị và gọi hàm từ Provider. Tuyệt đối không viết logic xử lý dữ liệu bên trong Widget.

* **C-04 (Clean Code):**
    * Ưu tiên sự rõ ràng. Code ngắn gọn nhưng phải dễ hiểu (readable).
    * Loại bỏ hoàn toàn việc sử dụng `setState` cho logic nghiệp vụ.

* **C-05 (Environment):**
    * **Flutter SDK:** Version 3.38 (hoặc mới hơn).
    * **Dart SDK:** Version 3.10 (hoặc mới hơn).
    * **Riverpod:** Version 3.0.