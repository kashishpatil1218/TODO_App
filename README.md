
# TODO App with Provider & Shared Preferences  
A simple **TODO application** built with **Flutter** using the **Provider** state management for handling state and **Shared Preferences** for persistent storage of tasks.

## Features  
- **Add, Edit, and Delete Tasks**  
- **Mark Tasks as Completed using Checkboxes**  
- **Light/Dark Mode Toggle**  
- **Persistent Data Storage** using Shared Preferences  
- **State Management** using Provider  

---

  
## Folder Structure  
```bash
lib/
│
├── main.dart               # Entry point of the app
├── models/                 # Contains data models (e.g., Todo)
├── provider/               # Provider classes (HomeProvider, ThemeProvider)
├── screens/                # App screens (HomePage, etc.)
├── utils/                  # Utility files (e.g., global variables)
└── widgets/                # Custom widgets
```

---

## State Management with Provider  
This application uses **Provider** to manage state.  

### HomeProvider – Task Management  
The `HomeProvider` manages the list of tasks, allowing the user to:
- **Add new tasks**
- **Edit existing tasks**
- **Delete tasks**
- **Toggle task completion**  

### ThemeProvider – Theme Management  
The `ThemeProvider` toggles between **Light** and **Dark Mode** using a boolean flag (`isDark`).

---

## Persistent Data with Shared Preferences  
The application saves the list of tasks in **Shared Preferences** to ensure persistence between app sessions.  
**Shared Preferences** stores the data as key-value pairs, and it helps the app to:
- **Persist tasks** between restarts.
- **Save the current theme** (light or dark mode).  

### Shared Preferences Setup Example:  
```dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveTasks(List<String> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('taskList', tasks);
  }

  Future<List<String>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('taskList') ?? [];
  }
}
```

---

## How to Use  
1. **Add a Task:** Press the floating action button and fill in the task details.  
2. **Edit a Task:** Click the edit icon next to a task to modify it.  
3. **Delete a Task:** Use the delete icon to remove a task.  
4. **Toggle Completion:** Check the checkbox to mark a task as completed.  
5. **Switch Theme:** Use the toggle button in the AppBar to switch between Light and Dark Mode.

---

## Dependencies  
- **Flutter:** ^3.x.x  
- **Provider:** ^6.x.x  
- **Shared Preferences:** ^2.x.x  

To install dependencies, add them to your `pubspec.yaml` file:  
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.x.x
  shared_preferences: ^2.x.x
```

# Screenshorts
<div>
  <img src="https://github.com/user-attachments/assets/6f855ed5-8b36-4ba2-bda3-983c5ec841ac"height=500px>
  <img src="https://github.com/user-attachments/assets/4e82bb21-783e-48fd-b635-42aa560ca01e"height=500px>
  <img src="https://github.com/user-attachments/assets/5f033e07-4d6e-432e-868e-593c5f11e35b"height=500px>
  <img src="https://github.com/user-attachments/assets/053aa926-5302-4688-a0b8-689132795d66"height=500px>
  <img src="https://github.com/user-attachments/assets/59636248-2048-4d85-9529-79b89ac1e7be"height=500px>
  <img src="https://github.com/user-attachments/assets/ef22ce66-e22d-4fe1-8f71-53c696c09a84"height=500px>
</div>


https://github.com/user-attachments/assets/07f01b17-8ac2-441d-8f82-462ed9eb8f6e


