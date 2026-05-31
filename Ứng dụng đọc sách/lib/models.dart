class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String coverUrl;
  final List<Chapter> chapters;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.coverUrl,
    required this.chapters,
  });
}

class Chapter {
  final String id;
  final String title;
  final String content;

  Chapter({
    required this.id,
    required this.title,
    required this.content,
  });
}

class Bookmark {
  final String bookId;
  final String chapterId;
  final String bookTitle;
  final String chapterTitle;
  final DateTime timestamp;

  Bookmark({
    required this.bookId,
    required this.chapterId,
    required this.bookTitle,
    required this.chapterTitle,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'chapterId': chapterId,
        'bookTitle': bookTitle,
        'chapterTitle': chapterTitle,
        'timestamp': timestamp.toIso8601String(),
      };

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        bookId: json['bookId'],
        chapterId: json['chapterId'],
        bookTitle: json['bookTitle'],
        chapterTitle: json['chapterTitle'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
