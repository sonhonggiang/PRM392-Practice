import 'package:flutter/material.dart';
import '../services/sqlite_helper.dart';
import '../services/shared_prefs_service.dart';

class NotesScreen extends StatefulWidget {
  final bool initialDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const NotesScreen({
    super.key,
    required this.initialDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final SqliteHelper _dbHelper = SqliteHelper();
  final TextEditingController _noteController = TextEditingController();
  List<Map<String, dynamic>> _notes = [];
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
    _refreshNotes();
  }

  // Refresh the list from SQLite
  Future<void> _refreshNotes() async {
    final data = await _dbHelper.getNotes();
    setState(() {
      _notes = data;
    });
  }

  // Add a new note
  Future<void> _addNote() async {
    if (_noteController.text.trim().isEmpty) return;

    await _dbHelper.insertNote(_noteController.text);
    _noteController.clear();
    _refreshNotes();
  }

  // Delete a note
  Future<void> _deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage - Lab 9'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
              widget.onThemeToggle(_isDarkMode);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Input Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      hintText: 'Nhập ghi chú...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addNote,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Thêm'),
                ),
              ],
            ),
          ),

          const Divider(),

          // List Section
          Expanded(
            child: _notes.isEmpty
                ? const Center(child: Text('Chưa có ghi chú nào.'))
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          title: Text(note['content']),
                          subtitle: Text(
                            'ID: ${note['id']} • ${note['created_at'].toString().substring(0, 10)}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () => _deleteNote(note['id']),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
