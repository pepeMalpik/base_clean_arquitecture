import 'package:flutter/material.dart';
import 'package:posts_app/features/list_posts/domain/user_cases/fetch_posts_uc.dart';
import 'package:provider/provider.dart';

import 'features/list_posts/data/repositories/post_repository.dart';
import 'features/list_posts/data/services/post_service.dart';
import 'features/list_posts/presentation/features/fetch_posts/fetch_posts_page.dart';
import 'features/list_posts/presentation/providers/post_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              PostProvider(FetchPostsUC(PostRepository(PostService()))),
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
