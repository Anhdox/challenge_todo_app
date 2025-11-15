import 'package:flutter/material.dart';

// Phase 1: Implement State and Data Models
// Định nghĩa khuôn dữ liệu cho một Todo
class TodoItem {
  String title; // Nội dung (ví dụ: "Buy cookies")
  bool isCompleted; // Trạng thái (đã hoàn thành hay chưa)

  TodoItem({
    required this.title,
    this.isCompleted = false, // Mặc định là chưa hoàn thành
  });
}

// Định nghĩa các trạng thái lọc
enum TodoFilter {
  all,
  active,
  completed,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const MyHomePage(title: 'TODO App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Phase 1: Implement State and Data Models
  // === State Chính ===
  final List<TodoItem> _todos = [];
  TodoFilter _currentFilter = TodoFilter.all;
  final TextEditingController _textController = TextEditingController();

  // Phase 2: Implement Core Logic (Methods)
  // === State Phụ (Derived State) ===
  List<TodoItem> get _filteredTodos {
    switch (_currentFilter) {
      case TodoFilter.active:
        return _todos.where((todo) => !todo.isCompleted).toList();
      case TodoFilter.completed:
        return _todos.where((todo) => todo.isCompleted).toList();
      case TodoFilter.all:
        return _todos;
    }
  }

  int get _activeTodosCount {
    return _todos.where((todo) => !todo.isCompleted).length;
  }

  // === Methods ===
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTodo(String title) {
    if (title.trim().isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(title: title.trim()));
        _textController.clear();
      });
    }
  }

  void _toggleTodoStatus(TodoItem todoItem) {
    final int index = _todos.indexOf(todoItem);
    if (index != -1) {
      setState(() {
        _todos[index].isCompleted = !_todos[index].isCompleted;
      });
    }
  }

  void _changeFilter(TodoFilter newFilter) {
    setState(() {
      _currentFilter = newFilter;
    });
  }

  // === Build Method (UI Implementation) ===
  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredTodos;
    final theme = Theme.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: theme.colorScheme.inversePrimary,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Phase 3: UI - Title
            Text(
              'todos',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Phase 3: UI - Input
            TextField(
              controller: _textController,
              onSubmitted: _addTodo,
              decoration: const InputDecoration(
                hintText: 'What needs to be done?',
                prefixIcon: Icon(Icons.note_add_outlined),
              ),
            ),
            const SizedBox(height: 20),

            // Phase 3: UI - Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: 'Number of tasks left to do',
                  child: Text('$_activeTodosCount items left'),
                ),
                SegmentedButton<TodoFilter>(
                  // **FIX**: Bổ sung showSelectedIcon: false
                  showSelectedIcon: false,
                  //
                  style: SegmentedButton.styleFrom(
                    side: BorderSide(color: theme.colorScheme.outline.withAlpha(128)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  segments: const <ButtonSegment<TodoFilter>>[
                    ButtonSegment<TodoFilter>(
                      value: TodoFilter.all,
                      label: Text('All'),
                      tooltip: 'Show all tasks',
                    ),
                    ButtonSegment<TodoFilter>(
                      value: TodoFilter.active,
                      label: Text('Active'),
                      tooltip: 'Show active tasks',
                    ),
                    ButtonSegment<TodoFilter>(
                      value: TodoFilter.completed,
                      label: Text('Completed'),
                      tooltip: 'Show completed tasks',
                    ),
                  ],
                  selected: {_currentFilter},
                  onSelectionChanged: (Set<TodoFilter> newSelection) {
                    _changeFilter(newSelection.first);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // Phase 3: UI - List
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final todoItem = filteredList[index];
                  return CheckboxListTile(
                    title: Text(
                      todoItem.title,
                      style: TextStyle(
                        decoration: todoItem.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: todoItem.isCompleted
                            ? Colors.grey
                            : theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    value: todoItem.isCompleted,
                    onChanged: (bool? value) {
                      _toggleTodoStatus(todoItem);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
