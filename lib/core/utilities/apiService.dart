import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiService {
  final _baseUrl = 'http://43.205.98.185:4000/api/v1/';
  final Dio _dio;
  
  ApiService(this._dio) {
    _dio.options.headers = {
    'x-api-key': apiKey,
    };
  }
  
  Future<Map<String,dynamic>> get({
    required String endpoint,
  }) async {
    var response = await _dio.get('$_baseUrl${Intl.getCurrentLocale()}/$endpoint');
    return response.data;
  }
  Future post ({
    required String endpoint,
    Map? data
  }) async{
    var request = await _dio.post('$_baseUrl${Intl.getCurrentLocale()}/$endpoint',data: data);
    return request.data;
  }
}