import 'package:get_it/get_it.dart';
import 'package:posts_app/features/list_posts/data/repositories/post_repository.dart';
import 'package:posts_app/features/list_posts/data/services/post_service.dart';
import 'package:posts_app/features/list_posts/domain/repositories/post_repository_interface.dart';
import 'package:posts_app/features/list_posts/domain/services/post_service_interface.dart';
import 'package:posts_app/features/list_posts/domain/user_cases/fetch_posts_uc.dart';
import 'package:posts_app/features/list_posts/presentation/providers/post_provider.dart';

final sl = GetIt.instance;

void init() {
  //- providers
  sl.registerLazySingleton(() => PostProvider(fetchPostsUC: sl()));

  //- usercases
  sl.registerLazySingleton(() => FetchPostsUC(postRepository: sl()));

  //- repositories
  sl.registerLazySingleton<PostRepositoryInterface>(
      () => PostRepository(postService: sl()));

  //- services
  sl.registerLazySingleton<PostServiceInterface>(() => PostService());
}
