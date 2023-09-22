void main() {
  int num = 99;
  num += 1;
  print('num = $num');

  const double PIE = 3.14;
  if(PIE >= 3)
    print('PIE greator than 3');

  const String password = '1234';
  String _input = '12345';
  if(_input == password)
    print('success');
  else
    print('failed');

  String _nextInput  = '1234';
  String _loginResult = password == _nextInput ? 'success' : 'try again';
  print(_loginResult);
}