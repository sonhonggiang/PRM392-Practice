import 'package:flutter_test/flutter_test.dart';
import 'package:book_reader_app/main.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    await tester.pumpWidget(const BookReaderApp());
    expect(find.text('Thư Viện Sách'), findsOneWidget);
  });
}
