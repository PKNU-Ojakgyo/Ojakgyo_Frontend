import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ojakgyo/src/pages/view_contract_page.dart';
import 'package:ojakgyo/src/pages/main_page.dart';
import 'package:ojakgyo/src/services/user_info_model.dart';

import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/choose_btn.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';

import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/tran_detail_model.dart';
import 'package:ojakgyo/src/services/contract_detail_model.dart';

class TranDetailPage extends StatefulWidget {
  const TranDetailPage({
    Key? key,
    required this.dealId,
    required this.userInfo,
  }) : super(key: key);

  final int? dealId;
  final UserInfoModel userInfo;

  @override
  State<TranDetailPage> createState() => _TranDetailPageState();
}

class _TranDetailPageState extends State<TranDetailPage> {
  bool isChecked = false;
  Map<String, dynamic> dealState = {
    'BEFORE': '거래 전',
    'DEALING': '거래 중',
    'COMPLETED': '거래 완료',
    'CANCELED': '거래 취소',
  };

  late Map<String, dynamic> responseData;
  TranDetailModel tranDetail = TranDetailModel.fromJson({});

  Future<void> sendToken() async {
    int? dealID = widget.dealId;
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response =
          await authToken.authTokenCallBack('deal-details?dealId=$dealID');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));
        print('이것은 tranDetail $responseData');
        setState(() {
          tranDetail = TranDetailModel.fromJson(responseData);
        });
        setState(() {
          if (tranDetail.sellerPhone == widget.userInfo.user?.phone) {
            if (tranDetail.depositStatus == "SELLER_DEPOSIT_CHECK") {
              isChecked = true;
            }
          } else {
            if (tranDetail.depositStatus != "BUYER_DEPOSIT_BEFORE") {
              isChecked = true;
            }
          }
        });
      } else {
        throw Exception('데이터를 불러오지 못했습니다.');
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  Future<void> inquiryContract() async {
    int? contractID = tranDetail.contactId;
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken
          .authTokenCallBack('contract/details?contractId=$contractID');

      print(response.statusCode);

      if (response.statusCode == 200) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewContractPage(
              tranDetail: tranDetail,
            ),
          ),
        );
      } else {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: const Text('알림'),
              content: const Text('조회할 간이계약서가 없습니다.'),
              actions: [
                RegisterBtn(
                  btnName: '확인',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isModal: true,
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> buyerChecked() async {
    int? dealID = widget.dealId;
    AuthTokenGet authToken = AuthTokenGet();

    if (tranDetail.depositStatus == "BUYER_DEPOSIT_BEFORE") {
      try {
        http.Response response = await authToken.authTokenCallBack(
            'deal-details/buyer-deposit-complete?dealId=$dealID');

        if (response.statusCode == 200) {
          setState(() {
            isChecked = true;
            tranDetail.lockerPassword = response.body;
          });
        }
      } catch (e) {
        throw Exception("ERROR : $e");
      }
    }
  }

  Future<void> sellerChecked() async {
    int? dealID = widget.dealId;
    AuthTokenGet authToken = AuthTokenGet();

    if (tranDetail.depositStatus == "BUYER_DEPOSIT_COMPLETE") {
      try {
        http.Response response = await authToken.authTokenCallBack(
            'deal-details/seller-deposit-check?dealId=$dealID');

        if (response.statusCode == 200) {
          setState(() {
            isChecked = true;
          });
        }
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  bool identifySeller() {
    return tranDetail.sellerPhone == widget.userInfo.user?.phone;
  }

  Future<void> completeDeal() async {
    int? dealID = widget.dealId;
    AuthTokenGet authToken = AuthTokenGet();

    try {
      http.Response response = await authToken
          .authTokenCallBack('deal-details/buyer-deal-complete?dealId=$dealID');

      if (response.statusCode == 200) {
        setState(
          () {
            tranDetail.dealStatus = "COMPlETE";
          },
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteDeal() async {
    int? dealId = widget.dealId;
    AuthTokenDelete authToken = AuthTokenDelete();

    try {
      int statusCode = await authToken.authTokenCallback(dealId!);

      if (statusCode == 200) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      }
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
                            inquiryContract();
                          },
                          isNotChooseBtn: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    tranDetail.contactId == -1
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              tranDetail.dealStatus != 'BEFORE'
                                  ? Container()
                                  : const Text(
                                      '서명하지 않은 간이계약서가 존재합니다.\n서명 후 거래 등록이 완료됩니다.',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                            ],
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
                              if (identifySeller()) {
                                sellerChecked();
                              } else {
                                buyerChecked();
                              }
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
                      tranDetail.depositStatus == "BUYER_DEPOSIT_BEFORE"
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
                      identifySeller()
                          ? tranDetail.depositStatus == "BUYER_DEPOSIT_BEFORE"
                              ? Row(
                                  children: [
                                    Text(tranDetail.createLockerPwdAt ??
                                        'Unknown'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      tranDetail.lockerPassword ?? 'Unknown',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              : tranDetail.depositStatus ==
                                      "BUYER_DEPOSIT_COMPLETE"
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(tranDetail.createLockerPwdAt ??
                                                'Unknown'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "******",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "구매자가 입금을 완료하여 새로운 비밀번호가 생성되었습니다.",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        const Text(
                                          "판매자가 입금을 확인하면 구매자에게 비밀번호가 공개됩니다.",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(tranDetail.createLockerPwdAt ??
                                                'Unknown'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "******",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "판매자가 입금을 확인하여 구매자에게만 비밀번호가 공개되었습니다.",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    )
                          : tranDetail.depositStatus == "BUYER_DEPOSIT_BEFORE"
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(tranDetail.createLockerPwdAt ??
                                            'Unknown'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "******",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "구매자가 입금 전이므로 판매자에게만 비밀번호가 공개되었습니다.",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )
                              : tranDetail.depositStatus ==
                                      "BUYER_DEPOSIT_COMPLETE"
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(tranDetail.createLockerPwdAt ??
                                                'Unknown'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "******",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "구매자가 입금을 완료하여 새로운 비밀번호가 생성되었습니다.",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        const Text(
                                          "판매자가 입금을 확인하면 구매자에게 비밀번호가 공개됩니다.",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(tranDetail.createLockerPwdAt ??
                                            'Unknown'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          tranDetail.lockerPassword ??
                                              'Unknown',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
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
                      tranDetail.depositStatus == "SELLER_DEPOSIT_CHECK" &&
                              !identifySeller() &&
                              tranDetail.dealStatus == "DEALING"
                          ? ChooseBtn(
                              title: '거래 완료하기',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      title: const Text('알림'),
                                      content: const Text('거래를 완료하시겠습니까?'),
                                      actions: [
                                        RegisterBtn(
                                          btnName: '취소',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          isModal: true,
                                        ),
                                        RegisterBtn(
                                          btnName: '완료',
                                          onPressed: () {
                                            completeDeal();
                                            Navigator.pop(context);
                                          },
                                          isModal: true,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              isNotChooseBtn: true,
                            )
                          : Text(
                              dealState[tranDetail.dealStatus] ?? 'Unknown',
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
                              if (tranDetail.dealStatus == "BEFORE") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      title: const Text('경고'),
                                      content: const Text('거래를 파기하시겠습니까?'),
                                      actions: [
                                        RegisterBtn(
                                          btnName: '파기',
                                          onPressed: () {
                                            deleteDeal();
                                          },
                                          isModal: true,
                                        ),
                                        RegisterBtn(
                                          btnName: '취소',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          isModal: true,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      title: const Text('알림'),
                                      content: const Text(
                                          '진행 중이거나 완료된 거래는 파기할 수 없습니다.'),
                                      actions: [
                                        RegisterBtn(
                                          btnName: '확인',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          isModal: true,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            isModal: false,
                          ),
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
