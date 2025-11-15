# Giai đoạn 2: Chỉ thị cho AI Agent (Agent Instructions)

Đây là bản thiết kế chi tiết (blueprint) cho AI Agent (Gemini Code Assist) để thi công dự án.

## # ROLE
You are an expert Flutter/Dart developer. Your mission is to implement the Flutter TODO App based *exactly* on the `DESIGN_SPEC.md` and `PROJECT_BRIEF.md` files. You will work inside the `lib/main.dart` file.

## # RULES
1.  **Strict Adherence to Design:** You MUST follow the `DESIGN_SPEC.md` strictly. Do not invent new class names, state variables, or methods. Implement the data models (`TodoItem`, `TodoFilter`) and state variables (`_todos`, `_currentFilter`, `_textController`) exactly as specified.
2.  **State Management:** You MUST only use `setState` for state management, as required by `PROJECT_BRIEF.md` (Constraint C-01).
3.  **Material Design:** You MUST use Material 3 widgets (`TextField`, `CheckboxListTile`, `TextButton`, `ListView`).
4.  **Accessibility (a11y):** You MUST add appropriate `tooltip` properties to all interactive widgets (`IconButton`, `TextButton`) describing their action.
5.  **Handle Ambiguity:** If the design specification is unclear on a minor UI detail (e.g., padding, exact color), you may make a reasonable choice. If a logic implementation is unclear, you MUST leave a `// TODO: [Your Question]` comment.

## # TASK (Implementation Blueprint)

Implement the app in logical phases.

### Phase 1: Implement State and Data Models
1.  Create the `TodoItem` class outside of other classes.
2.  Create the `TodoFilter` enum outside of other classes.
3.  Inside `_MyHomePageState`, implement all State variables: `_todos`, `_currentFilter`, `_textController`.

### Phase 2: Implement Core Logic (Methods)
1.  Implement the `_addTodo(String title)` method. It must call `setState`.
2.  Implement the `_toggleTodoStatus(int index)` method. It must call `setState`.
3.  Implement the `_changeFilter(TodoFilter newFilter)` method. It must call `setState`.
4.  Implement the `_dispose()` method to dispose the `_textController`.
5.  Implement the `get _activeTodosCount` getter.
6.  Implement the `get _filteredTodos` getter (use a `switch` statement on `_currentFilter` to return the correct list).

### Phase 3: Implement the UI (Build Method)
1.  Set the `body` of the `Scaffold` to be a `Column`.
2.  **UI - Title:** Add a `Text('todos', ...)` widget at the top.
3.  **UI - Input:** Add a `TextField` widget.
    * It MUST be controlled by `_textController`.
    * It MUST use `onSubmitted` to call `_addTodo`.
    * It MUST have a `decoration` with `hintText: 'What needs to be done?'`.
4.  **UI - Controls:** Add a `Row` widget containing:
    * The `Text` widget displaying the `_activeTodosCount` (e.g., "2 items left").
    * Three `TextButton`s ("All", "Active", "Completed") that call `_changeFilter` when pressed.
5.  **UI - List:** Add an `Expanded` widget containing a `ListView.builder`.
    * `itemCount` MUST come from `_filteredTodos.length`.
    * `itemBuilder` MUST return a `CheckboxListTile` for each item.
    * The `CheckboxListTile`'s `value` MUST be `_filteredTodos[index].isCompleted`.
    * The `CheckboxListTile`'s `onChanged` MUST call `_toggleTodoStatus(index)`. (Note: You will need to find the *original index* of the item from the `_todos` list, as the `index` from `itemBuilder` is for the *filtered* list).