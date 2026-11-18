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

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // formatRwf tests
  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(1250000));
  print(formatRwf(-5000));

  // isValidPin tests
  print(isValidPin('12345'));    // false
  print(isValidPin('4821$d'));   // true
  print(isValidPin('77777'));    // false
  print(isValidPin('4821'));     // false
  print(isValidPin('48a21'));    // false
}
