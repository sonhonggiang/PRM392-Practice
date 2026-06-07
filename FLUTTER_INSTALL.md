# Flutter Installation Guide for Windows

## Prerequisites
- Windows 10 or later
- 4GB RAM minimum (8GB recommended)
- 2.5GB free disk space
- Android Studio or VS Code with Flutter/Dart extensions

---

## Step 1: Download Flutter SDK

1. Visit: https://flutter.dev/docs/get-started/install/windows
2. Click **Download Flutter SDK for Windows**
3. Save to a known location (e.g., `Downloads` folder)

---

## Step 2: Extract Flutter

1. Extract the ZIP file to a folder WITHOUT spaces
   - **Good**: `C:\flutter` or `C:\dev\flutter`
   - **Bad**: `C:\Program Files\flutter` (has spaces)

2. After extraction, you'll have:
   ```
   C:\flutter\
   ├── bin\
   ├── packages\
   ├── examples\
   └── ...
   ```

---

## Step 3: Add Flutter to PATH (Important!)

### Method 1: Using GUI (Recommended for beginners)

1. Press **Windows + Pause/Break** to open System
2. Click **Advanced system settings**
3. Click **Environment Variables** button
4. Under "User variables", click **New**
   - Variable name: (skip if editing PATH)
   - Variable value: `C:\flutter\bin`
5. Click **OK**

### Method 2: Direct PATH Edit

1. Press **Windows + X** → **Windows Terminal (Admin)**
2. Run this command (replace path if needed):
   ```powershell
   [Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\flutter\bin", "User")
   ```
3. Restart terminal or restart computer

### Verify PATH Added
```powershell
flutter --version
```
Should show Flutter version, not "command not found"

---

## Step 4: Install Android SDK (for Android development)

### Option A: Using Android Studio (Easiest)

1. Download **Android Studio** from https://developer.android.com/studio
2. Install it (use default settings)
3. Open Android Studio
4. Go to **Tools** → **SDK Manager**
5. Install:
   - Android SDK Platform (latest)
   - Android SDK Build-Tools (latest)
   - Android Emulator
6. Close Android Studio

### Option B: Using Command Line

```powershell
# Accept Android SDK licenses
flutter doctor --android-licenses
# Accept all by typing 'y'
```

---

## Step 5: Configure IDE

### For VS Code

1. Install **VS Code** from https://code.visualstudio.com
2. Open VS Code
3. Install extensions:
   - `Flutter` (by Dart Code)
   - `Dart` (by Dart Code)
4. Reload VS Code

### For Android Studio

1. Open Android Studio
2. Go to **File** → **Settings** → **Plugins**
3. Search and install:
   - Flutter plugin
   - Dart plugin
4. Restart Android Studio

---

## Step 6: Run `flutter doctor`

This is the most important step!

```powershell
flutter doctor
```

Expected output (all items should have ✓):
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.10.0)
[✓] Android toolchain - develop for Android devices
[✓] Android Studio (version 2023.1)
[✓] VS Code
[✓] Connected device (1 available)
```

**If you see ✗ marks:**
- Read the error message carefully
- Follow the suggested fix
- Run `flutter doctor` again to verify

---

## Step 7: Create Your First Flutter App

```powershell
# Create new project
flutter create my_first_app

# Navigate to project
cd my_first_app

# Run on device/emulator
flutter run
```

---

## Troubleshooting

### "flutter: command not found"
- **Solution**: Restart terminal or add C:\flutter\bin to PATH again

### "Android SDK not found"
- **Solution**: 
  ```powershell
  flutter doctor --android-licenses
  ```
  Accept all licenses

### Emulator won't start
- **Solution**: 
  ```powershell
  flutter devices
  # List available devices
  
  emulator -list-avds
  # List emulator images
  
  emulator -avd Pixel_6_API_31
  # Start specific emulator
  ```

### App builds slowly on first run
- **Solution**: This is normal. First build can take 5-10 minutes. Be patient!

### Hot Reload not working
- **Solution**: 
  - Make sure app is still running
  - Press `r` in the terminal, or
  - Click the hot reload icon in IDE

---

## Useful Commands

```powershell
# Check environment
flutter doctor

# List available devices
flutter devices

# Create new project
flutter create project_name

# Run app (debug mode)
flutter run

# Run app (release mode - faster)
flutter run --release

# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Build APK for Android
flutter build apk

# Clean build files
flutter clean
```

---

## Next Steps

1. Complete **Lab 1 - Setting Up Flutter** exercises
2. Build simple UI with Flutter widgets
3. Learn Dart (Lab 2) to understand Flutter code better
4. Explore official Flutter docs: https://flutter.dev/docs

---

## Resources

- **Official Flutter Docs**: https://flutter.dev
- **Flutter Codelabs**: https://flutter.dev/codelabs
- **Dart Language**: https://dart.dev
- **Material Design**: https://material.io/design
- **Stack Overflow**: Tag `flutter`

Good luck! 🚀
