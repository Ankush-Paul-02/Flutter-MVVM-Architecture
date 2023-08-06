import 'package:flutter_mvvm/data/network/base_api_services.dart';
import 'package:flutter_mvvm/data/network/network_api_service.dart';
import 'package:flutter_mvvm/res/app_urls.dart';

class AuthRepository {
  final BaseApiService _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
