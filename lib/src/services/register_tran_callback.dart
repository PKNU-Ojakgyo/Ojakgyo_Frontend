import 'dart:convert';

class RegisterTranCallback {
  static void registerTranCallback(
    int lockerID,
    String lockerAddress,
    String name,
    String cellPhone,
    String account,
    String accountBank,
    int itemPrice,
    String itemName,
    String itemCondtion,
    String buyerName,
    String buyerCellPhone,
  ) {
    // 데이터를 JSON으로 직렬화
    Map<String, dynamic> tranRegisterationData = {
      "locker_id": lockerID,
      "locker_address": lockerAddress,
      "name": name,
      "cellphone": cellPhone,
      "account": account,
      "account_bank": accountBank,
      "price": itemPrice,
      "item": itemName,
      "condition": itemCondtion,
      "buyer_name": buyerName,
      "buyer_cellphone": buyerCellPhone,
    };

    // 데이터를 JSON 문자열로 변환
    String tranRegisterationJsonData = jsonEncode(tranRegisterationData);
    print(tranRegisterationJsonData);
  }
}
