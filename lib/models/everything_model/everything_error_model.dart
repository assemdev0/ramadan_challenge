import 'everything_model.dart';

class EverythingErrorModel extends EverythingModel {
  String? status;
  String? code;
  String? message;

  EverythingErrorModel({this.status, this.code, this.message});

  EverythingErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
