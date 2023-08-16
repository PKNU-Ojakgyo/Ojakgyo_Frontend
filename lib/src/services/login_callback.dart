import 'dart:convert';

class LoginCallback {
  static void loginCallback(String userName, String password) {
    // 데이터를 JSON으로 직렬화
    Map<String, dynamic> loginData = {
      "username": userName,
      "password": password,
    };

    // 데이터를 JSON 문자열로 변환
    String tranRegisterationJsonData = jsonEncode(loginData);
    print(tranRegisterationJsonData);
  }
}
