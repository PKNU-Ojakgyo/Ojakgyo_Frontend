import 'package:http/http.dart' as http;
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'dart:convert';

class RegisterPost {
  final String baseURL =
      'http://ec2-15-164-170-1.ap-northeast-2.compute.amazonaws.com:8080';

  Future<int> registerPost({
    required String bank,
    required String account,
    required int price,
    required String itemName,
    required String condition,
    required String dealerId,
    required String lockerId,
    required bool isSeller,
  }) async {
    String? authToken = AuthTokenManage.getToken();

    final Map<String, dynamic> requestData = {
      'bank': bank,
      'account': account,
      'price': price,
      'itemName': itemName,
      'condition': condition,
      'dealerId': dealerId,
      'lockerId': lockerId,
      'isSeller': isSeller,
    };

    final request = http.Request('POST', Uri.parse('$baseURL/deal'));
    request.headers['Authorization'] = authToken!;
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(requestData);

    final response = await http.Client().send(request);

    print("보냄");

    if (response.statusCode == 200) {
      print("서버로 갔다");
      final responseBody =
          await response.stream.bytesToString(); // 스트림 데이터를 문자열로 변환
      final responseData = json.decode(responseBody); // JSON으로 파싱
      final int dealId = responseData['dealId'];

      return dealId;
    } else {
      print(response.statusCode);
      return -999;
    }
  }
}
