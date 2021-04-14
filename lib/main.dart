import 'package:flutter/material.dart';
import 'package:posts_app/data/repositories/post_repository.dart';
import 'package:posts_app/data/services/post_service.dart';
import 'package:posts_app/presentation/features/fetch_posts/fetch_posts_page.dart';
import 'package:posts_app/presentation/providers/post_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(PostRepository(PostService())),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'fetch-posts',
        routes: {
          'fetch-posts': (_) => FetchPostsPage(),
        },
      ),
    );
  }
}
