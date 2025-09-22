void main() {
  print('-- Langkah 1 --');
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  print('-- Langkah 2 --');
  final list2 = List<dynamic>.filled(5, null);
  list2[1] = "Khoirotun Nisa'";
  list2[2] = "2341720057";
  print(list2.length);
  print('Nama: ${list2[1]}');
  print('NIM: ${list2[2]}');
}