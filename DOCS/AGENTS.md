# Giai đoạn 2: Kế hoạch Thi công (Implementation Plan)

Đây là tài liệu chỉ đạo cho AI Code Assist (Agent) để thực hiện việc Refactor ứng dụng Todo sang Riverpod.

## # ROLE & CONTEXT
You are an expert Flutter/Dart developer specializing in **Riverpod 3.0** and **Dart 3.x**.
Your task is to implement the Todo App exactly according to the designs in `PROJECT_BRIEF.md` and `DESIGN_SPEC.md`.

## # CRITICAL RULES (DO NOT IGNORE)
1.  **Folder Structure (Strict Separation):**
    * **Data:** Put data models in `lib/models/`.
    * **Logic:** Put Riverpod providers in `lib/providers/`.
    * **UI:** Put screens in `lib/screens/` and reusable components in `lib/widgets/`.
    * **Entry:** `lib/main.dart` should only contain setup code.
2.  **Modern Dart Syntax:** You MUST use Dart 3 features (Records, Switch Expressions, Arrow syntax).
3.  **Riverpod Standards:** Use `flutter_riverpod`. Use **Manual Definition** (No code generation). Use `Notifier` for mutable state.
4.  **Step-by-Step:** Execute the phases below sequentially. Do not jump ahead.

---

## # EXECUTION PHASES

### Phase 1: Foundation (Data Models)
**Action:** Create files in `lib/models/`.
* Create `lib/models/todo_item.dart`: Implement `TodoItem` class (immutable, `copyWith`).
* Create `lib/models/todo_filter.dart`: Implement `TodoFilter` enum.

### Phase 2: The Engine (State Management)
**Action:** Create files in `lib/providers/`.
* Create `lib/providers/todo_provider.dart`.
* **Goal:** Implement all Providers defined in `DESIGN_SPEC.md` (Section 2) & Logic (Section 3).
* **Tasks:**
    1.  Implement `todosProvider` (`Notifier`).
    2.  Implement `filterProvider` (`StateProvider`).
    3.  Implement `filteredTodosProvider` (`Provider`) using **Switch Expression**.
    4.  Implement `activeCountProvider` (`Provider`).

### Phase 3: The Shell (App Setup)
**Action:** Setup entry point and main screen.
* Rewrite `lib/main.dart`: Wrap `MyApp` in `ProviderScope`.
* Create `lib/screens/todo_screen.dart`: Create the main `TodoScreen` (ConsumerWidget) with a basic `Scaffold` layout (Header, Body, Footer placeholders).

### Phase 4: UI Components & Wiring
**Action:** Create widgets and wire them up.
* **Goal:** Implement UI components defined in `DESIGN_SPEC.md` (Section 4).
* **Tasks:**
    1.  **Input:** Create `lib/widgets/todo_input.dart`. Wire to `todosProvider.notifier.add()`.
    2.  **Filters:** Create `lib/widgets/filter_bar.dart`. Wire to `filterProvider`.
    3.  **Stats:** Create `lib/widgets/stats_counter.dart`. Wire to `activeCountProvider`.
    4.  **List:** Create `lib/widgets/todo_list.dart` and `todo_item_tile.dart`. Wire to `filteredTodosProvider` and `todosProvider.notifier.toggle()`.
    5.  **Final Assembly:** Assemble these widgets into `lib/screens/todo_screen.dart`.

