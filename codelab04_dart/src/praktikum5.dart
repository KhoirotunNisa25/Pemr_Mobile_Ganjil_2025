(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  print('-- Langkah 1 --');
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  print('-- Langkah 2 --');
  var angka = (1, 2);
  print(angka);
  print(tukar(angka));

  print('-- Langkah 4 --');
  // record type annotation in a variable declaration:
  (String, int) mahasiswa = ("Khoirotun Nisa", 2341720057);
  print(mahasiswa);

  print('-- Langkah 5 --');
  var mahasiswa2 = ('Khoirotun', a: 2341720057, b: true, 'last');
  print(mahasiswa2.$1); // positional field
  print(mahasiswa2.a); // named field
  print(mahasiswa2.b); // named field
  print(mahasiswa2.$2); // positional field
}
