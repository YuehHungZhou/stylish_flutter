import 'package:dio/dio.dart';

import 'Api.dart';
import 'GetProductResponse.dart';

class ApiServise {
  static ApiServise? _instance;

  factory ApiServise() => _instance ??= ApiServise._();

  ApiServise._();

  Future<GetProductResponse?> getMenProducts() async {
    var response;

    try {
      response = await Api()
          .dio
          .get('https://api.appworks-school.tw/api/1.0/products/men');

      print(response);
    } on DioError catch (e) {
      print(e.toString());
    }

    if (response != null) {
      return GetProductResponse.fromJson(response.data);
    }
    return null;
  }

  Future<GetProductResponse?> getWomenProducts() async {
    var response;

    try {
      response = await Api().dio.get('/products/women');
      print(response);
    } on DioError catch (e) {
      print(e.toString());
    }

    if (response != null) {
      return GetProductResponse.fromJson(response.data);
    }
    return null;
  }

  Future<GetProductResponse?> getAccessoriesProducts() async {
    var response;

    try {
      response = await Api().dio.get('/products/accessories');
      print(response);
    } on DioError catch (e) {
      print(e.toString());
    }

    if (response != null) {
      return GetProductResponse.fromJson(response.data);
    }
    return null;
  }

  // Future<void> giveFeedback(GiveFeedbackRequest request) async {
  //   await Api().dio.post('feedback', data: jsonEncode(request.toJson()));
  // }
}
