// default parameter
void greet(String nama, {String pesan = "Selamat datang"}) {
  print("Hai $nama, $pesan");
}

void main() {
  greet("Khoirotun");
  greet("Nisa", pesan: "Semoga sukses!");
}
