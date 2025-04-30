import 'dart:io';
import 'package:flutter_github_cicd/utils/api.dart';
import 'package:dio/dio.dart';
import '../../utils/app_constent.dart';
import '../../utils/secure_service.dart';
import 'dio_interceptor.dart';

class DioService {
  final DioInterceptor dioInterceptor;
  Dio _dio = Dio();
  DioService({required this.dioInterceptor}) {
    _dio = Dio();
    _dio
      ..options.baseUrl = Api.baseUrl
      ..options.connectTimeout = const Duration(seconds: 50)
      ..options.receiveTimeout = const Duration(seconds: 50)
      ..options.headers = {'Content-Type': 'application/json'};
    _dio.interceptors.add(dioInterceptor);
  }

  Future<Response> tokenGenerate({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await _dio.post(urlEndPoint, data: data);
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> postDataForm({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    // var ddd=data;
    var formData = FormData.fromMap(data);
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.post(
        urlEndPoint,
        data: formData,
        options: Options(headers: {'token': token}),
      );
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> getDataWithParams({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.get(
        urlEndPoint,
        data: FormData.fromMap(data),
        options: Options(headers: {'token': token}),
      );
      return response;
    } on DioException catch (ex) {
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> postFormData({
    required String urlEndPoint,
    required FormData data,
  }) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.post(
        urlEndPoint,
        data: data,
        options: Options(headers: {'token': token}),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex.message);
    }
  }

  Future<Response> postData({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.post(
        urlEndPoint,
        data: data,
        options: Options(headers: {'token': token}),
      );
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> postDataWithoutToken({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await _dio.post(urlEndPoint, data: FormData.fromMap(data));
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> postDataWithoutToken1({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await _dio.post(urlEndPoint, data: data);
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> getDataWithOutParams({required String urlEndPoint}) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.get(
        urlEndPoint,
        options: Options(headers: {'token': token}),
      );
      return response;
    } on DioException catch (ex) {
      // If Dio throws an exception but the response is available, return that
      if (ex.response != null) {
        return ex.response!;
      } else {
        // Otherwise return a custom failed Response
        return Response(
          requestOptions: RequestOptions(path: urlEndPoint),
          statusCode: 500,
          statusMessage: ex.message ?? 'Unknown Dio error occurred',
          data: {"error": true, "message": ex.message},
        );
      }
    }
  }

  Future<Response> getDataWithParamsChild({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.get(
        urlEndPoint,
        queryParameters: data,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex.message);
    }
  }

  Future<Response> postDataDownload({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.post(
        urlEndPoint,
        data: data,
        options: Options(
          headers: {'Authorization': "Bearer $token"},
          responseType: ResponseType.bytes,
        ),
      );
      return response;
    } on DioException catch (ex, l) {
      print('error_line:- $l');
      print('error:- $ex');
      throw Exception(ex.message);
    }
  }

  Future<Response> postFormData2({
    required String urlEndPoint,
    required Map<String, dynamic> data,
  }) async {
    var ddd = data;
    var formData = FormData.fromMap(ddd);
    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var response = await _dio.post(
        urlEndPoint,
        data: formData,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex.message);
    }
  }

  Future<Response> postFormDataMain({
    required String urlEndPoint,
    required Map<String, dynamic> data,
    required File file,
    required String fileName,
  }) async {
    Map<String, dynamic> myProcessData = {};
    data.forEach((key, value) {
      myProcessData[key] = value;
    });
    myProcessData[fileName] = await MultipartFile.fromFile(file.path);
    //
    // debugPrint("My_From: $myProcessData");
    // // debugPrint("My_From: ${file.path}");

    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);
      var ddd = FormData.fromMap(myProcessData);
      var response = await _dio.post(
        urlEndPoint,
        data: ddd,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      return response;
    } on DioException catch (ex) {
      return Response(requestOptions: RequestOptions(data: ex.requestOptions));
    }
  }

  Future<Response> uploadDocuments({
    required String urlEndPoint,
    required File file1,
    required File file2,
    required File file3,
    required File file4,
    required File file5,
    required File file6,
    required File file7,
    required File file8,
    required File file9,
    required File file10,
    required File file11,
    required File file12,
    required File file13,
    required File file14,
    required File file15,
    required File file16,
    required File file17,
    required File file18,
    required bool isAddAnotherClicked,
  }) async {
    Map<String, dynamic> myProcessData = {};

    myProcessData["investor_details_id"] = await SecureService()
        .getStringSessionData("tmpInvestorCode");
    myProcessData["investor_photo"] = await MultipartFile.fromFile(file1.path);
    myProcessData["investor_signature"] = await MultipartFile.fromFile(
      file2.path,
    );
    myProcessData["investor_nid_photo"] = await MultipartFile.fromFile(
      file3.path,
    );
    myProcessData["investor_nid_back_photo"] = await MultipartFile.fromFile(
      file4.path,
    );
    myProcessData["investor_cheque_photo"] = await MultipartFile.fromFile(
      file5.path,
    );
    myProcessData["link_bo_photo"] = await MultipartFile.fromFile(file6.path);

    myProcessData["nominee_info_id[0]"] = await SecureService()
        .getStringSessionData("nominee_info_id[0]");
    myProcessData["nominee_photo[0]"] = await MultipartFile.fromFile(
      file11.path,
    );
    myProcessData["nominee_signature[0]"] = await MultipartFile.fromFile(
      file12.path,
    );
    myProcessData["nominee_nid_photo[0]"] = await MultipartFile.fromFile(
      file13.path,
    );
    myProcessData["nominee_nid_back_photo[0]"] = await MultipartFile.fromFile(
      file14.path,
    );

    var jointCheck = await SecureService().getStringSessionData(
      "operationModeTextField",
    );
    if (jointCheck == "2") {
      myProcessData["joint_applicant_photo"] = await MultipartFile.fromFile(
        file8.path,
      );
      myProcessData["joint_applicant_sign"] = await MultipartFile.fromFile(
        file9.path,
      );
      // myProcessData["joint_bo_photo"] = await MultipartFile.fromFile(file3.path);
      myProcessData["joint_applicant_nid"] = await MultipartFile.fromFile(
        file10.path,
      );
      myProcessData["joint_applicant_nid_back"] = await MultipartFile.fromFile(
        file7.path,
      );
    }

    if (isAddAnotherClicked == true) {
      myProcessData["nominee_info_id[1]"] = await SecureService()
          .getStringSessionData("nominee_info_id[1]");
      myProcessData["nominee_photo[1]"] = await MultipartFile.fromFile(
        file15.path,
      );
      myProcessData["nominee_signature[1]"] = await MultipartFile.fromFile(
        file16.path,
      );
      myProcessData["nominee_nid_photo[1]"] = await MultipartFile.fromFile(
        file17.path,
      );
      myProcessData["nominee_nid_back_photo[1]"] = await MultipartFile.fromFile(
        file18.path,
      );
    }

    try {
      var token = await SecureService().getStringSessionData(AppConstant.token);

      var ddd = FormData.fromMap(myProcessData);
      var response = await _dio.post(
        urlEndPoint,
        data: ddd,
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex.message);
    }
  }
}
