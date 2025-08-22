import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:belajar_getx/app/services/post_service-getx.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  //TODO: Implement PostsController
  var posts = <Post>[].obs;
  RxBool isLoading = true.obs;

  // final PostService _service = PostService();
  final GetConnect getConnect = GetConnect();

  Future<List<Post>> fetchPosts() async {
    final response =
        await getConnect.get("https://jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching post");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => Post.fromJson(e)).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      isLoading;
      var result = await fetchPosts();
      posts.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
