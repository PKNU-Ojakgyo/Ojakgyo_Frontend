class Counterparty {
  String? email;
  String? name;
  String? phone;
  List<DealLists>? dealLists;

  Counterparty({this.email, this.name, this.phone, this.dealLists});

  Counterparty.fromJson(Map<String, dynamic> json) {
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
  String? dealStatus;
  String? updateAt;

  DealLists({this.item, this.dealStatus, this.updateAt});

  DealLists.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    dealStatus = json['dealStatus'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['dealStatus'] = dealStatus;
    data['updateAt'] = updateAt;
    return data;
  }
}
