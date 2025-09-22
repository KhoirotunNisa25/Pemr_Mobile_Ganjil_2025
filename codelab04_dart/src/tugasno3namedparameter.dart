// named parameter
void mahasiswa({required String nama, required int nim}) {
  print("Nama: $nama, NIM: $nim");
}

void main() {
  mahasiswa(nama: "Khoirotun Nisa", nim: 2341720057);
}
