import 'package:http/http.dart' as http;

class AuthTokenManage {
  static String? authToken;

  static void setToken(String token) {
    authToken = token;
  }

  static String? getToken() {
    return authToken;
  }

  static void removeToken() {
    authToken = null;
  }

  static bool isLoggedIn() {
    return authToken != null;
  }
}

class AuthTokenGet {
  final String baseURL = 'http://13.125.232.188:8080';

  Future<http.Response> authTokenCallBack(String page) async {
    if (AuthTokenManage.isLoggedIn()) {
      final authToken = AuthTokenManage.getToken();
      print('auth : $authToken');

      final response = await http.get(
        Uri.parse('$baseURL/$page'),
        headers: {
          'Authorization': '$authToken',
        },
      );
      return response;
    } else {
      throw Exception('로그인 상태가 아닙니다.');
    }
  }
}
