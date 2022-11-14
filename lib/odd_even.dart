import 'dart:io';

void main() {
  try {
  int angka = int.parse(stdin.readLineSync().toString());
    print("$angka merupakan ${(angka % 2 == 0) ? "angka Genap" : "angka Ganjil"}");
  } on Exception {
    print("Inputan harus berupa angka!");
    main();
  }
}
