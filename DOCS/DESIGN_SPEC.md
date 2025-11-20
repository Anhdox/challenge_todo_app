# Giai đoạn 1: Design Specification - High Level Design

## 1. Data Modeling (Mô hình Dữ liệu)

Ở cấp độ High-Level Design, chúng ta xác định các thực thể và cấu trúc dữ liệu cần thiết mà không phụ thuộc vào ngôn ngữ cụ thể.

### Entities (Thực thể)

**1. Todo Item (Công việc)**
* **Mô tả:** Đại diện cho một đầu việc cụ thể trong danh sách.
* **Thuộc tính (Attributes):**
    * `id` (String/UUID): Mã định danh duy nhất. Bắt buộc có để phân biệt các task, hỗ trợ thao tác xóa/sửa chính xác.
    * `title` (String): Nội dung công việc người dùng nhập.
    * `isCompleted` (Boolean): Trạng thái hoàn thành của công việc. Mặc định là `false`.
    * `createdAt` (DateTime/Timestamp): Thời điểm tạo task. (System Metadata dùng để sắp xếp hoặc log).

### Enums (Kiểu liệt kê)

**1. Todo Filter (Bộ lọc)**
* **Mô tả:** Các trạng thái lọc để điều khiển danh sách hiển thị.
* **Giá trị:**
    * `All`: Hiển thị tất cả công việc.
    * `Active`: Chỉ hiển thị công việc chưa hoàn thành.
    * `Completed`: Chỉ hiển thị công việc đã hoàn thành.

## 2. State Identification (Xác định Trạng thái)

Dựa trên nguyên tắc **Single Source of Truth**, chúng ta phân loại dữ liệu như sau:

### A. Core State (Nguồn Sự Thật)
Dữ liệu gốc, bắt buộc phải lưu trữ và quản lý bởi `Notifier`.

**1. `allTodos` (List<TodoItem>)**
* Danh sách chứa toàn bộ các công việc.
* Nơi quản lý: `todosProvider`.

**2. `currentFilter` (TodoFilter)**
* Bộ lọc đang được chọn (All/Active/Completed).
* Nơi quản lý: `filterProvider`.

### B. Derived State (Trạng thái Phái sinh)
Dữ liệu được tính toán tự động từ Core State. Không lưu trữ biến riêng.

**1. `filteredTodos` (List<TodoItem>)**
* **Input:** `allTodos` + `currentFilter`.
* **Logic:** Trả về danh sách con dựa trên bộ lọc.

**2. `activeCount` (int)**
* **Input:** `allTodos`.
* **Logic:** Đếm số phần tử có `isCompleted == false`.

## 3. Actions & Business Rules (Hành động & Quy tắc - HLD)

Xác định các hành động thay đổi Core State và các quy tắc nghiệp vụ (nếu có).

### Actions

**1. Add Todo**
* **Input:** `title` (String).
* **Target State:** `allTodos`.
* **Business Rules:**
    * **Validation:** Tiêu đề không được để trống (non-empty) hoặc chỉ chứa khoảng trắng.
    * **Data Integrity:** Mỗi Todo phải có một ID duy nhất (Unique ID) được tạo bởi hệ thống.
    * **Default State:** Todo mới mặc định có trạng thái chưa hoàn thành (`isCompleted = false`).

**2. Toggle Status**
* **Input:** `id` (String).
* **Target State:** `allTodos`.
* **Description:** Tìm công việc theo `id` và đảo ngược trạng thái `isCompleted`.

**3. Set Filter**
* **Input:** `filter` (TodoFilter).
* **Target State:** `currentFilter`.
* **Description:** Cập nhật bộ lọc hiển thị hiện tại.

## 4. UI Wiring (Đấu nối Giao diện - HLD)

Mô tả các thành phần giao diện chính và cách chúng kết nối với Logic/State.
*(Các widget bố cục trung gian như Container, Padding, Column... để AI tự quyết định theo chuẩn Material 3)*.

### Màn hình chính: `TodoListScreen`

**1. Zone 1: Header & Input**
* **Todo Input** (`TextField`)
    * ⚡ **Trigger:** `onSubmitted` -> Gọi Action **Add Todo**.

**2. Zone 2: Dashboard**
* **Stats Counter** (`Text`)
    * 👂 **Watch:** `activeCountProvider`.
* **Filter Bar** (`Row` chứa 3 nút)
    * 👂 **Watch:** `filterProvider` (để highlight nút chọn).
    * ⚡ **Trigger:** `onTap` -> Gọi Action **Set Filter**.

**3. Zone 3: List Area**
* **Todo List** (`ListView`)
    * 👂 **Watch:** `filteredTodosProvider`.
* **Todo Item** (`CheckboxListTile`)
    * 👂 **Watch:** `isCompleted` (của item hiện tại).
    * ⚡ **Trigger:** `onChanged` -> Gọi Action **Toggle Status**.

