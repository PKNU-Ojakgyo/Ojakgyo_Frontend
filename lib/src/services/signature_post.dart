import 'package:http/http.dart' as http;
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'dart:convert';

class SignaturePost {
  final String baseURL =
      'http://ec2-15-164-170-1.ap-northeast-2.compute.amazonaws.com:8080';

  Future<String> signaturePost({
    required bool isSeller,
    required String signature,
    required int contractId,
  }) async {
    String? authToken = AuthTokenManage.getToken();

    final Map<String, dynamic> requestData = {
      'isSeller': isSeller,
      'signature': signature,
      'contractId': contractId,
    };

    final request =
        http.Request('POST', Uri.parse('$baseURL/contract/signature'));
    request.headers['Authorization'] = authToken!;
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(requestData);

    final response = await http.Client().send(request);

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      String signAt = responseBody;

      return signAt;
    } else {
      return 'Unknown';
    }
  }
}
