import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/toko_controller.dart';
import 'toko_view.dart';

class TokoOutputView extends GetView<TokoController> {
  const TokoOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Hasil Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Nama Barang: ${controller.namaBarangC.text}"),
                      Text("Kategori: ${controller.selectedKategori.value}"),
                      Text("Jumlah: ${controller.jumlahC.text}"),
                      Text("Harga per Unit: Rp${controller.hargaC.text}"),
                      const Divider(),
                      Text(
                          "Total Sebelum Diskon: Rp${controller.totalSebelumDiskon.value.toStringAsFixed(0)}"),
                      Text(
                          "Total Setelah Diskon: Rp${controller.totalSetelahDiskon.value.toStringAsFixed(0)}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Get.off(() => const TokoView());
                    },
                    child: const Text("Kembali"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () {
                      controller.resetForm();
                      Get.off(() => const TokoView());
                    },
                    child: const Text("Reset Form"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
