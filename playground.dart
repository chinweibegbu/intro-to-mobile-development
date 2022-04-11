import 'dart:convert'; // Used for converting datatypes
import 'dart:core'; // DEFAULT
import 'dart:io'; // Used to import input and output functionalities

class Person {
  // Instance variables
  String? name;
  int? age;
  late final username; // Use the keyword "late" to allow the definition of this
  static const String planet = 'Earth';

  // Default constructor
  Person(String name, int age, final username) {
    this.name = name;
    this.age = age;
    this.username = username;
  }

  // Shortened and named constructor
  Person.unknown(
      [this.name = 'John Doe',
      this.age = 25,
      this.username = 'default_username']);

  // Method
  void showPerson() {
    print('This is a ' +
        this.age.toString() +
        '-year old person named ' +
        this.name.toString() +
        ' a.k.a. ' +
        this.username +
        '.');
  }
}

class Member {
  // Instance variables
  String? name;
  int? age;

  // Default constructor
  Member(String name, int age) {
    this.name = name;
    this.age = age;
  }

  // Getters and Setters
  String get password => (this.name ?? "Name") + this.age.toString();
  set password(String pass) => this.password = pass;

  // Method
  void showMember() {
    print('This is a ' +
        this.age.toString() +
        '-year old Ashesi community member named ' +
        this.name.toString() +
        '.');
  }
}

class Student extends Member {
  String? role;

  // Default constructor using parent constructor
  Student(String name, int age, this.role) : super(name, age);

  // Method overwriting
  @override
  void showMember() {
    super.showMember();
    print((this.name ?? 'Name') + ' is a ' + this.role.toString() + '.');
  }
}

void main() {
  dataTypes();
  breaker();

  io();
  breaker();

  operations();
  breaker();

  controlStructures("Julia");
  breaker();

  collections();
  breaker();

  print('2 squared is ' + square(2).toString());
  print('2 squared is ' + shorterSquare(2.5).toString());
  breaker();

  print('10 + 2 = ' + positionalSum(10, 2).toString());
  print('10 + 2 = ' + namedSum(10, num2: 2).toString());
  print('10 + DEFAULT = ' + namedSum(10).toString());
  print('10 + DEFAULT = ' + optionalSum(10).toString());
  breaker();

  var person1 = Person("Chinwe", 20, 'cheebebu');
  /*
    -- DO NOT UNCOMMENT --
    person1.username = 'new_username';   > runtime error
    person1.planet = 'Mars'              > compile-time error
    print(person1.planet);               > compile-time error
  */
  person1.showPerson();
  miniBreaker();

  var person2 = Person.unknown();
  person2.showPerson();
  miniBreaker();

  var student = Student('Isioma', 21, 'student');
  student.showMember();
  breaker();
}

// Input and Output
io() {
  stdout.writeln('What is your name: ?');
  String? name = stdin.readLineSync(); // ? - Nullable

  // String interpolation
  print('My name is $name');
}

dataTypes() {
  /*
   Static data types int, double, String, bool
  */
  int amount1 = 100;
  var amount2 = 200;

  print('Amount1: $amount1 | Amount2: $amount2');

  double dAmount1 = 100.11;
  var dAmount2 = 200.22;

  print('dAmount1: $dAmount1 | dAmount2: $dAmount2');

  bool isTrue1 = true;
  var isTrue2 = false;

  print('isTrue1: $isTrue1 | isTrue2: $isTrue2');

  String singleLine = '\nThis is a single line String in Dart!';
  String multiLine = '''
  This is a multiline
  chunk in Dart!
  ''';
  print(singleLine);
  print(multiLine);

  /*
   Other types: dynamic, const
  */
  dynamic weakVariable = 100;
  print('weakVariable: $weakVariable');
  weakVariable = "New data type";
  print('New weakVariable: $weakVariable');

  const pi = 3.14159;
  print('Constant value of pi: $pi');

  // pi = 3.1414; > Won't compile

  /*
   Type Conversion using parse()
  */
  // String > int
  var one = int.parse('1');
  print('Parsed integer: ' + one.toString());

  // String > double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1,
      'The parsed double is NOT equal to the direct double.');

  // double > String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
}

