import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:belajar_getx/app/modules/album/views/album_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  final AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums (GetX + GetConnect)"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.albums.isEmpty) {
          return Center(
            child: Text("No Albums available"),
          );
        }
        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(album.title),
                subtitle: Text("User ID : ${album.userId}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Get.to(() => AlbumDetailView(album: album));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
