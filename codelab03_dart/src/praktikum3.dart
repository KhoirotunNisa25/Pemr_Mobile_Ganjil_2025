// Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"

// Langkah 1
void main() {
  for (int index = 10; index < 27; index++) { // Langkah 2 inisialisasi variabel dengan tipe data
    if (index == 21) break; // Langkah 3
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}