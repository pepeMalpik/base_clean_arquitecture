import 'package:flutter/material.dart';
import 'package:posts_app/core/networking/api_response.dart';
import 'package:posts_app/features/list_posts/domain/entities/post.dart';
import 'package:posts_app/features/list_posts/domain/user_cases/fetch_posts_uc.dart';

class PostProvider with ChangeNotifier {
  final FetchPostsUC fetchPostsUC;

  ApiResponse<List<Post>> _posts;
  ApiResponse<List<Post>> get posts => _posts;

  PostProvider({@required this.fetchPostsUC}) {
    _posts = ApiResponse.completed([]);
  }

  fetchPosts() async {
    _posts = ApiResponse.loading('fetching posts...');
    notifyListeners();
    try {
      List<Post> posts = await fetchPostsUC.invoke();
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
