// Cara membuat return multiple value di Functions menggunakan Record

(String, int) getDataMahasiswa() {
  return ('Khoirotun', 2341720057);
}

void main() {
  var mahasiswa = getDataMahasiswa();
  print(mahasiswa.$1); 
  print(mahasiswa.$2); 
}
