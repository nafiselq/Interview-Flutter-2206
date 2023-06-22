import 'dart:convert';

import 'package:flutter_01_test/data/model/article_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/base_url.dart';

class ArticleServices {
  Future<List<ArticleModel>> listArticles() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/articles'),
      );

      if (res.statusCode == 200) {
        return List<ArticleModel>.from(
          jsonDecode(res.body)['articles'].map(
            (articles) => ArticleModel.fromJson(articles),
          ),
        ).toList();
      } else {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
