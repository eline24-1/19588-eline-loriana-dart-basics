// Student: Loriana Eline
// Reg no:  19588
const String regNo = '19588';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by L.E.
  int count = 0;
  String lower = text.toLowerCase();
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by L.E.
  List<String> parts = fullName.split(' ');
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by L.E.
  int row = 1;
  while (row <= height) {
    String ch = (row % 2 == 1) ? '*' : '#';
    String line = '';
    int s = 0;
    while (s < height - row) {
      line += ' ';
      s++;
    }
    int k = 0;
    while (k < row) {
      line += ch;
      k++;
    }
    print(line);
    row++;
  }
}

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

String maskPhone(String phone) {
  // by L.E.
  if (phone.length != 10) {
    return 'INVALID';
  }
  String stars = '';
  int i = 0;
  while (i < phone.length - 5) {
    stars += '*';
    i++;
  }
  return phone.substring(0, 3) + stars + phone.substring(phone.length - 2);
}

String grade(int mark) {
  // by L.E.
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }
  return 'F';
}

bool isPalindrome(String word) {
  // by L.E.
  String w = word.toLowerCase();
  int i = 0;
  while (i < w.length) {
    if (w[i] != w[w.length - 1 - i]) return false;
    i++;
  }
  return true;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Loriana Eline';
  print('$fullName has ${countVowels(fullName)} vowels');

  print(initials(fullName));
  print(initials(' ana uwase '));
  print('[${initials(' ')}]');

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');

  // Part E tests
  print(grade(85));               // A
  print(isPalindrome('level'));   // true
  print(isPalindrome('Level'));   // true
}
