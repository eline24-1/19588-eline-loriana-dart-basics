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

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Loriana Eline';
  print('$fullName has ${countVowels(fullName)} vowels');

  print(initials(fullName));
  print(initials(' ana uwase '));
  print('[${initials(' ')}]');
}
