// Lexical Closure
Function buatPenghitung() {
  var hitung = 0;

  return () {
    hitung++;
    return hitung;
  };
}

void main() {
  var counter1 = buatPenghitung();
  print(counter1()); // 1
  print(counter1()); // 2
  print(counter1()); // 3

  var counter2 = buatPenghitung();
  print(counter2()); // 1 (mulai hitungan baru)
}
