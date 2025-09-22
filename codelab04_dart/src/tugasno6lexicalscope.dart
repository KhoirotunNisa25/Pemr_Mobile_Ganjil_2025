// Lexical Scope

void main() {
  var nama = "Khoirotun";

  void sapa() {
    print("Halo $nama"); // bisa akses 'nama' karena dalam lexical scope
  }

  sapa(); // Output: Halo Khoirotun
}
