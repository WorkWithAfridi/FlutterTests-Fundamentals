import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserRepository {
  final http.Client client;
  UserRepository(this.client);
  Future<List<User>> fetchUsers() async {
    final response = await client.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
