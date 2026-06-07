# Lab 1 - Setting Up Flutter and Running Your First App

## Objective
Set up Flutter environment and run first Flutter application with UI customization.

---

## Exercise 1: Flutter Environment Setup

### Goal
Install and verify Flutter tools.

### Steps

1. **Download Flutter SDK**
   - Visit: https://flutter.dev/docs/get-started/install
   - Download Flutter SDK for Windows
   - Extract to a folder (e.g., `C:\flutter`)

2. **Add Flutter to PATH**
   - Press `Win + X` → System
   - Go to: Settings → System → About → Advanced system settings
   - Click "Environment Variables"
   - Add `C:\flutter\bin` to PATH

3. **Run flutter doctor**
   ```powershell
   flutter doctor
   ```
   - Verify all items show ✓
   - Install Android SDK if needed
   - Install Dart plugin in IDE

4. **Verify Installation**
   - Check Flutter version: `flutter --version`
   - Check Dart version: `dart --version`

### Deliverables
- [ ] Screenshot of `flutter doctor` output (all ✓)
- [ ] Screenshot of Flutter/Dart plugin in Android Studio or VS Code

---

## Exercise 2: Create and Run Your First Flutter App

### Goal
Create a Flutter project and run the default counter app.

### Steps

1. **Create Flutter Project**
   ```powershell
   flutter create hello_flutter_lab1
   cd hello_flutter_lab1
   ```

2. **Explore Project Structure**
   - `lib/` - Dart code (where you write UI)
   - `android/` - Android native code
   - `ios/` - iOS native code
   - `pubspec.yaml` - Project configuration & dependencies
   - `main.dart` - Entry point

3. **Start Emulator or Connect Device**
   ```powershell
   # List available devices
   flutter devices
   
   # Run on device/emulator
   flutter run
   ```

4. **Modify Title in main.dart**
   - Find the line: `title: 'Flutter Demo Home Page',`
   - Change to: `title: 'My First Flutter App',`
   - Save file

5. **Use Hot Reload**
   - Press `r` in terminal (or click "Hot Reload")
   - Observe title change without restarting app

### Deliverables
- [ ] Screenshot of project structure in file explorer
- [ ] Screenshot of running counter app on device/emulator
- [ ] Screenshot showing updated title via Hot Reload

---

## Exercise 3: Customize Your First Flutter UI

### Goal
Build a simple custom UI with widgets.

### Steps

1. **Replace Code in main.dart**
   - Replace the MyHomePage widget with custom UI (see Exercise 3 code file)
   - Use widgets: Scaffold, AppBar, Column, Row, Text, Button

2. **Use Flutter Widgets**
   - `Scaffold` - Basic app structure
   - `AppBar` - Top bar
   - `Column/Row` - Layout
   - `ElevatedButton` - Button
   - `Text` - Display text

3. **Hot Reload & Test**
   - Press `r` to hot reload
   - Modify colors/text and reload again
   - Observe changes in real-time

4. **Customize**
   - Change colors using `Color(0xFF...)` or named colors
   - Change text and font sizes
   - Add padding/spacing with `Padding` widget

### Deliverables
- [ ] Screenshot of custom UI running
- [ ] Modified main.dart file (included as lab1_main.dart)

---

## Exercise 4: Reflection Questions

Answer these questions in a separate document:

1. **What is the purpose of the `flutter doctor` command?**
   - It checks your development environment setup
   - Verifies Flutter SDK, Dart, Android Studio, emulator, plugins
   - Shows any missing dependencies or configuration issues

2. **What file acts as the entry point of a Flutter application?**
   - `main.dart` in the `lib/` folder
   - Contains `void main()` function
   - Calls `runApp()` to start the app

3. **Explain the difference between Hot Reload and Hot Restart.**
   - **Hot Reload**: Injects updated code while keeping app state
     - Faster, good for UI changes
     - Doesn't reinitialize the app
   - **Hot Restart**: Restarts the app completely, resets state
     - Slower but clears all data
     - Use for larger changes

4. **How does `runApp()` build the widget tree?**
   - `runApp()` takes a Widget and makes it the root of the widget tree
   - Calls `build()` method on widgets recursively
   - Flutter engine renders the resulting widget tree to screen

5. **Describe how Flutter's architecture enables cross-platform development.**
   - Flutter uses Dart, which compiles to native code for both Android & iOS
   - Provides unified UI framework across platforms
   - Single codebase runs on Android, iOS, Web, Windows, Linux, macOS
   - Uses platform channels for native code when needed

---

## Submission Checklist

- [ ] Flutter environment fully set up (`flutter doctor` ✓)
- [ ] Completed Exercise 1: screenshots of setup
- [ ] Completed Exercise 2: screenshots of running app & hot reload
- [ ] Completed Exercise 3: custom UI working
- [ ] Completed Exercise 4: reflection questions answered
- [ ] All files zipped or GitHub link provided

---

## Quick Commands Reference

```powershell
# Check environment
flutter doctor

# Create new project
flutter create project_name

# Run app
flutter run

# Run with release mode
flutter run --release

# Build APK (Android)
flutter build apk

# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get
```

## Important Notes

- First run takes longer as Flutter builds the app
- Keep emulator running or device connected during `flutter run`
- Hot Reload works for Dart code changes (not native code)
- Press `q` in terminal to quit running app
