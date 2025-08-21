import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokoController extends GetxController {
  // Controller untuk input
  final namaBarangC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaC = TextEditingController();

  // Dropdown kategori
  final kategoriList = ["Makanan", "Minuman", "Alat Tulis"];
  var selectedKategori = "".obs;

  // Output / hasil perhitungan
  var totalSebelumDiskon = 0.0.obs;
  var totalSetelahDiskon = 0.0.obs;

  void hitungTotal() {
    int jumlah = int.tryParse(jumlahC.text) ?? 0;
    double harga = double.tryParse(hargaC.text) ?? 0.0;

    totalSebelumDiskon.value = jumlah * harga;

    if (totalSebelumDiskon.value >= 100000) {
      totalSetelahDiskon.value = totalSebelumDiskon.value * 0.9; // diskon 10%
    } else {
      totalSetelahDiskon.value = totalSebelumDiskon.value;
    }
  }

  void resetForm() {
    namaBarangC.clear();
    jumlahC.clear();
    hargaC.clear();
    selectedKategori.value = "";
    totalSebelumDiskon.value = 0;
    totalSetelahDiskon.value = 0;
  }

  @override
  void onClose() {
    namaBarangC.dispose();
    jumlahC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
