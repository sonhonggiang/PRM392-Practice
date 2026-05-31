import 'package:flutter/material.dart';
import 'screens.dart';

void main() {
  runApp(const BookReaderApp());
}

class BookReaderApp extends StatelessWidget {
  const BookReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
      ),
      home: const BookListScreen(),
    );
  }
}
