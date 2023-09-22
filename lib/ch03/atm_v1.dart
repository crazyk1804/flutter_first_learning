void main() {
  Account account1 = new Account("111-222-333", 20000);
  Account account2 = new Account("444-555-666", 5000);

  print('account1 has ${account1.balance}');
  print('account2 has ${account2.balance}');

  account1.withDraw(7000);
  print('account1 has ${account1.balance} won (7000 won is withdrawn)');

  account1.transfer(account2, 5000);
  print('account2 has ${account2.balance} won (5000 won is deposited)');
  print('account1 has ${account1.balance} won');
}

class Account {
  String accountNumber;
  int balance;

  Account(this.accountNumber, this.balance);

  bool withDraw(int amount) {
    if(amount > balance) return false;

    balance -= amount;
    return true;
  }

  bool deposit(int amount) {
    balance += amount;
    return true;
  }

  bool transfer(Account dest, int amount) {
    if(amount>balance) return false;

    balance -= amount;
    dest.deposit(amount);
    return true;
  }

  // double _price;
  //
  // Account(String accountNo, double price) {
  //   _accountNo = accountNo;
  //   _price = price;
  // }
}