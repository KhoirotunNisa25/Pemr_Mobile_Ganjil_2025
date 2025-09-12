| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |


# Praktikum 1: Menerapkan Control Flows ("if/else")
## Langkah 1-2: 
    <pre> ```
    void main() {
        String test = "test2";
        if (test == "test1") {
            print("Test1");
        } else if (test == "test2") {
            print("Test2");
        } else {
            print("Something else");
        }

        if (test == "test2") print("Test2 again");
    }   
    ```</pre>
    Program tersebut memeriksa nilai variabel test yang berisi "test2". Karena cocok dengan kondisi if (test == "test2"), maka program mencetak "Test2". Setelah itu, ada pengecekan lagi dengan if satu baris yang juga benar, sehingga program mencetak "Test2 again"
    ![Langkah 1](./img/praktikum1/langkah1.png)
## Langkah 3:
    <pre>```
    String test = "true";
    if (test) {
        print("Kebenaran");
    }
    ```</pre>
    Program akan eror, karena terjadi duplikat variabel 'test', Kemudian if hanya menerima nilai bool, bukan String. Jadi "true" sebagai teks1 tidak bisa langsung dipakai sebagai kondisi.
    ![Langkah 3](./img/praktikum1/langkah3.png)
    Yang harus dilakukan adalah dengan mengubah nama variabel yang berisi value String "true".  test1 == "true" menghasilkan nilai bool (true atau false) yang valid untuk kondisi if.
    <pre>```
    String test1 = "true";
    if (test1 == "true") {
        print("Kebenaran");
    }
    ```</pre>
    ![Langkah 3 Perbaikan](./img/praktikum1/langkah3-perbaikan.png)
# Praktikum 2: Menerapkan Perulangan "while" dan "do-while"
## Langkah 1-2
    <pre>```
    while (counter < 33) {
        print(counter);
        counter++;
    }
    ```</pre>
    Terjadi error karena belum ada inisialiasi variabel di awal. 
    ![Langkah 1](./img/praktikum2/Langkah1.png)
    Kode Perbaikan:
    <pre>```
    void main() {
    int counter = 0;  // Langkah 2: Inisialisasi variabel 
        while (counter < 33) {
            print(counter);
            counter++;
        }
    }
    ```</pre>
    Ketika sudah diperbaiki, maka program akan mencetak angka mulai dari nilai awal counter (misalnya 0, jika sudah didefinisikan sebelumnya) sampai 32. Begitu counter menjadi 33, kondisi tidak lagi terpenuhi dan perulangan berhenti.
    ![Langkah 2](./img/praktikum2/Langkah2.png)
## Langkah 3
    <pre>```
    do {
        print(counter);
        counter++;
    } while (counter < 77);
    ```</pre>
    Kode akan melanjutkan mencetak angka mulai dari nilai awal counter (counter = 33) sampai 76 (Ketika kondisi tidak lagi terpenuh, counter < 77)
    ![Langkah 3](./img/praktikum2/Langkah3.png)
# Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"
## Langkah 1-2
    <pre>```
    void main() {
        for (Index = 10; index < 27; index) {
        print(Index);
        }
    }
    ```</pre>
    Program akan error karena variabel index belum di inisialisasi tipe data di awal.
    ![Langkah 1](./img/praktikum3/Langkah1.png)
    Perbaikan kode:
    <pre>```
    void main() {
        for (int index = 10; index < 27; index++) { // Langkah 2 inisialisasi variabel dengan tipe data
        print(index);
        }
    }
    ```</pre>
    Program akan mencetak variabel index mulai dari 10 (karena di beri nilai 10 di awal) sampai kondisi < 27, yaitu 26
    ![Langkah 2](./img/praktikum3/Langkah2.png)
## Langkah 3
    <pre>```
    void main() {
        for (int index = 10; index < 27; index++) { // Langkah 2 inisialisasi variabel dengan tipe data
            if (index == 21) break;
            else if (index > 1 && index < 7) continue;
            print(index);
        }
    }
    ```</pre>
    Kode tersebut menjalankan perulangan for dari 10 hingga kurang dari 27. Setiap nilai index dicetak ke layar, kecuali jika index bernilai 21 maka perulangan dihentikan dengan break. Kondisi continue tidak pernah terpenuhi karena index selalu lebih besar dari 7. Hasil akhirnya, program menampilkan angka 10 sampai 20.
    ![Langkah 3](./img/praktikum3/Langkah3.png)
# Tugas Praktikum
    <b>Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.</b>
    Kode:
    <pre>```
    void main() {
        String nama = "Khoirotun Nisa'";
        String nim = "2341720057";
        for (int i = 2; i <= 201; i++) {
            int j;
            for (j = 2; j <= i / 2; j++) {
                if (i % j == 0) {
                    break; 
                }
            }

            if (j > i / 2) { // artinya tidak ketemu pembagi
                print(" $i | $nama | $nim");
            }
        }
    }
    ```</pre>
    Program tersebut menggunakan dua perulangan untuk menentukan bilangan prima dari 2 hingga 201 tanpa memakai variabel boolean. Perulangan luar (i) berjalan dari 2 sampai 201, sedangkan perulangan dalam (j) mencoba semua kemungkinan pembagi dari 2 hingga setengah dari nilai i. Jika ditemukan j yang membagi habis i (i % j == 0), maka perulangan dalam dihentikan dengan break, menandakan bahwa i bukan bilangan prima. Namun, jika perulangan dalam selesai tanpa break, berarti tidak ada bilangan yang dapat membagi i selain 1 dan dirinya sendiri, sehingga i dianggap bilangan prima. Kondisi ini dideteksi dengan memeriksa apakah nilai j lebih besar dari i/2. Setiap kali angka prima ditemukan, program mencetak bilangan tersebut bersama nama lengkap dan NIM.
    ![Tugas](./img/tugas1.png)
    ![Tugas](./img/tugas2.png)
