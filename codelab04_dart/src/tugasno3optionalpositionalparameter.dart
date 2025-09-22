// optional positional parameter
void sapa(String nama, [String? pesan]) {
  print("Hai $nama");
  if (pesan != null) print("Pesan: $pesan");
}

void main() {
  sapa("Khoirotun");
  sapa("Nisa", "Selamat belajar Dart!");
}
