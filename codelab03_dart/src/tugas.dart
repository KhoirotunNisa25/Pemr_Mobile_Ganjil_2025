void main() {
  String nama = "Khoirotun Nisa'";
  String nim = "2341720057";

  for (int i = 2; i <= 201; i++) {
    int j;
    for (j = 2; j <= i / 2; j++) {
      if (i % j == 0) {
        break; 
      }
    }

    if (j > i / 2) { // artinya tidak ketemu pembagi
      print(" $i | $nama | $nim");
    }
  }
}
