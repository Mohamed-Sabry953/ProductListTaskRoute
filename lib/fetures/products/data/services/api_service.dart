
import 'package:dio/dio.dart';
import 'package:task1_rout/core/utilis/api_constance.dart';

class ApiService {
   final Dio _dio;

  ApiService(this._dio);


  Future<Map<String, dynamic>> get({required String url}) async {
    var response = await _dio.get(url);
    return response.data;
  }
}
