import 'package:belajar_getx/app/modules/toko/views/toko_output_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/toko_controller.dart';

class TokoView extends GetView<TokoController> {
  const TokoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Penjualan Barang"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Nama Barang
            TextField(
              controller: controller.namaBarangC,
              decoration: InputDecoration(
                labelText: "Nama Barang",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Jumlah
            TextField(
              controller: controller.jumlahC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jumlah",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Harga
            TextField(
              controller: controller.hargaC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Harga per Unit",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Kategori
            Obx(() => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Barang",
                    border: OutlineInputBorder(),
                  ),
                  value: controller.selectedKategori.value.isEmpty
                      ? null
                      : controller.selectedKategori.value,
                  items: controller.kategoriList.map((kategori) {
                    return DropdownMenuItem(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedKategori.value = value!;
                  },
                )),
            const SizedBox(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  controller.hitungTotal();
                  Get.to(() => const TokoOutputView());
                },
                child: const Text(
                  "Hitung & Lihat Hasil",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
