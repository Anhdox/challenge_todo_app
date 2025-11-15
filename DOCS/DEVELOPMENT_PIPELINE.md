# TODO App - Quy trình Phát triển (Development Pipeline)

Đây là tài liệu tổng quan theo dõi tiến độ của dự án, phác thảo các giai đoạn chính từ lúc lên ý tưởng đến khi hoàn thành sản phẩm.

### 🗺️ Các Giai đoạn (The Stages)

[x] Giai đoạn 0: Yêu cầu (Requirements)

* **Mô tả:** Xác định mục tiêu, các tính năng chính (features), và các ràng buộc (constraints) của dự án.
* **Tài liệu liên quan:** `PROJECT_BRIEF.md`
* **Trạng thái:** ✅ **Hoàn tất**

[x] Giai đoạn 1: Thiết kế (Design)

* **Mô tả:** Thiết kế kiến trúc kỹ thuật, mô hình dữ liệu (data models), và luồng logic (logic flow) của ứng dụng. Đây là bản thiết kế chi tiết (blueprint) cho `State` và các hàm.
* **Tài liệu liên quan:** `DESIGN_SPEC.md`
* **Trạng thái:** ✅ **Hoàn tất**

[ ] Giai đoạn 2: Thi công (Implementation)

* **Mô tả:** Viết code dựa trên bản thiết kế đã duyệt. Giai đoạn này sẽ được thực hiện bằng cách sử dụng AI Agent (Gemini Code Assist) theo các chỉ thị trong `AGENTS.md`.
* **Tài liệu liên quan:** `AGENTS.md`
* **Trạng thái:** 📍 **BÂY GIỜ (Now)** - *Chúng ta đang bắt đầu giai đoạn này.*

[ ] Giai đoạn 3: Kiểm thử (Testing)

* **Mô tả:** Thực hiện các bài kiểm thử (unit test và UAT) để xác minh rằng các tính năng hoạt động đúng như mong đợi trong `PROJECT_BRIEF.md`.
* **Tài liệu liên quan:** `TEST_PLAN.md`
* **Trạng thái:** ⬜ **Chưa bắt đầu**

[ ] Giai đoạn 4: Đánh giá & Hoàn tất (Review & Finish)

* **Mô tả:** Đánh giá lại toàn bộ sản phẩm, sửa các lỗi còn sót lại (nếu có), và chính thức hoàn thành bài tập.
* **Trạng thái:** ⬜ **Chưa bắt đầu**