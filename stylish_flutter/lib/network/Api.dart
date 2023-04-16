import 'package:dio/dio.dart';

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    // var dio = Dio(BaseOptions(
    //   baseUrl: 'https://api.appworks-school.tw/api/1.0',
    // ));

    return Dio();
  }
}
