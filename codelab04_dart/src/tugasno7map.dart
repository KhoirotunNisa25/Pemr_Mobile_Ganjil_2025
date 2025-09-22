// map

Map<String, dynamic> getProfile() {
  return {'nama': 'Khoirotun', 'umur': 21};
}

void main() {
  var profile = getProfile();
  print(profile['nama']);
  print(profile['umur']);
}
