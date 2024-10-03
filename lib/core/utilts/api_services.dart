import 'package:dio/dio.dart';
class ApiServices {
  final _baseUrl ="https://api.exchangerate-api.com/v4/latest/";
  final Dio dio =Dio();
  Future<Map<String,dynamic>> get({required String endPoint})async{
    Response response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
