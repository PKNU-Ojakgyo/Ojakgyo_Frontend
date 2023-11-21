import 'package:flutter/material.dart';
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/contract_post.dart';
import 'package:ojakgyo/src/services/tran_detail_model.dart';
import 'package:ojakgyo/src/services/user_info_model.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/signpad.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/modify_contract.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class WriteContractPage extends StatefulWidget {
  const WriteContractPage({
    Key? key,
    required this.userInfo,
    required this.dealId,
  }) : super(key: key);

  final UserInfoModel userInfo;
  final int dealId;

  @override
  State<WriteContractPage> createState() => _WriteContractPageState();
}

class _WriteContractPageState extends State<WriteContractPage> {
  TextEditingController indemnificationLiabilityController = TextEditingController(
      text:
          '(1) 판매자는 물품을 인도하기 전, 물품의 하자나 손상 여부를 확인하여야 합니다.\n(2) 구매자는 물품 수령 후, 물품에 대한 하자나 손상 여부를 확인하여야 합니다.\n(3) 물품의 소유권이 구매자에게 이전되기 전까지 발생하는 모든 손실, 손해, 멸실 또는 파손 등의 책임은 판매자가 부담합니다.\n(4) 물품의 소유권이 구매자에게 이전된 후 발생하는 모든 손실, 손해, 멸실 또는 파손 등의 책임은 구매자가 부담합니다.');
  TextEditingController etcController = TextEditingController(
      text:
          '(1) 이 계약서에 명시되지 않은 사항에 대해서는 상호 합의하여 정합니다.\n(2) 이 계약서는 양 당사자가 본 계약서 내용을 충분히 이해하고 서명함으로써 효력이 발생합니다.\n(3) 이 계약서는 전자 문서로서도 유효하며, 이 경우에는 양 당사자가 전자 서명함으로써 효력이 발생합니다.\n(4) 본 계약서는 복사본으로도 효력이 있습니다.');

  TranDetailModel tranDetail = TranDetailModel();

  final ContractPost _contractPost = ContractPost();
  late int contractId;

  Future<void> sendToken() async {
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken
          .authTokenCallBack('deal-details?dealId=${widget.dealId}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          tranDetail = TranDetailModel.fromJson(responseData);
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  bool isSeller() {
    return tranDetail.sellerName == widget.userInfo.user?.name;
  }

  Future<int> submit() async {
    try {
      int contractId = await _contractPost.contractPost(
          dealId: widget.dealId,
          repAndRes: indemnificationLiabilityController.text,
          note: etcController.text,
          price: tranDetail.price!);

      return contractId;
    } catch (e) {
      throw Exception(e);
    }
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
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainTitle(mainTitle: '간이계약서 작성'),
              const Line(),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('성명 : ${tranDetail.sellerName}'),
                        Text('연락처 : ${tranDetail.sellerPhone}'),
                        Text('은행 : ${tranDetail.bank}'),
                        Text('계좌번호 : ${tranDetail.account}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '< 구매자 >',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('성명 : ${tranDetail.buyerName}'),
                        Text('연락처 : ${tranDetail.buyerPhone}'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 물품의 정보'),
              Text('물품명 : ${tranDetail.itemName}'),
              Text('상태 : ${tranDetail.condition}'),
              Text('거래 금액: ${tranDetail.price}원'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 조건'),
              Text('(1) 거래 일시: ${tranDetail.createAtDeal}'),
              Text('(2) 거래 장소: ${tranDetail.lockerAddress}'),
              const Text('(3) 결제 방법: 계좌이체'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 계약'),
              const Text('(1) 거래 계약은 판매자와 구매자가 상호 합의하여 체결하는 것으로 합니다.'),
              const Text('(2) 판매자는 물품의 소유권을 보유하고 있으며, 구매자는 해당 물품을 구매하고자 합니다.'),
              const Text('(3) 판매자는 구매자에게 물품을 인도하며, 구매자는 물품 대금을 지불합니다.'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '배상 및 책임 등'),
              const Row(
                children: [
                  Icon(Icons.priority_high_outlined, size: 20),
                  Text(
                    '수정이 가능합니다.',
                    style: TextStyle(
                      color: Color.fromARGB(221, 53, 53, 53),
                    ),
                  ),
                ],
              ),
              ModifyContract(
                controller: indemnificationLiabilityController,
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '기타 사항'),
              const Row(
                children: [
                  Icon(Icons.priority_high_outlined, size: 20),
                  Text(
                    '수정이 가능합니다.',
                    style: TextStyle(
                      color: Color.fromARGB(221, 53, 53, 53),
                    ),
                  ),
                ],
              ),
              ModifyContract(
                controller: etcController,
              ),
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
                  Text(tranDetail.sellerName ?? 'Unknown'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('(인)'),
                ],
              ),
              const Text('일자 : '),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '구매자'),
              Row(
                children: [
                  Text(tranDetail.buyerName ?? 'Unknown'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('(인)'),
                ],
              ),
              const Text('일자 :'),
              const SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RegisterBtn(
                      btnName: '작성 완료',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              title: const Text('알림'),
                              content: const Text('간이 계약서 작성을 확정하시겠습니까?'),
                              actions: [
                                RegisterBtn(
                                  btnName: '예',
                                  onPressed: () async {
                                    contractId = await submit();
                                    print(
                                        '계약서 submit후 return contractId : $contractId');
                                    if (!mounted) return;
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SignPad(
                                          isSeller: isSeller(),
                                          contractId: contractId,
                                        );
                                      },
                                    );
                                  },
                                  isModal: true,
                                ),
                                RegisterBtn(
                                  btnName: '아니요',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  isModal: true,
                                ),
                              ],
                            );
                          },
                        );
                      },
                      isModal: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
