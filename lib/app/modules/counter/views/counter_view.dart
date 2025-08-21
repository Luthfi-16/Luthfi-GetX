import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card untuk angka counter
            Obx(
              () => Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Text(
                    controller.count.toString(),
                    style: TextStyle(
                      fontSize: 40 + controller.count.value.toDouble(),
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol tambah & kurang
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "btnKurang",
                  onPressed: () => controller.kurang(),
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.remove, size: 30),
                ),
                const SizedBox(width: 30),
                FloatingActionButton(
                  heroTag: "btnTambah",
                  onPressed: () => controller.tambah(),
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
