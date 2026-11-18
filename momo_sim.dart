// Student: Loriana Eline
// Reg no:  19588
const String regNo = '19588';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by L.E.
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  // by L.E.
  String sign = '';
  int positive = amount;
  if (amount < 0) {
    sign = '-';
    positive = -amount;
  }
  String digits = positive.toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      result = ',' + result;
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  return sign + result + ' RWF';
}

bool isValidPin(String pin) {
  // by L.E.
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    String ch = pin[i];
    if (ch.compareTo('0') < 0 || ch.compareTo('9') > 0) {
      return false;
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
    }
    j++;
  }
  if (allSame) {
    return false;
  }
  return true;
}

int sendMoney(int balance, int amount) {
  // by L.E.
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by L.E.
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be between 100 and 50,000');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print(isValidPin('12345'));    // false
  print(isValidPin('4821$d'));   // true
  print(isValidPin('77777'));    // false
  print(isValidPin('4821'));     // false
  print(isValidPin('48a21'));    // false

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions, in order
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. My own tests (expected output in comments)
  print(formatRwf(100000));      // 100,000 RWF
  print(formatRwf(-999));        // -999 RWF
  print(formatRwf(1000000));     // 1,000,000 RWF
  print(isValidPin('00000'));    // false (same digit five times)
  print(isValidPin('4821 '));    // false (a space is not a digit) <- might break
}
