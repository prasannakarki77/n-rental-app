import 'package:dio/dio.dart';

// ignore: depend_on_referenced_packages
import 'package:nrental/api/http_services.dart';
import 'package:nrental/response/article_response.dart';
import 'package:nrental/utils/url.dart';

class ArticleAPI {
  Future<ArticleResponse?> getArticles() async {
    Future.delayed(const Duration(seconds: 2), () {});
    ArticleResponse? articleResponse;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(articleUrl);

      if (response.statusCode == 201) {
        print(ArticleResponse());
        print(response.data);

        articleResponse = ArticleResponse.fromJson(response.data);
        print(ArticleResponse());
      } else {
        articleResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }

    return articleResponse;
  }
}