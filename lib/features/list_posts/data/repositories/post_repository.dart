import 'package:posts_app/features/list_posts/domain/entities/post.dart';
import 'package:posts_app/features/list_posts/domain/repositories/post_repository_interface.dart';
import 'package:posts_app/features/list_posts/domain/services/post_service_interface.dart';

class PostRepository implements PostRepositoryInterface {
  final PostServiceInterface _postService;

  PostRepository(this._postService);

  @override
  Future<List<Post>> fetchPosts() {
    return _postService.fetchPosts();
  }
}
