import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
  // String url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);
  print('status = ${response.statusCode}');
  print('response = ${response.body}');
}