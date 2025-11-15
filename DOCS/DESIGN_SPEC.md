# Giai đoạn 1: Đặc tả Thiết kế (Design Specification)

## 1. Thiết kế Mô hình Dữ liệu (Data Models)

Để đáp ứng các yêu cầu `F-01`, `F-02`, `F-03`, chúng ta cần một `class` để định nghĩa một "Todo Item".

```dart
// Định nghĩa khuôn dữ liệu cho một Todo
class TodoItem {
  String title;     // Nội dung (ví dụ: "Buy cookies")
  bool isCompleted; // Trạng thái (đã hoàn thành hay chưa)

  TodoItem({
    required this.title,
    this.isCompleted = false, // Mặc định là chưa hoàn thành
  });
}
```

Chúng ta cũng cần một enum (kiểu liệt kê) để định nghĩa các trạng thái lọc (filter).

```dart
// Định nghĩa các trạng thái lọc
enum TodoFilter {
  all,
  active,
  completed,
}
```

## 2. Thiết kế State (State Design)
   Toàn bộ state của ứng dụng sẽ được quản lý bên trong _MyHomePageState (hoặc một tên tương tự).

```dart
// Phác thảo các biến State cần thiết
class _MyHomePageState extends State<MyHomePage> {

    // === State Chính ===
    
    // [State-1] Danh sách "nguồn" (source of truth) chứa tất cả các todo
    final List<TodoItem> _todos = [];
    
    // [State-2] Bộ lọc hiện tại đang được chọn
    TodoFilter _currentFilter = TodoFilter.all;
    
    // [State-3] Dùng để điều khiển nội dung của TextField
    final TextEditingController _textController = TextEditingController();
    
    // === State Phụ (Derived State) ===
    // Đây là các giá trị được TÍNH TOÁN từ State Chính
    
    // [Derived-1] Danh sách todo đã được lọc (dùng để hiển thị lên UI)
    List<TodoItem> get _filteredTodos {
    // Logic lọc sẽ được viết ở đây
    }
    
    // [Derived-2] Số lượng item còn lại (active)
    int get _activeTodosCount {
    // Logic đếm sẽ được viết ở đây
    }
    
    // ... các hàm logic (methods) sẽ ở bên dưới ...
}
```

## 3. Thiết kế Logic (Methods Design)

_MyHomePageState sẽ cần các hàm (methods) sau để cập nhật State (và gọi setState):

### void _addTodo(String title)

Kích hoạt: Khi người dùng submit TextField (F-01).

Logic: Tạo một TodoItem mới, thêm vào danh sách _todos, và xóa nội dung _textController.

### void _toggleTodoStatus(int index)

Kích hoạt: Khi người dùng nhấn Checkbox của một item (F-03).

Logic: Lấy index của item, đảo ngược giá trị isCompleted của _todos[index].

### void _changeFilter(TodoFilter newFilter)

Kích hoạt: Khi người dùng nhấn vào một trong 3 nút lọc (F-05).

Logic: Cập nhật biến _currentFilter = newFilter;.

### void _dispose()

Kích hoạt: Khi widget bị hủy.

Logic: Hủy _textController để tránh rò rỉ bộ nhớ.