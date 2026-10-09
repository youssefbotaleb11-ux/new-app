import 'package:news_app/core/dio_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/constants.dart';

class NewsService {
  static Future<List<ArticleModel>> getNews({String query = 'technology'}) async {
    try {
      final response = await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': query,
          'apiKey': apiKey,
          'sortBy': 'publishedAt',
        },
      );

      List<ArticleModel> articles = [];
      for (var item in response.data['articles']) {
        articles.add(ArticleModel.fromJson(item));
      }
      return articles;
    } catch (e) {
      print('=========================');
      print('Error fetching news: $e');
      print('=========================');
      return [];
    }
  }
}