void main(){
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  print('--------');
  var names1 = <String>{};
  Set<String> names2 = {}; // this works too
  // var names3 = {}; // this creates a Map, not a Set

  names1.add("Khoirotun Nisa'");
  names1.add("2341720057");

  names2.addAll({"Khoirotun", "2341720057"});

  print(names1);
  print(names2);
  // print(names3);
}