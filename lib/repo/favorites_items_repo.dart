import 'dart:convert';
import 'dart:io';

import 'package:blocexample/api_model/user_model.dart';
import 'package:blocexample/utils/api_service.dart';

class FavoritesItemsRepo {
  final ApiService _apiService = ApiService();

  Future<List<User>> fetchItems() async {
    try {
      final response = await _apiService.getUsers();
      if (response.statusCode == 200) {
        final body = json.decode(response.data) as List;
        return body.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch users: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("Socket error: No Internet connection");
    } catch (e) {
      throw Exception("Failed to fetch users: $e");
    }
  }
}
