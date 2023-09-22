import 'package:http/http.dart' as http;
import '../constants.dart';

void main() async {
  var url = Uri.http(METRO_SITE, METRO_PATH);
  print('url is ${url}');
  var response = await http.get(url);
  print('response status is ${response.statusCode}');
  print('response is: ${response.body}');
}


// http://swopenapi.seoul.go.kr/api/aubway/6e466f775168616e363949664b5156/json/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8
// http://swopenAPI.seoul.go.kr/api/subway/6e466f775168616e363949664b5156/json/realtimeStationArrival/0/5/서울