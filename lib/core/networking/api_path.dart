enum APIPath {
  fetch_album,
  fetch_posts,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_album:
        return "/albums/1";
      case APIPath.fetch_posts:
        return "/posts";
      default:
        return "";
    }
  }
}
