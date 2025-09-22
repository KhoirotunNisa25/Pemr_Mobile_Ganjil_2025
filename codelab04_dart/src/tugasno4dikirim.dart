// Dikirim sebagai parameter ke function lain
void jalankan(Function aksi) {
  aksi(); // eksekusi function yang diterima
}

void halo() {
  print("Halo dari fungsi lain!");
}

void main() {
  jalankan(halo); // kirim function sebagai argumen
}
