// Disimpan dalam variabel

void sapa(String nama) {
  print("Hai, $nama!");
}

void main() {
  var f = sapa; // simpan function ke variabel
  f("Khoirotun"); // panggil lewat variabel
}
