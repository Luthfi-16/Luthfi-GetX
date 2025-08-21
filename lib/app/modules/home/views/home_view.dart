import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {"title": "Counter", "icon": Icons.countertops, "route": "/counter"},
      {"title": "Formulir", "icon": Icons.edit_document, "route": "/formulir"},
      {
        "title": "Toko",
        "icon": Icons.store,
        "route": "/toko"
      }, // 🔥 baru ditambah
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Menu'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // jumlah kolom
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => Get.toNamed(item["route"] as String),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item["icon"] as IconData,
                        size: 48,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item["title"] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
