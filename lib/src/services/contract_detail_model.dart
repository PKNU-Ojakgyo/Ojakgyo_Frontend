class ContractDetailModel {
  String? repAndRes;
  String? note;
  String? sellerSignature;
  String? buyerSignature;

  ContractDetailModel(
      {this.repAndRes, this.note, this.sellerSignature, this.buyerSignature});

  ContractDetailModel.fromJson(Map<String, dynamic> json) {
    repAndRes = json['repAndRes'];
    note = json['note'];
    sellerSignature = json['sellerSignature'];
    buyerSignature = json['buyerSignature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['repAndRes'] = repAndRes;
    data['note'] = note;
    data['sellerSignature'] = sellerSignature;
    data['buyerSignature'] = buyerSignature;
    return data;
  }
}
