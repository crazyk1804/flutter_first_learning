void main() {
  String getHttp(String url, {int port=8080}) {
    return 'get http from $url, port = $port';
  }

  int addNumber(int num, [int inc = 1]) => num + inc;

  String addPrefix(String str, String prefix) => '$prefix$str';
  String addSuffix(String str, String suffix) => '$str$suffix';

  int _getBigger(int a, int b) => (a>b) ? a : b;


  int a = 100;
  int b = 200;
  int c= _getBigger(a, b);
  print('_getBigger(a, b) = $c');

  String str = 'apple';
  String addBrace = addSuffix(addPrefix(str, '('), ')');
  print(addBrace);

  int num1 = 100;
  int num2 = addNumber(100);
  int num3 = addNumber(100, 20);

  String http1 = getHttp('http://naver.com', port: 80);
  String http2 = getHttp('http://localhost');
  print(http1);
  print(http2);
}