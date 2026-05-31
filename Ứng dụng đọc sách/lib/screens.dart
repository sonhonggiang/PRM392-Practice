import 'package:flutter/material.dart';
import 'models.dart';
import 'data.dart';
import 'services.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thư Viện Sách'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookmarksScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mockBooks.length,
        itemBuilder: (context, index) {
          final book = mockBooks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.network(book.coverUrl, width: 50, height: 75, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, size: 50)),
              title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(book.author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChapterListScreen(book: book)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChapterListScreen extends StatelessWidget {
  final Book book;

  const ChapterListScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(book.description, style: const TextStyle(fontStyle: FontStyle.italic)),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('Mục lục', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: book.chapters.length,
              itemBuilder: (context, index) {
                final chapter = book.chapters[index];
                return ListTile(
                  title: Text(chapter.title),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReaderScreen(book: book, chapterIndex: index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReaderScreen extends StatefulWidget {
  final Book book;
  final int chapterIndex;

  const ReaderScreen({super.key, required this.book, required this.chapterIndex});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final BookmarkService _bookmarkService = BookmarkService();
  bool _isBookmarked = false;

  Chapter get currentChapter => widget.book.chapters[widget.chapterIndex];

  @override
  void initState() {
    super.initState();
    _checkBookmarkStatus();
  }

  Future<void> _checkBookmarkStatus() async {
    final status = await _bookmarkService.isBookmarked(widget.book.id, currentChapter.id);
    if (mounted) {
      setState(() {
        _isBookmarked = status;
      });
    }
  }

  Future<void> _toggleBookmark() async {
    if (_isBookmarked) {
      await _bookmarkService.removeBookmark(widget.book.id, currentChapter.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã xóa dấu trang')),
        );
      }
    } else {
      final bookmark = Bookmark(
        bookId: widget.book.id,
        chapterId: currentChapter.id,
        bookTitle: widget.book.title,
        chapterTitle: currentChapter.title,
        timestamp: DateTime.now(),
      );
      await _bookmarkService.saveBookmark(bookmark);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã thêm dấu trang')),
        );
      }
    }
    _checkBookmarkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentChapter.title),
        actions: [
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          currentChapter.content,
          style: const TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: widget.chapterIndex > 0
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReaderScreen(
                            book: widget.book,
                            chapterIndex: widget.chapterIndex - 1,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text('Chương trước'),
            ),
            TextButton(
              onPressed: widget.chapterIndex < widget.book.chapters.length - 1
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReaderScreen(
                            book: widget.book,
                            chapterIndex: widget.chapterIndex + 1,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text('Chương sau'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final BookmarkService _bookmarkService = BookmarkService();
  List<Bookmark> _bookmarks = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final list = await _bookmarkService.getBookmarks();
    setState(() {
      _bookmarks = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dấu Trang')),
      body: _bookmarks.isEmpty
          ? const Center(child: Text('Chưa có dấu trang nào'))
          : ListView.builder(
              itemCount: _bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = _bookmarks[index];
                return ListTile(
                  title: Text(bookmark.chapterTitle),
                  subtitle: Text(bookmark.bookTitle),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _bookmarkService.removeBookmark(bookmark.bookId, bookmark.chapterId);
                      _loadBookmarks();
                    },
                  ),
                  onTap: () {
                    // Navigate to reader (for simplicity, we just find the book in mock data)
                    final book = mockBooks.firstWhere((b) => b.id == bookmark.bookId);
                    final chapterIndex = book.chapters.indexWhere((c) => c.id == bookmark.chapterId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReaderScreen(book: book, chapterIndex: chapterIndex),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
