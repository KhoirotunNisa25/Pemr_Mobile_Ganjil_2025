// Dikembalikan sebagai nilai dari function lain
Function buatSapa(String nama) {
  return () => print("Halo, $nama!");
}

void main() {
  var sapaNisa = buatSapa("Khoirotun");
  sapaNisa(); 
}
