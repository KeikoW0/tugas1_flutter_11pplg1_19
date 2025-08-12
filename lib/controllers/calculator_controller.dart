import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = "".obs;

  void tambah() {
    int angka1 = int.parse(txtAngka1.text);
    int angka2 = int.parse(txtAngka2.text);

    int hasilJumlah = angka1 + angka2;
    print("hasil tambah " + hasilJumlah.toString());
    hasil.value = hasilJumlah.toString();
  }

  void kurang() {
    int angka1 = int.parse(txtAngka1.text);
    int angka2 = int.parse(txtAngka2.text);

    int hasilKurang = angka1 - angka2;
    print("hasil kurang " + hasilKurang.toString());
    hasil.value = hasilKurang.toString();
  }

  void kali() {
    int angka1 = int.parse(txtAngka1.text);
    int angka2 = int.parse(txtAngka2.text);

    int hasilKali = angka1 * angka2;
    print("hasil kali " + hasilKali.toString());
    hasil.value = hasilKali.toString();
  }

  void bagi() {
    double angka1 = double.parse(txtAngka1.text);
    double angka2 = double.parse(txtAngka2.text);

    if (angka2 != 0) {
      double hasilBagi = angka1 / angka2;
      print("hasil bagi " + hasilBagi.toStringAsFixed(2));
      hasil.value = hasilBagi.toStringAsFixed(
        2,
      ); // hasil 2 angka di belakang koma
    } else {
      hasil.value = "Tidak bisa dibagi 0";
    }
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    hasil.value = "";
  }
}
