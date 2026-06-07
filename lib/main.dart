import 'package:flutter/material.dart';
// Import các bài Lab để điều hướng
import 'lab4/main.dart' as lab4;
import 'lab5/main.dart' as lab5;
import 'lab6/main.dart' as lab6;
import 'lab7/main.dart' as lab7;
import 'lab8/main.dart' as lab8;
import 'lab9/main.dart' as lab9;
import 'lab10/main.dart' as lab10;

void main() {
  // Mặc định chạy Lab 4 khi khởi động, bạn có thể thay đổi ở đây để test bài khác
  lab4.main();
}

// Hoặc bạn có thể dùng widget Menu này để chọn bài Lab muốn xem
class LabMenuScreen extends StatelessWidget {
  const LabMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PRM392 Lab Menu')),
      body: ListView(
        children: [
          _buildLabTile(context, 'Lab 4: UI Fundamentals', () => lab4.main()),
          _buildLabTile(context, 'Lab 5: Navigation & Detail', () => lab5.main()),
          _buildLabTile(context, 'Lab 6: Responsive Layout', () => lab6.main()),
          _buildLabTile(context, 'Lab 7: Forms & Validation', () => lab7.main()),
          _buildLabTile(context, 'Lab 8: API Integration', () => lab8.main()),
          _buildLabTile(context, 'Lab 9: Local Storage (SQLite)', () => lab9.main()),
          _buildLabTile(context, 'Lab 10: Auth & Notifications', () => lab10.main()),
        ],
      ),
    );
  }

  Widget _buildLabTile(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
