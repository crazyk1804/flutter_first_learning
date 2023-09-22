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

  test('계좌 인출 테스트', () {
    String accountName = '111-222-3';
    int amount = 20000;
    int withdraw = 7000;

    Account account = Account(accountName, amount);
    account.withDraw(withdraw);

    expect(account.balance, equals(amount - withdraw));
  });

  test('계좌 입금 테스트', () {
    String accountName = '111-222-3';
    int amount = 20000;
    int deposit = 5000;

    Account account = Account(accountName, amount);
    account.deposit(deposit);

    expect(account.balance, equals(amount + deposit));
  });

  test('계좌 이체 테스트', () {
    String accountName1 = '111-222-3';
    String accountName2 = '222-333-4';
    int amount1 = 20000;
    int amount2 = 30000;
    int moveAmount = 4003;

    Account account1 = Account(accountName1, amount1);
    Account account2 = Account(accountName2, amount2);
    account1.transfer(account2, moveAmount);

    expect(account1.balance, equals(amount1 - moveAmount));
    expect(account2.balance, equals(amount2 + moveAmount));
  });
}