class DealerInfoModel {
  int? dealerId;
  String? email;
  String? name;
  String? phone;
  List<DealLists>? dealLists;

  DealerInfoModel(
      {this.dealerId, this.email, this.name, this.phone, this.dealLists});

  DealerInfoModel.fromJson(Map<String, dynamic> json) {
    dealerId = json['dealerId'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    if (json['dealLists'] != null) {
      dealLists = <DealLists>[];
      json['dealLists'].forEach((v) {
        dealLists!.add(DealLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dealerId'] = dealerId;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    if (dealLists != null) {
      data['dealLists'] = dealLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DealLists {
  String? item;
  String? updateAt;
  String? dealStatus;

  DealLists({this.item, this.updateAt, this.dealStatus});

  DealLists.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    updateAt = json['updateAt'];
    dealStatus = json['dealStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['updateAt'] = updateAt;
    data['dealStatus'] = dealStatus;
    return data;
  }
}
