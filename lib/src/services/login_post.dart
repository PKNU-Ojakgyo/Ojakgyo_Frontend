import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ojakgyo/src/services/auth_token_get.dart';

class LoginPost {
  final String baseURL = 'http://13.125.232.188:8080';

  Future<void> loginPost(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'),
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.headers;

      if (responseData.containsKey('Authorization')) {
        String authToken = responseData['authorization'];
        AuthTokenManage.setToken(authToken);
        print(authToken);

        String? retrievedToken = AuthTokenManage.getToken();
        print('Retrieved Token: $retrievedToken');
      }
    } else {
      throw Exception('토큰을 받아오지 못했습니다. 상태 코드: ${response.statusCode}');
    }
  }
}
