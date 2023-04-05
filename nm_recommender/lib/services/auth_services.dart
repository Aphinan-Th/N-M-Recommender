import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nm_recommender/model/auth-model.dart';
import 'package:nm_recommender/model/tmdb-model.dart';

Future loginService(String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/v1/auth/login');
  final headers = {'Content-Type': 'application/json'};
  final data = {'Email': email, 'Password': email};
  final jsonBody = jsonEncode(data);

  try {
    final response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      print('Data posted successfully ${response.body}');
      final token = loginTokenFromJson(response.body);
      return token;
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Network error occurred. Error: $e');
  }
  return null;
}

Future signUpService(String username, String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/v1/auth/sign-up');
  final headers = {'Content-Type': 'application/json'};
  final data = {'Username': username, 'Email': email, 'Password': email};
  final jsonBody = jsonEncode(data);

  try {
    final response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      print('Data posted successfully ${response.body}');
      final token = signUpFromJson(response.body);
      return token;
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Network error occurred. Error: $e');
  }
  return null;
}

Future getUser(String token) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/v1/auth/me/$token');
  final headers = {'Authorization': 'Bearer <token>'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = userIdFromJson(response.body);
      return data;
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Network error occurred. Error: $e');
  }
  return null;
}
