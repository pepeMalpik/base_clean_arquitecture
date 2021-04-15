import 'package:flutter/material.dart';
import 'package:posts_app/core/usercases/usercase.dart';
import 'package:posts_app/features/list_posts/domain/entities/post.dart';
import 'package:posts_app/features/list_posts/domain/repositories/post_repository_interface.dart';

class FetchPostsUC implements UserCase<List<Post>> {
  final PostRepositoryInterface postRepository;

  FetchPostsUC({@required this.postRepository});

  @override
  Future<List<Post>> invoke() {
    return postRepository.fetchPosts();
  }
}
