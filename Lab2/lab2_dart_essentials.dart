// Lab 2 - Dart Essentials Practice Lab
// Author: Student
// All 5 exercises in one file

void main() {
  print('========== LAB 2: DART ESSENTIALS ==========\n');

  exercise1();
  print('\n');

  exercise2();
  print('\n');

  exercise3();
  print('\n');

  exercise4();
  print('\n');

  exercise5();
}

// ============ EXERCISE 1: BASIC SYNTAX & DATA TYPES ============
void exercise1() {
  print('--- EXERCISE 1: Basic Syntax & Data Types ---');

  // Declare variables using: int, double, String, bool
  int age = 21;
  double salary = 1500.50;
  String name = 'Sơn';
  bool isStudent = true;

  // Use print() and string interpolation to show values
  print('Name: $name');
  print('Age: $age');
  print('Salary: \$$salary');
  print('Is Student: $isStudent');
  print('Age in 5 years: ${age + 5}');
  print('Salary type: ${salary.runtimeType}');
}

// ============ EXERCISE 2: COLLECTIONS & OPERATORS ============
void exercise2() {
  print('--- EXERCISE 2: Collections & Operators ---');

  // Create a List of integers
  List<int> numbers = [1, 2, 3, 4, 5];
  print('List: $numbers');

  // Use arithmetic & comparison operators
  print('First number: ${numbers[0]}');
  print('Sum: ${numbers[0] + numbers[1]}');
  print('Is 3 in list: ${numbers.contains(3)}');
  print('List length: ${numbers.length}');

  // Create a Set (unique values)
  Set<int> uniqueNumbers = {1, 2, 2, 3, 3, 4};
  print('Set (unique): $uniqueNumbers');

  // Create a Map (key-value)
  Map<String, int> scores = {'Math': 95, 'English': 88, 'Science': 92};
  print('Scores: $scores');
  print('Math score: ${scores['Math']}');

  // Use operators
  List<int> list1 = [1, 2];
  List<int> list2 = [3, 4];
  List<int> combined = [...list1, ...list2];
  print('Combined list: $combined');

  // Ternary operator
  int score = 85;
  String result = score >= 80 ? 'Pass' : 'Fail';
  print('Score $score: $result');
}

// ============ EXERCISE 3: CONTROL FLOW & FUNCTIONS ============
void exercise3() {
  print('--- EXERCISE 3: Control Flow & Functions ---');

  // if/else block to check score
  int score = 75;
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');
  } else {
    print('Grade: F');
  }

  // switch case for day of week
  int dayNum = 3;
  String day;
  switch (dayNum) {
    case 1:
      day = 'Monday';
      break;
    case 2:
      day = 'Tuesday';
      break;
    case 3:
      day = 'Wednesday';
      break;
    case 4:
      day = 'Thursday';
      break;
    case 5:
      day = 'Friday';
      break;
    default:
      day = 'Weekend';
  }
  print('Day: $day');

  // Loop through collection using for
  print('For loop (0-4):');
  for (int i = 0; i < 5; i++) {
    print('  $i');
  }

  // Loop using for-in
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  print('For-in loop:');
  for (String fruit in fruits) {
    print('  - $fruit');
  }

  // forEach loop
  print('ForEach loop:');
  fruits.forEach((fruit) => print('  * $fruit'));

  // Function normal syntax
  print('Function result: ${add(5, 3)}');

  // Arrow syntax function
  print('Arrow function: ${multiply(4, 2)}');
}

// Normal function
int add(int a, int b) {
  return a + b;
}

// Arrow syntax function
int multiply(int a, int b) => a * b;

// ============ EXERCISE 4: INTRO TO OOP ============
void exercise4() {
  print('--- EXERCISE 4: Intro to OOP ---');

  // Create and use Car class
  Car car1 = Car('Toyota', 2020);
  print('Car 1: ${car1.describe()}');

  // Named constructor
  Car car2 = Car.luxury('BMW');
  print('Car 2: ${car2.describe()}');

  // Create subclass ElectricCar
  ElectricCar eCar = ElectricCar('Tesla', 2023, 100);
  print('Electric Car: ${eCar.describe()}');
  print('Battery: ${eCar.battery}%');

  // Override method
  print('Start method (overridden): ${eCar.start()}');
}

// Base class
class Car {
  String brand;
  int year;

  // Constructor
  Car(this.brand, this.year);

  // Named constructor
  Car.luxury(this.brand) : year = 2024;

  String describe() => '$brand ($year)';
  String start() => '$brand is starting...';
}

// Subclass
class ElectricCar extends Car {
  int battery;

  ElectricCar(String brand, int year, this.battery) : super(brand, year);

  // Override method
  @override
  String start() => '$brand is starting silently... Battery: $battery%';
}

// ============ EXERCISE 5: ASYNC, FUTURE, NULL SAFETY & STREAMS ============
Future<void> exercise5() async {
  print('--- EXERCISE 5: Async, Future, Null Safety & Streams ---');

  // Async function with await
  print('Fetching data...');
  String data = await fetchData();
  print('Data: $data');

  // Null safety operators
  String? nullableName = 'Sơn';
  String name = nullableName ?? 'Unknown';
  print('Name with null coalescing: $name');

  String? emptyName = null;
  print('Empty name: ${emptyName ?? 'No name'}');

  // Force unwrap (use carefully!)
  String? forcedName = 'Sơn';
  print('Force unwrapped: ${forcedName!}');

  // Simple Stream
  print('Stream values:');
  await simpleStream().listen((value) {
    print('  Stream value: $value');
  }).asFuture();
}

// Async function with Future
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data loaded successfully!';
}

// Stream of integers
Stream<int> simpleStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}
