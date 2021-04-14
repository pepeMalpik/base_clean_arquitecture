import 'package:posts_app/domain/repositories/post_repository_interface.dart';
import 'package:posts_app/domain/services/post_service_interface.dart';

class PostRepository implements PostRepositoryInterface {
  final PostServiceInterface _postService;

  PostRepository(this._postService);

  @override
  fetchPosts() {
    return _postService.fetchPosts();
  }
}
