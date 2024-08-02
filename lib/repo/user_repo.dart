import 'dart:convert';
import 'dart:io';
import 'package:blocexample/api_model/user_model.dart';
import 'package:blocexample/utils/api_service.dart';

class UserRepo {
  final ApiService _apiService = ApiService();

  Future<List<User>> fetchUser() async {
    print("Fetching users from API...");
    try {
      final response = await _apiService.getUsers();
      print("API response received: ${response.statusCode}");
      if (response.statusCode == 200) {
        // Check if response.data is already a List
        final body = response.data is List
            ? response.data as List
            : json.decode(response.data) as List;

        print("Decoding JSON response...");
        return body.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch users: ${response.statusCode}");
      }
    } on SocketException {
      print("SocketException: No Internet connection");
      throw Exception("Socket error: No Internet connection");
    } catch (e) {
      print("Exception: $e");
      throw Exception("Failed to fetch users: $e");
    }
  }
}
