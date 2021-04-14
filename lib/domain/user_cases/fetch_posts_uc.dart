import 'package:posts_app/domain/repositories/post_repository_interface.dart';

class FetchPostsUC {
  final PostRepositoryInterface _postRepository;

  FetchPostsUC(this._postRepository);

  run() {
    return _postRepository.fetchPosts();
  }
}
