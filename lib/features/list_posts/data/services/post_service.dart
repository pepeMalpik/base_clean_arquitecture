import 'package:posts_app/core/networking/api_path.dart';
import 'package:posts_app/core/networking/http_client.dart';
import 'package:posts_app/features/list_posts/domain/entities/post.dart';
import 'package:posts_app/features/list_posts/domain/services/post_service_interface.dart';

class PostService implements PostServiceInterface {
  @override
  Future<List<Post>> fetchPosts() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_posts));
    return postFromJson(response);
  }
}
