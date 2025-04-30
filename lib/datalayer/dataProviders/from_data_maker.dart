import 'package:dio/dio.dart';

class FormDataMaker {
  static FormData mapToFormData(Map<String, dynamic> data) {
    return FormData.fromMap(data);
  }
}
