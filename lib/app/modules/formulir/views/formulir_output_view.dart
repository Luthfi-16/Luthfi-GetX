import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({super.key});
  final FormulirController formulir = Get.find<FormulirController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Formulir Output'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.deepPurple),
                        title: Text("Nama"),
                        subtitle: Text(
                          formulir.nameController.text,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.book, color: Colors.deepPurple),
                        title: Text("Kursus"),
                        subtitle: Text(
                          formulir.selectedCourses.value,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.calendar_today,
                            color: Colors.deepPurple),
                        title: Text("Tanggal Lahir"),
                        subtitle: Text(
                          formulir.formattedDate,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.wc, color: Colors.deepPurple),
                        title: Text("Gender"),
                        subtitle: Text(
                          formulir.gender.value,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Tombol kembali
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    formulir.onClose();
                    Get.off(() => const FormulirView());
                  },
                  child: const Text(
                    'Kembali',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
