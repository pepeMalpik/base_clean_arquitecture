import 'package:flutter/material.dart';
import 'package:posts_app/domain/entities/post.dart';
import 'package:posts_app/domain/repositories/post_repository_interface.dart';
import 'package:posts_app/networking/api_response.dart';

class PostProvider with ChangeNotifier {
  final PostRepositoryInterface _postRepository;
  ApiResponse<List<Post>> _posts;
  ApiResponse<List<Post>> get posts => _posts;

  PostProvider(this._postRepository) {
    _posts = ApiResponse.completed([]);
  }

  fetchPosts() async {
    _posts = ApiResponse.loading('fetching posts...');
    notifyListeners();
    try {
      List<Post> posts = await _postRepository.fetchPosts();
      _posts = ApiResponse.completed(posts);
      notifyListeners();
    } catch (e) {
      print(e);
      print(e.toString());
      _posts = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
