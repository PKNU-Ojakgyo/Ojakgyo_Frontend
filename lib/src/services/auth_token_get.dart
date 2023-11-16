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
  final String baseURL =
      'http://ec2-15-164-170-1.ap-northeast-2.compute.amazonaws.com:8080';

  Future<http.Response> authTokenCallBack(String page) async {
    if (AuthTokenManage.isLoggedIn()) {
      final authToken = AuthTokenManage.getToken();
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

class AuthTokenDelete {
  final String baseURL =
      'http://ec2-15-164-170-1.ap-northeast-2.compute.amazonaws.com:8080';

  Future<int> authTokenCallback(int dealId) async {
    if (AuthTokenManage.isLoggedIn()) {
      final authToken = AuthTokenManage.getToken();
      final response = await http.delete(
        Uri.parse('$baseURL/deal/delete?dealId=$dealId'),
        headers: {
          'Authorization': '$authToken',
        },
      );
      return response.statusCode;
    } else {
      throw Exception('로그인 상태가 아닙니다.');
    }
  }
}
