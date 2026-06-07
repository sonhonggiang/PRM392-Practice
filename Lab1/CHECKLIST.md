# Lab 1 - Submission Checklist

Complete all items below and provide evidence (screenshots).

## Exercise 1: Flutter Environment Setup

- [ ] **Flutter SDK installed**
  - Location: `C:\flutter` (or your chosen path)
  - Screenshot: `flutter --version` output

- [ ] **Flutter added to PATH**
  - Verified: `flutter doctor` works in terminal
  - Screenshot: PATH environment variable showing flutter/bin

- [ ] **Android Studio/VS Code configured**
  - Screenshot: Flutter plugin installed
  - Screenshot: Dart plugin installed

- [ ] **flutter doctor passes**
  - Screenshot: `flutter doctor` output with ✓ marks
  - All critical items must pass

## Exercise 2: Create and Run Your First Flutter App

- [ ] **Project created: `hello_flutter_lab1`**
  - Command: `flutter create hello_flutter_lab1`
  - Screenshot: Project folder structure

- [ ] **Project structure explored**
  - [ ] `lib/` folder shown
  - [ ] `android/` folder shown
  - [ ] `pubspec.yaml` file shown
  - [ ] `main.dart` file shown

- [ ] **App runs on device/emulator**
  - Screenshot: Counter app running
  - Shows default counter app UI
  - Button visible and functional

- [ ] **Title changed in main.dart**
  - Changed: `'Flutter Demo Home Page'` → `'My First Flutter App'`
  - Screenshot: Modified title after hot reload

- [ ] **Hot Reload demonstrated**
  - Screenshot: App with original title
  - Screenshot: App with updated title (after hot reload)
  - Proof: No full restart needed

## Exercise 3: Customize Your First Flutter UI

- [ ] **Custom UI implemented**
  - Replaced default MyHomePage widget
  - Added multiple custom widgets
  - Screenshot: Custom UI running
  - Screenshot: `main.dart` code (modified)

- [ ] **Widgets used correctly**
  - [ ] `Scaffold` for basic structure
  - [ ] `AppBar` with custom title
  - [ ] `Column/Row` for layout
  - [ ] `ElevatedButton` for buttons
  - [ ] `Text` with custom styling
  - [ ] At least one additional custom element

- [ ] **Colors and styling applied**
  - Custom colors for AppBar, buttons, text
  - Proper spacing and padding
  - Screenshot: Styled UI with colors visible

## Exercise 4: Reflection Questions

Answer all questions (1-5):

1. **Purpose of `flutter doctor`**
   - [ ] Answered correctly
   - [ ] Mentions checking environment
   - [ ] Mentions checking dependencies

2. **Entry point file**
   - [ ] Identified `main.dart` correctly
   - [ ] Mentions `void main()` function
   - [ ] Mentions `runApp()`

3. **Hot Reload vs Hot Restart**
   - [ ] Hot Reload explained (keeps state, faster)
   - [ ] Hot Restart explained (resets state, slower)
   - [ ] Use cases mentioned

4. **How `runApp()` builds widget tree**
   - [ ] Explains widget tree concept
   - [ ] Mentions recursive `build()` calls
   - [ ] Mentions rendering to screen

5. **Flutter architecture & cross-platform**
   - [ ] Mentions single codebase
   - [ ] Explains native compilation
   - [ ] Lists supported platforms

---

## Final Submission

- [ ] All exercises completed
- [ ] All screenshots taken and labeled
- [ ] Answers to reflection questions provided
- [ ] Project files organized
- [ ] Files zipped or GitHub link provided

**Total Progress: ___ / 100%**
