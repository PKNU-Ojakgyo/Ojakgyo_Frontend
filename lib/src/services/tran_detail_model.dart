class TranDetailModel {
  int? contactId;
  int? lockerId;
  String? lockerAddress;
  String? sellerName;
  String? sellerPhone;
  String? buyerName;
  String? buyerPhone;
  String? bank;
  String? account;
  int? price;
  String? itemName;
  String? condition;
  bool? depositStatus;
  String? lockerPassword;
  String? createLockerPwdAt;
  String? dealStatus;

  TranDetailModel(
      {contactId,
      lockerId,
      lockerAddress,
      sellerName,
      sellerPhone,
      buyerName,
      buyerPhone,
      bank,
      account,
      price,
      itemName,
      condition,
      depositStatus,
      lockerPassword,
      createLockerPwdAt,
      dealStatus});

  TranDetailModel.fromJson(Map<String, dynamic> json) {
    contactId = json['contactId'];
    lockerId = json['lockerId'];
    lockerAddress = json['lockerAddress'];
    sellerName = json['sellerName'];
    sellerPhone = json['sellerPhone'];
    buyerName = json['buyerName'];
    buyerPhone = json['buyerPhone'];
    bank = json['bank'];
    account = json['account'];
    price = json['price'];
    itemName = json['itemName'];
    condition = json['condition'];
    depositStatus = json['depositStatus'];
    lockerPassword = json['lockerPassword'];
    createLockerPwdAt = json['createLockerPwdAt'];
    dealStatus = json['dealStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactId'] = contactId;
    data['lockerId'] = lockerId;
    data['lockerAddress'] = lockerAddress;
    data['sellerName'] = sellerName;
    data['sellerPhone'] = sellerPhone;
    data['buyerName'] = buyerName;
    data['buyerPhone'] = buyerPhone;
    data['bank'] = bank;
    data['account'] = account;
    data['price'] = price;
    data['itemName'] = itemName;
    data['condition'] = condition;
    data['depositStatus'] = depositStatus;
    data['lockerPassword'] = lockerPassword;
    data['createLockerPwdAt'] = createLockerPwdAt;
    data['dealStatus'] = dealStatus;
    return data;
  }
}
