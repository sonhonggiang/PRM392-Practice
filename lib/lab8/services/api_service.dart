import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Function to fetch posts from the API
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts (Status Code: ${response.statusCode})');
      }
    } catch (e) {
      // Catch network errors or parsing errors
      throw Exception('Mất kết nối internet hoặc lỗi máy chủ: $e');
    }
  }
}
