// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Formulir'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Dropdown Kursus
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kursus',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: controller.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedCourses.value = value!;
                  },
                ),
                SizedBox(height: 20),

                // Gender
                Text("Jenis Kelamin",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Obx(() => Column(
                      children: [
                        RadioListTile(
                          title: Text('Laki - Laki'),
                          value: 'Laki - Laki',
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value!;
                          },
                        ),
                        RadioListTile(
                          title: Text('Perempuan'),
                          value: 'Perempuan',
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value!;
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 20),

                // Tanggal Lahir
                Obx(() => TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Icon(Icons.calendar_today,
                            color: Colors.deepPurple),
                      ),
                      controller: TextEditingController(
                        text: controller.formattedDate,
                      ),
                      onTap: () => controller.pickDate(),
                    )),
                SizedBox(height: 30),

                // Tombol Submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.to(FormulirOutputView()),
                    child: Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
