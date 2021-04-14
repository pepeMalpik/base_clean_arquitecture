import 'package:flutter/material.dart';
import 'package:posts_app/domain/entities/post.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            title: Text('${post.title}'),
          );
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
      ),
    );
  }
}
