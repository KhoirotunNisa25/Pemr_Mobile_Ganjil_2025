void main() {
  // Anonymous function disimpan di variabel
  var kaliDua = (int x) {
    return x * 2;
  };
  print(kaliDua(5)); // Output: 10

  // Anonymous function langsung dipakai sebagai argumen
  var daftar = [1, 2, 3];
  daftar.forEach((angka) {
    print("Angka: $angka");
  });

  // Versi arrow function (lebih singkat)
  daftar.forEach((angka) => print("Kuadrat: ${angka * angka}"));
}
