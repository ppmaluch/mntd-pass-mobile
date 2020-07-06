import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mntd_mobile/models/user_model.dart';
import 'package:mntd_mobile/utils/constants.dart';

class LoginService {
  final String authUrl = "$BASE_URL/auth";

  Future<User> login(String username, String password) async {
    http.Response res = await http.post(authUrl,
        body: jsonEncode({"username": username, "password": password}),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body);
      var user = User.fromJson(jsonResponse);
      return user;
    } else {
      throw 'Can`t login';
    }
  }
}
