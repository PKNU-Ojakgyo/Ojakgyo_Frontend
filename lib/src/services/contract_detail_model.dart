class ContractDetailModel {
  String? repAndRes;
  String? note;
  String? sellerSignature;
  String? buyerSignature;
  String? sellerSignatureCreatAt;
  String? buyerSignatureCreatAt;

  ContractDetailModel(
      {this.repAndRes,
      this.note,
      this.sellerSignature,
      this.buyerSignature,
      this.sellerSignatureCreatAt,
      this.buyerSignatureCreatAt});

  ContractDetailModel.fromJson(Map<String, dynamic> json) {
    repAndRes = json['repAndRes'];
    note = json['note'];
    sellerSignature = json['sellerSignature'];
    buyerSignature = json['buyerSignature'];
    sellerSignatureCreatAt = json['sellerSignatureCreatAt'];
    buyerSignatureCreatAt = json['buyerSignatureCreatAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['repAndRes'] = repAndRes;
    data['note'] = note;
    data['sellerSignature'] = sellerSignature;
    data['buyerSignature'] = buyerSignature;
    data['sellerSignatureCreatAt'] = sellerSignatureCreatAt;
    data['buyerSignatureCreatAt'] = buyerSignatureCreatAt;
    return data;
  }
}
