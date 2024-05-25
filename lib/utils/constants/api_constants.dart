class ApiConstants {
  ApiConstants._();

  //Base URL
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  //Get Posts
  static const String post = '/posts';

  //Get Post Details
  static String getPost({required id}) => "/posts/$id";
}
