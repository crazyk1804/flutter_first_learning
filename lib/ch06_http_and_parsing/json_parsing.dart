import 'dart:convert';

const String header = '''
  {
    "errorMessage":
      {
        "status": 200,
        "code": "INFO-000",
        "message": "정상 처리되었습니다.",
        "link": "",
        "developerMessage": "",
        "total": 4,
        "sub_obj": {
          "a": 1,
          "b": 2
        }
      }
  }
''';

void main() {
  var parsed = jsonDecode(header);
  Map<String, dynamic> errorMessage = parsed['errorMessage'];

  print('status: ${errorMessage['status']}');
  print('code: ${errorMessage['code']}');
  print('message: ${errorMessage['message']}');
  print('total: ${errorMessage['total']}');
  var sub_obj = errorMessage['sub_obj'];
  print('sub_obj type id ${sub_obj.runtimeType}');
  print('sub_obj: $sub_obj');
}