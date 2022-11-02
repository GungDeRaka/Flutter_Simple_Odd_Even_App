import 'dart:io';

void main() {
  String? s = stdin.readLineSync();
  int angka = 0;
  try{
    if(s != null){
      angka = int.parse(s);
    }
    print("$angka merupakan ${(angka % 2 == 0)? "angka Genap": "angka Ganjil"}");
  }on Exception {print("Inputan harus berupa angka!");
  main();
  }

}