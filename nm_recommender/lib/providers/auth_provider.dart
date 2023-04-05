import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  String _token = "";
  String _email = "";
  String _username = "";
  String get email => _email;
  String get username => _username;
  String get token => _token;

  void login(email, password) async {
    try {
      final response = await loginService(email, password);
      _token = response.accessToken;
      notifyListeners();
      debugPrint(_token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signUp(username, email, password) async {
    try {
      final response = await signUpService(username, email, password);
      _token = response.token;
      _email = response.email;
      _username = response.username;
      notifyListeners();
      debugPrint(_token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getUserInfo(userId) async {
    try {
      final response = await getUser(userId);
      _token = response.token;
      _email = response.email;
      _username = response.username;
      notifyListeners();
      debugPrint(_token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() {
    _token = "";
  }
}
