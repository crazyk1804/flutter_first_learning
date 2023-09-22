void main() {
  Set<int> naturalNumbers = {1, 2, 3, 4, 1};
  Set<String> ids = {"X3", "X2", "X1"};

  print('numbers are $naturalNumbers');
  print('ids are $ids');
  // print('first number is ${naturalNumbers[0]}');

  for(int each in naturalNumbers) {
    print('each number is $each');
  }

  // Set<int> integers = {0} + naturalNumbers;
  Set<int> a = {100, 200, 300};
  Set<int> b = {100, 200, 500, 1000};

  print('a union b = ${a.union(b)}');
  print('a intersection b = ${a.intersection(b)}');
  print('a difference b = ${a.difference(b)}');
}
