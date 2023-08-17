import 'package:flutter/material.dart';
import 'package:ojakgyo/src/pages/view_contract_page.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/choose_btn.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';
import 'package:ojakgyo/src/services/user_data.dart';

class TranDetailPage extends StatefulWidget {
  const TranDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<TranDetailPage> createState() => _TranDetailPageState();
}

class _TranDetailPageState extends State<TranDetailPage> {
  bool isChecked = false;

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewContractPage(user: widget.user),
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
                        const Text(
                          '판매자',
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
                        const Text(
                          "입금 확인",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '구매자의 입금을 확인 후 체크 해주세요.',
                          style: TextStyle(
                            color: isChecked ? Colors.white : Colors.red,
                          ),
                        ),
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
                      const Text('락커 아이디 : 1'),
                      const Text('락커 주소 : 부산광역시시 용소로 45'),
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
                      const Text('판매자 이름 : 손후추'),
                      const Text('판매자 전화번호 : 010-1234-5678'),
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
                      const Text('구매자 이름 : 이오정'),
                      const Text('구매자 전화번호 : 010-8765-4321'),
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
                      const Text('거래 은행 : 카카오뱅크'),
                      const Text('거래 계좌 : 123456789'),
                      const Text('거래 금액 : 10,000원'),
                      const Text('거래 물품 : 고등어 인형'),
                      const Text('물품 상태 : 아주 좋음 굿굿'),
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
                      const Text(
                        '입금전',
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
                        children: const [
                          Text('2023.08.17 01:34'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1234',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        '입금전',
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
                      const Text(
                        '거래 중',
                        style: TextStyle(
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
