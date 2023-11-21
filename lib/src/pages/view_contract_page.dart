import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/contract_detail_model.dart';
import 'package:ojakgyo/src/services/tran_detail_model.dart';

import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/signpad.dart';

class ViewContractPage extends StatefulWidget {
  const ViewContractPage({
    Key? key,
    required this.tranDetail,
  }) : super(key: key);

  final TranDetailModel tranDetail;

  @override
  State<ViewContractPage> createState() => _ViewContractPageState();
}

class _ViewContractPageState extends State<ViewContractPage> {
  ContractDetailModel contractDetail = ContractDetailModel();

  Future<void> sendToken() async {
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken.authTokenCallBack(
          'contract/details?contractId=${widget.tranDetail.contactId}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));
        print(responseData);
        setState(() {
          contractDetail = ContractDetailModel.fromJson(responseData);
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Widget decodeSignature(String signature) {
    Uint8List decodeBytes = base64.decode(signature);

    Image signatureImg = Image.memory(
      decodeBytes,
      width: 50,
      height: 50,
    );

    return signatureImg;
  }

  @override
  void initState() {
    super.initState();
    sendToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                      icon: const Icon(
                        Icons.save_alt_outlined,
                        size: 30,
                        color: Color.fromARGB(221, 53, 53, 53),
                      ),
                      itemBuilder: (BuildContext context) => [
                            const PopupMenuItem(child: Text('PNG로 내보내기')),
                            const PopupMenuItem(child: Text('PDF로 내보내기')),
                          ]),
                ],
              ),
              const Line(),
              const SizedBox(
                height: 26,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainTitle(mainTitle: '간이계약서'),
                ],
              ),
              const SubTitle(subTitle: '거래 당사자의 정보'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '< 판매자 >',
                        ),
                        Text('성명 : ${widget.tranDetail.sellerName}'),
                        Text('연락처 : ${widget.tranDetail.sellerPhone}'),
                        Text('은행 : ${widget.tranDetail.bank}'),
                        Text('계좌번호 : ${widget.tranDetail.account}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '< 구매자 >',
                        ),
                        Text('성명 : ${widget.tranDetail.buyerName}'),
                        Text('연락처 : ${widget.tranDetail.buyerPhone}'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 물품의 정보'),
              Text('물품명 : ${widget.tranDetail.itemName}'),
              Text('상태 : ${widget.tranDetail.condition}'),
              Text('거래 금액: ${widget.tranDetail.price}원'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 조건'),
              Text('(1) 거래 일시: ${widget.tranDetail.createAtDeal}'),
              Text('(2) 거래 장소: ${widget.tranDetail.lockerAddress}'),
              const Text('(3) 결제 방법: 계좌이체'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 계약'),
              const Text(
                  '(1) 거래 계약은 판매자와 구매자가 상호 합의하여 체결하는 것으로 합니다.\n(2) 판매자는 물품의 소유권을 보유하고 있으며, 구매자는 해당 물품을 구매하고자 합니다.\n(3) 판매자는 구매자에게 물품을 인도하며, 구매자는 물품 대금을 지불합니다.'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '배상 및 책임 등'),
              Text('${contractDetail.repAndRes}'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '기타 사항'),
              Text('${contractDetail.note}'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '서명 및 날인'),
              const Text('위와 같이 거위와 같이 거래 계약을 체결합니다.'),
              const Text('위와 같은 내용에 동의하며, 거래 계약서에 서명합니다.'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '판매자'),
              Row(
                children: [
                  Text('${widget.tranDetail.sellerName}'),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text('(인)'),
                      contractDetail.sellerSignature != null
                          ? decodeSignature(contractDetail.sellerSignature!)
                          : Container(),
                    ],
                  ),
                ],
              ),
              Text('일자 : ${contractDetail.sellerSignatureCreatAt ?? ' '}'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '구매자'),
              Row(
                children: [
                  Text('${widget.tranDetail.buyerName}'),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text('(인)'),
                      contractDetail.buyerSignature != null
                          ? decodeSignature(contractDetail.buyerSignature!)
                          : const SizedBox(
                              width: 50,
                              height: 50,
                            ),
                    ],
                  ),
                ],
              ),
              Text('일자 : ${contractDetail.buyerSignatureCreatAt ?? ' '}'),
              const SizedBox(
                height: 26,
              ),
              const Line(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.tranDetail.dealStatus == 'BEFORE'
                      ? RegisterBtn(
                          btnName: '확정하기',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SignPad(
                                  isSeller:
                                      contractDetail.sellerSignature == null,
                                  contractId: widget.tranDetail.contactId!,
                                );
                              },
                            );
                          },
                          isModal: false)
                      : RegisterBtn(
                          btnName: '확인',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          isModal: false),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
