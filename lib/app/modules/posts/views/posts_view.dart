import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:belajar_getx/app/modules/posts/views/posts_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  final PostsController controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts (GetX + GetConnect)"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.posts.isEmpty) {
          return Center(
            child: Text("No Posts available"),
          );
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Get.to(() => PostsDetailView(post: post));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
