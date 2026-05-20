import 'dart:async';
import 'dart:convert';

// ==========================================
// Exercise 1: Product Model & Repository
// ==========================================
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price)';
}

class ProductRepository {
  final List<Product> _products = [
    Product(id: 1, name: 'Laptop', price: 999.99),
    Product(id: 2, name: 'Mouse', price: 29.99),
  ];

  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  // Future to get all products
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    return _products;
  }

  // Stream for real-time updates
  Stream<Product> liveAdded() => _controller.stream;

  // Add a new product and emit to stream
  void addProduct(Product product) {
    _products.add(product);
    _controller.sink.add(product);
  }

  void dispose() {
    _controller.close();
  }
}

// ==========================================
// Exercise 2: User Repository with JSON
// ==========================================
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Factory constructor to parse JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email']);
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

class UserRepository {
  // Simulate fetching JSON data from an API
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network payload

    String jsonString = '''
    [
      {"name": "Alice", "email": "alice@example.com"},
      {"name": "Bob", "email": "bob@example.com"}
    ]
    ''';

    List<dynamic> parsedList = jsonDecode(jsonString);
    return parsedList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

// ==========================================
// Exercise 5: Factory Constructors & Cache
// ==========================================
class Settings {
  // Private constructor
  Settings._internal();

  // Internal singleton instance
  static final Settings _instance = Settings._internal();

  // Factory constructor returning the singleton instance
  factory Settings() {
    return _instance;
  }
}

// ==========================================
// Main Function to execute all exercises
// ==========================================
void main() async {
  print('--- Exercise 1: Product Model & Repository ---');
  final productRepo = ProductRepository();

  // Listen to the stream
  productRepo.liveAdded().listen((product) {
    print('>> Live Update: New product added: $product');
  });

  // Fetch all products
  print('Fetching all products...');
  List<Product> products = await productRepo.getAll();
  print('All products: $products');

  // Add a new product to trigger the stream
  productRepo.addProduct(Product(id: 3, name: 'Keyboard', price: 49.99));

  // Give stream time to process
  await Future.delayed(Duration(milliseconds: 100));

  print('\n--- Exercise 2: User Repository with JSON ---');
  final userRepo = UserRepository();
  print('Fetching users from JSON...');
  List<User> users = await userRepo.fetchUsers();
  print('Users parsed: $users');

  print('\n--- Exercise 3: Async + Microtask Debugging ---');
  print('Starting execution block...');

  // Event queue
  Future(() => print('Future 1: Event Queue'));

  // Microtask queue
  scheduleMicrotask(() => print('Microtask 1: Microtask Queue'));

  // Event queue
  Future(() => print('Future 2: Event Queue'));

  // Microtask queue
  scheduleMicrotask(() => print('Microtask 2: Microtask Queue'));

  print('Ending execution block (Synchronous)');

  // Explanation: Microtasks run before event callbacks because the Dart event loop
  // empties the microtask queue entirely before it handles any events from the event queue.
  await Future.delayed(Duration(milliseconds: 100));

  print('\n--- Exercise 4: Stream Transformation ---');
  // Create a stream of numbers 1-5
  Stream<int> numbersStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  numbersStream
      .map((num) => num * num) // Transform values to their squares
      .where((square) => square % 2 == 0) // Filter even numbers
      .listen((evenSquare) {
        print('Filtered Even Square: $evenSquare');
      });

  await Future.delayed(Duration(milliseconds: 100));

  print('\n--- Exercise 5: Factory Constructors & Cache ---');
  Settings s1 = Settings();
  Settings s2 = Settings();

  print('Are s1 and s2 the exact same instance? ${identical(s1, s2)}');
  // It will be true because of the factory singleton pattern.

  // Clean up
  productRepo.dispose();
}
