class LockerInfoModel {
  int? lockerId;
  String? address;

  LockerInfoModel({this.lockerId, this.address});

  LockerInfoModel.fromJson(Map<String, dynamic> json) {
    lockerId = json['lockerId'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lockerId'] = lockerId;
    data['address'] = address;
    return data;
  }
}
