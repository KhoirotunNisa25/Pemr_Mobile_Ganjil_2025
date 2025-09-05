// Soal 4 - Null Safety

void main() {
  print('-- Null Safety --');
  String nama = "Nisa"; // Tidak bisa null
  String? panggilan; // Bisa null, karena ada tanda '?'
  panggilan = null; // Tidak error
  print(panggilan); 
  print(nama); 

  print('-- Late Variable --');
  late String name;
  name = "Selamat pagi!";
  print(name); 

  // Jika belum diinisialisasi, akan error:
  late String status;
  // print(status); // Error
}