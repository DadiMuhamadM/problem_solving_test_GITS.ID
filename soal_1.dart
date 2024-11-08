import 'dart:io';

void main() {
  print('Masukan Nilai Input: ');

  int? n = int.parse(stdin.readLineSync()!);

  // Memanggil fungsi untuk menghasilkan deret
  String result = lazyCatererSequence(n);
  print("Output: $result");
}

String lazyCatererSequence(int n) {
  List<int> sequence = [];
  for (int i = 0; i < n; i++) {
    int value = (i * (i + 1)) ~/ 2 + 1;
    sequence.add(value);
  }
  return sequence.join("-");
}
