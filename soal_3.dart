String isBalanced(String input) {
  // Stack untuk menyimpan bracket buka
  List<String> stack = [];

  // Peta untuk pasangan bracket buka dan tutup
  Map<String, String> brackets = {')': '(', ']': '[', '}': '{'};

  for (int i = 0; i < input.length; i++) {
    String char = input[i];

    // Jika karakter adalah bracket buka, tambahkan ke stack
    if (brackets.containsValue(char)) {
      stack.add(char);
    }
    // Jika karakter adalah bracket tutup
    else if (brackets.containsKey(char)) {
      // Cek apakah stack kosong atau elemen teratas tidak sesuai dengan pasangan
      if (stack.isEmpty || stack.removeLast() != brackets[char]) {
        return "NO";
      }
    }
  }

  // Jika stack kosong setelah loop, maka bracket seimbang
  return stack.isEmpty ? "YES" : "NO";
}

void main() {
  print(isBalanced("{[()]}")); // Output: YES
  print(isBalanced("{[(])}")); // Output: NO
  print(isBalanced("{(([])[[]])[[]]}")); // Output: YES
}
