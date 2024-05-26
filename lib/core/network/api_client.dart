
abstract class ApiClient {
  Future<dynamic> get(String path, {Map<String, String>? queryParameters});
  Future<dynamic> post(String path, {Map<String, dynamic>? data});
  Future<dynamic> put(String path, {Map<String, dynamic>? data});
  Future<dynamic> delete(String path);
  Future<dynamic> patch(String path, {Map<String, dynamic>? data});
  void addAuthToken(String token);
  void removeAuthToken();
}


