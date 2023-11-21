import 'package:http/http.dart' as http;
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'dart:convert';

class ContractPost {
  final String baseURL =
      'http://ec2-15-164-170-1.ap-northeast-2.compute.amazonaws.com:8080';

  Future<int> contractPost({
    required int dealId,
    required String repAndRes,
    required String note,
    required int price,
  }) async {
    String? authToken = AuthTokenManage.getToken();

    final Map<String, dynamic> requestData = {
      'dealId': dealId,
      'repAndRes': repAndRes,
      'note': note,
      'price': price,
    };

    final request = http.Request('POST', Uri.parse('$baseURL/contract'));
    request.headers['Authorization'] = authToken!;
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(requestData);

    final response = await http.Client().send(request);

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);
      final int contractId = responseData;
      return contractId;
    } else {
      return -999;
    }
  }
}
