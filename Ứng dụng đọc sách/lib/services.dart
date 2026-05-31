import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

class BookmarkService {
  static const String _key = 'bookmarks';

  Future<List<Bookmark>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? bookmarksJson = prefs.getString(_key);
    if (bookmarksJson == null) return [];

    final List<dynamic> decoded = jsonDecode(bookmarksJson);
    return decoded.map((item) => Bookmark.fromJson(item)).toList();
  }

  Future<void> saveBookmark(Bookmark bookmark) async {
    final bookmarks = await getBookmarks();
    // Check if already bookmarked
    if (bookmarks.any((b) => b.bookId == bookmark.bookId && b.chapterId == bookmark.chapterId)) {
      return;
    }
    bookmarks.add(bookmark);
    await _saveToPrefs(bookmarks);
  }

  Future<void> removeBookmark(String bookId, String chapterId) async {
    final bookmarks = await getBookmarks();
    bookmarks.removeWhere((b) => b.bookId == bookId && b.chapterId == chapterId);
    await _saveToPrefs(bookmarks);
  }

  Future<bool> isBookmarked(String bookId, String chapterId) async {
    final bookmarks = await getBookmarks();
    return bookmarks.any((b) => b.bookId == bookId && b.chapterId == chapterId);
  }

  Future<void> _saveToPrefs(List<Bookmark> bookmarks) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(bookmarks.map((b) => b.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
