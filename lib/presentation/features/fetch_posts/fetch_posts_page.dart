import 'package:flutter/material.dart';

import 'package:posts_app/domain/entities/post.dart';
import 'package:posts_app/networking/api_response.dart';
import 'package:posts_app/presentation/features/fetch_posts/widgets/emply_list.dart';
import 'package:posts_app/presentation/features/fetch_posts/widgets/posts_list.dart';
import 'package:posts_app/presentation/providers/post_provider.dart';
import 'package:provider/provider.dart';

class FetchPostsPage extends StatefulWidget {
  @override
  _FetchPostsPageState createState() => _FetchPostsPageState();
}

class _FetchPostsPageState extends State<FetchPostsPage> {
  PostProvider _postProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      body: SafeArea(child: _renderMain()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download_outlined),
        onPressed: () {
          _postProvider.fetchPosts();
        },
      ),
    );
  }

  Widget _renderMain() {
    switch (_postProvider.posts.status) {
      case Status.COMPLETED:
        return _renderSuccess(posts: _postProvider.posts.data);

        break;
      case Status.ERROR:
        return _renderFailure();
        break;
      case Status.LOADING:
      default:
        return _renderLoading();
        break;
    }
  }

  Widget _renderLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _renderSuccess({List<Post> posts}) {
    if (_postProvider.posts.data.length <= 0) {
      return EmplyList();
    } else {
      return Container(
        child: PostsList(posts: posts),
      );
    }
  }

  Widget _renderFailure() {
    return Container(
      child: Center(
        child: Text('Upsss ha ocurrido un error...'),
      ),
    );
  }
}
