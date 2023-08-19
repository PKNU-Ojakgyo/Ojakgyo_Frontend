import 'package:http/http.dart' as http;
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'dart:convert';

class RegisterPost {
  final String baseURL = 'http://13.125.232.188:8080';

  Future<int> registerPost({
    required String bank,
    required String account,
    required int price,
    required String itemName,
    required String condition,
    required int dealerId,
    required int lockerId,
    required bool isSeller,
  }) async {
    AuthTokenGet authToken = AuthTokenGet();

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
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int dealId = responseData['dealId'];

      return dealId;
    } else {
      throw Exception('거래를 등록에 실패했습니다.');
    }
  }
}
