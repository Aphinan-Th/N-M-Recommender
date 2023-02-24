import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  Future getMovieInfo() async {
    try {
      var url = Uri.parse("localhost:8080/user");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var _model = response.body;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}