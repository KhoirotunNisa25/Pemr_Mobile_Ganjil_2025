void main() {
  print('-- Langkah 1 --');
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  print('-- Langkah 3 a--');
  var list1 = [1,2,null]; //penambahan deklarasi var
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  print('-- Langkah 3 b --');
  var nim = ['2341720057'];
  var List4 = ['Khoirotun Nisa', ...nim];
  print(List4);

  print('-- Langkah 4 --');
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  promoActive = false;
  var nav2 = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav2);

  print('-- Langkah 5 --');
  var login = 'Manager';
  var nav3 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav3);

  var login2 = 'Guest';
  var nav4 = ['Home', 'Furniture', 'Plants', if (login2 case 'Manager') 'Inventory'];
  print(nav4);

  print('-- Langkah 6 --');
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

}