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
    AuthTokenGet authToken = AuthTokenGet();

    print("이제 서버로 보낸다..");
    final response = await http.post(
      Uri.parse('$baseURL/deal'),
      headers: {
        'Authorization': '$authToken',
      },
      body: {
        'bank': bank,
        'account': account,
        'price': price,
        'itemName': itemName,
        'condition': condition,
        'dealerId': dealerId,
        'lockerId': lockerId,
        'isSeller': isSeller,
      },
    );

    if (response.statusCode == 200) {
      print("서버로 갔다");
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int dealId = responseData['dealId'];

      return dealId;
    } else {
      return -999;
    }
  }
}
