void main() {
  int even = 78;
  int odd = 99;
  if(even % 2 == 0)
    print('$even is even number');

  if(odd%2 == 0)
    print('$odd is not even number');
  else
    print('$odd is odd number');

  List<String> fruits = ['Apple', 'Banana', 'Kiwi'];
  for(String fruit in fruits)
    print('fruit is $fruit');

  List<num> numbers = [100, 200, -1];
  int i=0;
  while(numbers[i] > 0)
    print('${numbers[i++]} is positive');

  int j = 5;
  do
    print(j--);
  while(j > 0);

  List<num> httpCodes = [200, 401, 500];
  for(num http in httpCodes) {
    switch (http) {
      case 200:
        print('OK');
        break;
      case 401:
        print('Unauthorized');
        break;
      case 500:
        print('Server Error');
        break;
      case double():
        print('what the fuck is this case?');
      case int():
        print('I don\'t understand this');
    }
  }
}