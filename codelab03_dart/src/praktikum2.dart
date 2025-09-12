// Praktikum 2: Menerapkan Perulangan "while" dan "do-while"

// Langkah 1
void main() {
  int counter = 0;  // Langkah 2: Inisialisasi variabel counter
  while (counter < 33) {
    print(counter);
    counter++;
  }
  print("---");
  // Langkah 3:
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}