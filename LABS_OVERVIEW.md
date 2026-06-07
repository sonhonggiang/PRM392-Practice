# PRM393 Labs Overview

## 📚 Labs Structure

This workspace contains **2 comprehensive labs** for PRM393 course:

```
D:\PRM393_Hoc lieu\New folder\
├── Lab1/                          # Flutter Labs
│   ├── README.md                  # Detailed lab instructions
│   ├── lab1_main.dart             # Custom UI code example
│   └── CHECKLIST.md               # Submission checklist
│
├── Lab2/                          # Dart Essentials
│   ├── lab2_dart_essentials.dart  # All 5 exercises in one file
│   └── README.md                  # How to run and what's included
│
├── bin/                           # Sample Dart code
│   ├── main.dart                  # Reference example
│   └── prm393_dart_demo.dart      # Demo program
│
├── FLUTTER_INSTALL.md             # Flutter setup guide (THIS FILE)
├── pubspec.yaml                   # Project configuration
└── README.md                       # Main overview
```

---

## 🎯 Lab 1: Flutter Setup & First App

**Status**: Requires Flutter Installation (see FLUTTER_INSTALL.md)

### Objectives
- Install Flutter SDK & configure IDE
- Create and run first Flutter app
- Customize UI with Flutter widgets
- Understand hot reload
- Answer reflection questions

### Exercises
1. **Exercise 1**: Flutter Environment Setup
   - Install Flutter SDK
   - Add to PATH
   - Run `flutter doctor`
   - **Deliverables**: 2 screenshots

2. **Exercise 2**: Create & Run First App
   - Create project `hello_flutter_lab1`
   - Explore project structure
   - Run on device/emulator
   - Use hot reload
   - **Deliverables**: 3 screenshots

3. **Exercise 3**: Customize UI
   - Modify `main.dart` with custom widgets
   - Add colors, buttons, layout
   - Use hot reload for changes
   - **Deliverables**: Custom UI screenshot + code

4. **Exercise 4**: Reflection Questions
   - Answer 5 conceptual questions
   - **Deliverables**: Written answers

### How to Start Lab 1
```powershell
# First, install Flutter (see FLUTTER_INSTALL.md)
flutter --version

# Then follow exercises in Lab1/README.md
```

---

## ✅ Lab 2: Dart Essentials (READY TO RUN)

**Status**: ✅ Complete & Tested

### Objectives
Master Dart fundamentals through 5 focused exercises

### Exercises (All in ONE file: `lab2_dart_essentials.dart`)

1. **Exercise 1**: Basic Syntax & Data Types
   - Variables: `int`, `double`, `String`, `bool`
   - String interpolation
   - `runtimeType` property

2. **Exercise 2**: Collections & Operators
   - Lists, Sets, Maps
   - Operators: `+`, `-`, `==`, `&&`, `??`
   - Indexing and accessing values

3. **Exercise 3**: Control Flow & Functions
   - if/else and switch statements
   - for, for-in, forEach loops
   - Normal and arrow function syntax

4. **Exercise 4**: Intro to OOP
   - Class definition and properties
   - Constructor (regular & named)
   - Inheritance and method overriding

5. **Exercise 5**: Async & Null Safety
   - `async`/`await` with `Future`
   - Null-safety operators: `??`, `!`
   - Streams with `yield`

### How to Run Lab 2

```powershell
# Navigate to Lab2
cd Lab2

# Run the Dart program
dart lab2_dart_essentials.dart

# Or from parent folder
dart Lab2/lab2_dart_essentials.dart
```

### Expected Output
Program runs and prints results for all 5 exercises showing:
- Variable types and values
- Collection operations
- Control flow results
- OOP behavior
- Async/await completion
- Stream values

---

## 🚀 Quick Start Guide

### For Lab 2 (Start here - no setup needed!)
```powershell
cd Lab2
dart lab2_dart_essentials.dart
```

### For Lab 1 (Requires Flutter)
1. Follow **FLUTTER_INSTALL.md** first
2. Then read **Lab1/README.md** for exercises
3. Use **Lab1/lab1_main.dart** as reference code
4. Check **Lab1/CHECKLIST.md** for submission requirements

---

## 📋 Submission Checklist

### Lab 2 (Dart Essentials)
- [ ] Run `lab2_dart_essentials.dart` successfully
- [ ] Save output screenshot
- [ ] Submit single .dart file or zipped folder
- [ ] Optional: Written explanations of each exercise

### Lab 1 (Flutter)
- [ ] All screenshots from 4 exercises
- [ ] Modified `main.dart` showing custom UI
- [ ] Answers to 5 reflection questions
- [ ] Project folder (zipped) or GitHub link

---

## 🔧 System Requirements

### Minimum
- Windows 10 or later
- 4GB RAM
- 2.5GB free disk space
- Any code editor (VS Code, Android Studio, etc.)

### For Lab 2 (Dart Only)
- ✅ Dart SDK (already installed)
- Any terminal
- No IDE needed (but VS Code recommended)

### For Lab 1 (Flutter)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code with plugins
- Android emulator or connected device
- Internet connection

---

## 📚 Learning Path

### Recommended Order
1. **Start with Lab 2** (Dart Essentials)
   - Learn Dart fundamentals
   - Can run immediately
   - Foundation for understanding Flutter

2. **Then do Lab 1** (Flutter Setup)
   - Apply Dart knowledge to UI
   - Build cross-platform apps
   - Learn Flutter widgets

---

## 🆘 Troubleshooting

### Lab 2 Issues

**Error: "Command 'dart' not found"**
- Dart SDK not properly installed
- Add to PATH or restart terminal

**Error: "Compilation error"**
- Check syntax in the .dart file
- Make sure no modifications were made incorrectly

### Lab 1 Issues

See **FLUTTER_INSTALL.md** for common Flutter issues

---

## 📞 Support Resources

- **Official Dart Docs**: https://dart.dev
- **Official Flutter Docs**: https://flutter.dev
- **Stack Overflow**: Tag with `flutter` or `dart`
- **GitHub Issues**: flutter/flutter or dart-lang/sdk

---

## 📝 Notes

- Lab 2 is **completely ready to run** after Dart installation
- Lab 1 requires **additional Flutter SDK installation** (see guide)
- Both labs include **working code examples** that can be modified and experimented with
- All exercises are **self-contained** and can be completed independently

---

**Good luck with your PRM393 labs! 🎓**
