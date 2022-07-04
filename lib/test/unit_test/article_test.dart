import 'package:flutter_test/flutter_test.dart';
import 'package:nrental/repository/article_respository.dart';
import 'package:nrental/response/article_response.dart';

void main() {
  late ArticleRepository articleRepository;
  setUp(() {
    articleRepository = ArticleRepository();
  });
  test("Vehicle Get", () async {
    bool expectedResult = true;
    bool actualResult = false;
    ArticleResponse? artticleRes = await articleRepository.getArticles();
    if (artticleRes != null) actualResult = artticleRes.success!;
    expect(expectedResult, actualResult);
  });
}
