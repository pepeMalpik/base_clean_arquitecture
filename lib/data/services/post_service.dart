import 'package:posts_app/domain/entities/post.dart';
import 'package:posts_app/domain/services/post_service_interface.dart';
import 'package:posts_app/networking/api_path.dart';
import 'package:posts_app/networking/http_client.dart';

class PostService implements PostServiceInterface {
  @override
  fetchPosts() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetch_posts));
    return postFromJson(response);
  }
}
