import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';

void main() async {
  var url = Uri.https(SITE, PATH);
  var response = await http.get(url);

  Map<String, dynamic> data = jsonDecode(response.body);
  print('userId: ${data['userId']}');
  print('title: ${data['title']}');
  print('complete: ${data['completed']}');
}