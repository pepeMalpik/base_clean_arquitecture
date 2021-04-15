import 'package:posts_app/features/list_posts/domain/entities/post.dart';

abstract class PostServiceInterface {
  Future<List<Post>> fetchPosts();
}
