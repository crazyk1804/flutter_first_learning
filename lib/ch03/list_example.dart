void main() {
  List<int> numbers = [100, 200, 300];
  List<int> evens = [2,4,6,8,10];
  List<String> planets = ['Earth', 'Jupiter', 'Mars', 'Saturn'];
  List<String> otherPlanets = ['Venus', 'Mercury', 'Neptune'];

  print('numbers are $numbers');
  print('first number is ${numbers[0]}');
  print('last number is ${numbers[numbers.length-1]}');

  for(int each in evens) {
    print('each even number is $each');
  }

  List<int> evenFromZero = [0, ...evens];
  List<String> allPlanets = planets + otherPlanets;
  print('All planets are $allPlanets');
}