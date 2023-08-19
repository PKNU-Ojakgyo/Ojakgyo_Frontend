import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ojakgyo/src/pages/view_contract_page.dart';

import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/choose_btn.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';

import 'package:ojakgyo/src/services/user_info_model.dart';
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/tran_detail_model.dart';

class TranDetailPage extends StatefulWidget {
  const TranDetailPage({
    Key? key,
    required this.dealId,
  }) : super(key: key);

  final int? dealId;

  @override
  State<TranDetailPage> createState() => _TranDetailPageState();
}

class _TranDetailPageState extends State<TranDetailPage> {
  bool isChecked = false;

  late Map<String, dynamic> responseData;
  late TranDetailModel tranDetail;

  void sendToken() async {
    AuthTokenGet authToken = AuthTokenGet();
    http.Response response = await authToken
        .authTokenCallBack('deal-details?dealId=${widget.dealId}');

    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
      tranDetail = TranDetailModel.fromJson(responseData);
    } else {
      throw Exception('데이터를 불러오지 못했습니다.');
    }
  }

  UserInfoModel userInfo = UserInfoModel();

  bool identifySeller() {
    return tranDetail.sellerPhone == userInfo.user?.phone;
  }

  @override
  Widget build(BuildContext context) {
    sendToken();
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: const Color(0xFF23225C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  children: [
                    const MainTitle(mainTitle: '거래 상세보기'),
                    const Line(),
                    const SubTitle(subTitle: '간이계약서'),
                    Row(
                      children: [
                        ChooseBtn(
                          title: '간이계약서 조회하기',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewContractPage(),
                              ),
                            );
                          },
                          isNotChooseBtn: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SubTitle(subTitle: '입금 현황'),
                    Row(
                      children: [
                        identifySeller()
                            ? const Text(
                                '판매자',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
                            : const Text(
                                '구매자',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                        SizedBox(
                          width: 30,
                          height: 24,
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(
                                () {
                                  isChecked = !isChecked;
                                },
                              );
                            },
                          ),
                        ),
                        identifySeller()
                            ? const Text(
                                "입금 확인",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
                            : const Text(
                                "입금 완료",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
                      ],
                    ),
                    Row(
                      children: [
                        identifySeller()
                            ? Text(
                                '구매자의 입금을 확인 후 체크 해주세요.',
                                style: TextStyle(
                                  color: isChecked ? Colors.white : Colors.red,
                                ),
                              )
                            : Text(
                                '판매자에게 입금 완료 후 체크 해주세요.',
                                style: TextStyle(
                                  color: isChecked ? Colors.white : Colors.red,
                                ),
                              )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Transform.translate(
                      offset: const Offset(0, 15),
                      child: const SubTitle(subTitle: '거래 내역'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD8E8E9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.lock_outline,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '락커 정보'),
                        ],
                      ),
                      Text('락커 아이디 : ${tranDetail.lockerId}'),
                      Text('락커 주소 : ${tranDetail.lockerAddress}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.person_outline,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '판매자 정보'),
                        ],
                      ),
                      Text('판매자 이름 : ${tranDetail.sellerName}'),
                      Text('판매자 전화번호 : ${tranDetail.sellerPhone}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.person_outline,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '구매자 정보'),
                        ],
                      ),
                      Text('구매자 이름 : ${tranDetail.buyerName}'),
                      Text('구매자 전화번호 : ${tranDetail.buyerPhone}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.currency_exchange_outlined,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '거래 정보'),
                        ],
                      ),
                      Text('거래 은행 : ${tranDetail.bank}'),
                      Text('거래 계좌 : ${tranDetail.account}'),
                      Text('거래 금액 : ${tranDetail.price}원'),
                      Text('거래 물품 : ${tranDetail.itemName}'),
                      Text('물품 상태 : ${tranDetail.condition}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.money_outlined,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '입금 현황'),
                        ],
                      ),
                      tranDetail.depositStatus == false
                          ? const Text(
                              '입금 전',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : const Text(
                              '입금 완료',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.list_alt_outlined,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '비밀번호 및 시간 내역'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(tranDetail.createLockerPwdAt ?? 'Unknown'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            tranDetail.lockerPassword ?? 'Unknown',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        '입금 확인 후 비밀번호가 공개됩니다.',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 4),
                            child: const Icon(
                              Icons.screen_rotation_alt_outlined,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const SubTitle(subTitle: '거래 상태'),
                        ],
                      ),
                      Text(
                        tranDetail.dealStatus ?? 'Unknown',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RegisterBtn(
                              btnName: '거래파기',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      title: const Text('경고'),
                                      content: const Text('거래를 파기하시겠습니까?'),
                                      actions: [
                                        RegisterBtn(
                                          btnName: '확인',
                                          onPressed: () {},
                                          isModal: true,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              isModal: false)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
