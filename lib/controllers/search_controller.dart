import 'package:flutter/cupertino.dart';
import 'package:ramadan_chanllage_1/models/everything_model/everything_model.dart';

import '../repository/repo.dart';

class SearchController extends ChangeNotifier {
  var searchController = TextEditingController();

  Future<EverythingModel> search(String q) async {
    return await Repository.instance.featchEverythingNews(q: q);
  }
}
