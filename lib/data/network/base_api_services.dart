abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
