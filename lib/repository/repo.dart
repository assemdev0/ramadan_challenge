import 'package:ramadan_chanllage_1/data/remote/api_services.dart';
import 'package:ramadan_chanllage_1/models/top_headlines_model/top_headlines_model.dart';

import '../models/everything_model/everything_model.dart';

class Repository {
  static final Repository instance = Repository._();
  Repository._();

  Future<TopHeadlinesModel> featchCategoryNews({
    String category = "technology",
  }) async =>
      await ApiServices.instance.getCategoryNews(category: category);

  Future<EverythingModel> featchEverythingNews({
    String q = "egypt",
  }) async =>
      ApiServices.instance.getEverythingNews(q: q);
}
