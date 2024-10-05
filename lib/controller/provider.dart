import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_display/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<UserModel> _users = []; // Private list to hold user data

  List<UserModel> get users => _users; // Getter to access user data

  // Fetch users from the API
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/colors')); // Correct API endpoint

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List userdata = data['data']; // Access 'data' in the response

      // Map the JSON data to UserModel objects
      _users = userdata.map((user) => UserModel.fromJson(user)).toList();

      notifyListeners(); // Notify listeners of changes
    } else {
      // Handle the error gracefully
      throw Exception('Failed to load users: ${response.reasonPhrase}'); // Include reason for failure
    }
  }
}
