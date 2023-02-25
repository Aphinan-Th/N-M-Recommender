import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getMoviePopular() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/tmdb-movie-popular'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to fetch data');
  }
}