operations() {
  // Arithmetic operators
  print('5 + 2 = ' + (5 + 2).toString());
  print('5 - 2 = ' + (5 - 2).toString());
  print('5 * 2 = ' + (5 * 2).toString());
  print('5 / 2 = ' + (5 / 2).toString());
  print('5 modulo 2 = ' + (5 % 2).toString());
  miniBreaker();

  // Comparison operators
  print('5 == 2: ' + (5 == 2).toString());
  print('5 != 2: ' + (5 != 2).toString());
  print('5 <= 2: ' + (5 <= 2).toString());
  print('5 >= 2: ' + (5 >= 2).toString());
  miniBreaker();

  // Logical operators
  print('true AND false: ' + (true && false).toString());
  print('false OR true: ' + (false || true).toString());
  miniBreaker();

  // Null operators

  // FIX!!
  // var person = Person(); // You do NOT need to assign on definition
  // int age = person?.age;
  // print(age);

  var a; // a can be null
  var b = 5;
  a ??= 3;
  a ??= b; // a will NOT get re-assigned to b as it is no longer null

  try {
    assert(a == 5); // a should be equal to 3, NOT 5
  } on AssertionError {
    print('a is NOT equal to 5');
  }

  print(null ?? 12); // Evaluates to the second if the first is null
  miniBreaker();

  // Ternary operator
  int number = 100;
  var result =
      number % 2 == 0 ? 'even' : 'odd'; // exdcute if true : execute if false
  print('$number is an $result number.');
}

controlStructures(name) {
  if (name.length < 3) {
    print('Name is short');
  } else if (name.length >= 3 && name.length < 10) {
    print('Name is average');
  } else {
    print('Name is long');
  }

  switch (name) {
    case 'Julia':
      print('We\'ve been waiting for you, Julia.');
      break;
    default:
      print('We don\'t know you');
  }

  miniBreaker();

  // While loop
  var current = 1;
  while (current <= 5) {
    print(current);
    current++;
  }

  miniBreaker();

  // Standard for loop
  for (var i = 1; i <= 5; i++) {
    if (i == 3) {
      print('I shan\'t print 3');
      continue;
    }
    print(i);
  }
  miniBreaker();

  // For...in loop
  var numbers = [100, 101, 102];
  for (var n in numbers) {
    print(n);
  }
  miniBreaker();

  // forEach loop
  // This is using an "anonymous function"
  numbers.forEach((n) => print('Current: $n'));
}

collections() {
  // List
  List names = ['Hephzibah', 'Wamaitha', 'Lindiwe'];

  print('List length: ' +
      (names.length).toString() +
      ' | Last element: ' +
      names[names.length - 1]);
  miniBreaker();

  var mixedTypes = [100, true, 'blue'];
  mixedTypes.forEach((element) => print(element));
  miniBreaker();

  // Make statically-typed using the <> notation e.g. List <int>
  List<int> constantNumbers = const [1, 2, 3];
  constantNumbers.forEach((element) => print(element));
  miniBreaker();

  // Set: Unordered collection of unique elements
  var halogens = {'fluorine', 'chlorine', 'chlorine'};
  halogens.forEach(
      (element) => print(element)); // Chlorine is only added to the set once

  // Defining an empty set
  var emptySet = <String>{};
  Set<String> emptySet2 = {};

  // Map: Collection of key-value pairs
  var gifts = {'Daby': 'tattoo', 'Didi': 'Stray Kids concert tickets'};

  gifts.forEach((key, value) => print('$key > $value'));
  gifts['Mother'] = 'weights';

  // Defining an empty map
  var emptyMap = {};
}

// FUNCTIONS
// The keyword 'dynamic' allows the return type be dynamic
dynamic square(var num) {
  return num * num;
}

// Arrow functions
dynamic shorterSquare(var num) => num * num;

// Function with positional parameters arguments
dynamic positionalSum(var num1, var num2) => num1 + num2;

// Function with named parameters
// NOTE: Named parameters are automatically optional
dynamic namedSum(var num1, {var num2}) => num1 + (num2 ?? 0);

// Functional with optional positional parameters
// Note the second way of defining a default value
dynamic optionalSum(var num1, [var num2 = 0]) => num1 + num2;

// Helper function
breaker() {
  print('\n--------------------------------\n');
}

miniBreaker() {
  print('\n');
}
