import 'atm_v1.dart';

void main() {
  var account = Account('qwerty', 100);

  if(account is Account) {
    String name = account.accountNumber;
    int amount = (account as Account).balance;
    print('account $name amount is $amount');
  }

  Null loginAccount = null;
  String playerName = loginAccount ?? 'Gest';
  print('login player is $playerName');

  Account account2 = Account('222', 4000)
    ..deposit(400)
    ..transfer(account, 1000)
    ..withDraw(500);
  print('account 2 balance is ${account2.balance}');

  Account account3 = Account('what ever', 6000);
  print('account 3 is ${account3?.accountNumber}');
}