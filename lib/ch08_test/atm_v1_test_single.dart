import 'package:test/test.dart';

import '../ch03/atm_v1.dart';

void main() {
  test('계좌 생성 테스트', () {
    String accountName = '111-222-3';
    int amount = 20000;

    Account account = Account(accountName, amount);

    expect(account.accountNumber, equals(accountName));
    expect(account.balance, equals(amount));
  });
}