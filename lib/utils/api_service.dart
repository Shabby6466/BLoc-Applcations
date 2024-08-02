import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/users";
  }

  Future<Response> getUsers() async {
    try {
      print("Sending GET request to API...");
      final response = await _dio.get("/");
      print("API response received: ${response.data}");
      return response;
    } catch (e) {
      print("Exception during API call: $e");
      throw Exception("Failed to load Users");
    }
  }
}
