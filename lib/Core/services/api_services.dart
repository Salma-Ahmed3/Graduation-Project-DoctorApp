import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://webapi.runasp.net/api';
  // final _baseUrl = 'https://10.0.2.2:7093/api';

  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> postNoBody({required String endPoint}) async {
    var response = await _dio.post('$_baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> postWithBody(
      {required String endPoint, required dynamic data}) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> delete({required String endpoint}) async {
    var response = await _dio.delete('$_baseUrl$endpoint');
    return response;
  }
}
