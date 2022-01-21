import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maka_shop/core/exception/server_exception.dart';

import 'logging_interceptor.dart';

const String _baseUrl =
    "https://us-central1-inventory-ts-firestore.cloudfunctions.net/api/";

class ApiBaseHelper {
  Future<Dio> getInstance() async {
    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';

    return Dio(BaseOptions(
      baseUrl: _baseUrl,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      contentType: ContentType.json.toString()
    ))
      ..options.headers = headers
      ..interceptors.addAll([
        LoggingInterceptor.loggingInterceptor(),
      ]);
  }

  Future<Response> get(String url) async {
    try {
      final client = await getInstance();
      return await client.get(url);
    } on DioError catch (e) {
      throw _getDioNetworkException(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> post(String url, {dynamic data}) async {
    try {
      final client = await getInstance();
      return await client.post(url, data: data);
    } on DioError catch (e) {
      throw _getDioNetworkException(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      final client = await getInstance();
      return await client.put(url, data: data);
    } on DioError catch (e) {
      throw _getDioNetworkException(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> delete(String url) async {
    try {
      final client = await getInstance();
      return await client.delete(url);
    } on DioError catch (e) {
      throw _getDioNetworkException(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Exception _getDioNetworkException(DioError dioError) {
    final List<DioErrorType> networkExceptions = [
      DioErrorType.connectTimeout,
      DioErrorType.receiveTimeout,
      DioErrorType.sendTimeout,
    ];

    if (networkExceptions.contains(dioError.type)) {
      return const ServerException("Please check your internet connection");
    } else {
      final response = dioError.response;
      String errorMessage = "Something went wrong...";
      if (response != null && response.data != null) {
        errorMessage = response.data["message"];
      }
      return ServerException(errorMessage);
    }
  }
}
