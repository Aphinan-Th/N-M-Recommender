// To parse this JSON data, do
//
//     final loginToken = loginTokenFromJson(jsonString);

import 'dart:convert';

LoginToken loginTokenFromJson(String str) => LoginToken.fromJson(json.decode(str));

String loginTokenToJson(LoginToken data) => json.encode(data.toJson());

class LoginToken {
    LoginToken({
        required this.accessToken,
    });

    String accessToken;

    factory LoginToken.fromJson(Map<String, dynamic> json) => LoginToken(
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
    };
}


// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
    SignUp({
        required this.username,
        required this.email,
        required this.password,
        required this.token,
    });

    String username;
    String email;
    String password;
    String token;

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "token": token,
    };
}

// To parse this JSON data, do
//
//     final userId = userIdFromJson(jsonString);

UserId userIdFromJson(String str) => UserId.fromJson(json.decode(str));

String userIdToJson(UserId data) => json.encode(data.toJson());

class UserId {
    UserId({
        required this.userId,
    });

    String userId;

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
    };
}
