import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPost {
  final String baseURL = 'base URL';

  Future<Map<String, dynamic>> loginPost(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String authToken = responseData['Authorization'];

      final Map<String, String> headers = {
        'Authorization': authToken,
      };
      return headers;
    } else {
      throw Exception('회원정보가 일치하지 않습니다.');
    }
  }
}
