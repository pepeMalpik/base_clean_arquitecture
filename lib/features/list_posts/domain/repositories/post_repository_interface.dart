import 'package:posts_app/features/list_posts/domain/entities/post.dart';

abstract class PostRepositoryInterface {
  Future<List<Post>> fetchPosts();
}
