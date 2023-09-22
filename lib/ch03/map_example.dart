void main() {
  Map<int, String> intMap = {
    0: 'aaa',
    50: 'bbb',
    100: 'ccc'
  };
  print('intMap is $intMap');
  print('intMap[50]: ${intMap[50]}');
  intMap.update(50, (val) => 'DDD');

  Map<String, Student> students = {
    'jake': Student('Jake', 'Warton', 'jake@gmail.com'),
    'tony': Student('Tony', 'Stark', 'tony@gmail.com'),
    'kent': Student('Kent', 'Beck', 'kent@gmail.com'),
  };

  String fullName =
    (students['jake씹새끼']?.firstName??'') + ' ' +
    (students['jake']?.lastName??'');
  print('jake\'s full name is $fullName');

  String email = students['kent']!.email;
  print('Kent\'s email is $email');

}
class Student {
  String firstName;
  String lastName;
  String email;

  Student(this.firstName, this.lastName, this.email);
}
