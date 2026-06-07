void main() {
  String greeting = 'I\'m Sơn\n24 tuổi';
  print(greeting.runtimeType);
  print(greeting);

  int age = 21;
  String nameAge = 'Sơn, $age tuổi';
  print(nameAge);

  bool check = true;
  print(check.runtimeType);
  print(check);

  String strAge = age.toString();
  print(strAge.runtimeType);
  print(strAge);

  String year = '2026';
  int intYear = int.parse(year);
  print(intYear.runtimeType);
  print(intYear);
}
