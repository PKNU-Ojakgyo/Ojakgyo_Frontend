class UserInfoModel {
  User? user;
  List<UserDealLists>? userDealLists;

  UserInfoModel({this.user, this.userDealLists});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['userDealLists'] != null) {
      userDealLists = <UserDealLists>[];
      json['userDealLists'].forEach((v) {
        userDealLists!.add(UserDealLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userDealLists != null) {
      data['userDealLists'] = userDealLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? password;
  String? phone;
  String? name;
  String? status;
  String? createAt;
  String? updateAt;
  String? role;

  User(
      {this.id,
      this.email,
      this.password,
      this.phone,
      this.name,
      this.status,
      this.createAt,
      this.updateAt,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    name = json['name'];
    status = json['status'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['name'] = name;
    data['status'] = status;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    data['role'] = role;
    return data;
  }
}

class UserDealLists {
  int? dealId;
  String? dealStatus;
  String? item;
  int? price;
  String? sellerName;
  String? buyerName;
  String? createAt;

  UserDealLists(
      {this.dealId,
      this.dealStatus,
      this.item,
      this.price,
      this.sellerName,
      this.buyerName,
      this.createAt});

  UserDealLists.fromJson(Map<String, dynamic> json) {
    dealId = json['dealId'];
    dealStatus = json['dealStatus'];
    item = json['item'];
    price = json['price'];
    sellerName = json['sellerName'];
    buyerName = json['buyerName'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dealId'] = dealId;
    data['dealStatus'] = dealStatus;
    data['item'] = item;
    data['price'] = price;
    data['sellerName'] = sellerName;
    data['buyerName'] = buyerName;
    data['createAt'] = createAt;
    return data;
  }
}
