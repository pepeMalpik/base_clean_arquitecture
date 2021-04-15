import 'package:flutter/material.dart';
import 'package:posts_app/injection_container.dart';
import 'package:provider/provider.dart';

import 'features/list_posts/presentation/features/fetch_posts/fetch_posts_page.dart';
import 'features/list_posts/presentation/providers/post_provider.dart';

import 'injection_container.dart' as di;

void main() async {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(create: (_) => sl()),
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
