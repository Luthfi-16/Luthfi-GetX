import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:belajar_getx/app/services/post_service-getx.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  //TODO: Implement PostsController
  var albums = <Album>[].obs;
  RxBool isLoading = true.obs;

  // final PostService _service = PostService();
  final GetConnect getConnect = GetConnect();

  Future<List<Album>> fetchPosts() async {
    final response =
        await getConnect.get("https://jsonplaceholder.typicode.com/albums");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching post");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => Album.fromJson(e)).toList();
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
      albums.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
