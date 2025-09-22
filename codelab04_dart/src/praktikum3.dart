void main() {
  var gifts = {
    // key = value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2
  };

  print(gifts);
  print(nobleGases);

  print('-----------------');
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['nama'] = 'Khoirotun Nisa';
  gifts['NIM'] = '2341720057';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[19] = 'Khoirotun Nisa';
  nobleGases[20] = '2341720057';

  mhs1['nama'] = 'Khoirotun Nisa';
  mhs1['NIM'] = '2341720057';
  mhs2[1] = 'Khoirotun Nisa';
  mhs2[2] = '2341720057';

  print(mhs1);
  print(mhs2);
  print(gifts);
  print(nobleGases);
}