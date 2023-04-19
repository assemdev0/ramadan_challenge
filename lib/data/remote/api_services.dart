import 'package:dio/dio.dart';

import '/data/remote/dio_logger.dart';
import '/data/remote/end_points.dart';
import '/models/top_headlines_model/top_headlines_model.dart';
import '../../models/everything_model/everything_error_model.dart';
import '../../models/everything_model/everything_model.dart';
import '../../models/everything_model/everything_success_model.dart';
import '../../models/top_headlines_model/top_headlines_error_model.dart';
import '../../models/top_headlines_model/top_headlines_success_model.dart';

class ApiServices {
  static ApiServices instance = ApiServices._();
  ApiServices._();

  Future<TopHeadlinesModel> getCategoryNews({
    required String category,
  }) async {
    try {
      Response response = await DioLogger.getDio().get(
        Endpoints.topHeadlines,
        queryParameters: {
          "country": "eg",
          "category": category,
          'pageSize': 100,
        },
      );
      if (response.statusCode == 200) {
        return TopHeadlinesSuccessModel.fromJson(response.data);
      } else {
        return TopHeadlinesErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return TopHeadlinesErrorModel.fromJson(e.response!.data!);
    }
  }

  Future<EverythingModel> getEverythingNews({
    required String q,
  }) async {
    try {
      Response response = await DioLogger.getDio().get(
        Endpoints.everything,
        queryParameters: {
          "q": q,
          'pageSize': 100,
        },
      );
      if (response.statusCode == 200) {
        return EverythingSuccessModel.fromJson(response.data);
      } else {
        return EverythingErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return EverythingErrorModel.fromJson(e.response!.data!);
    }
  }
}
