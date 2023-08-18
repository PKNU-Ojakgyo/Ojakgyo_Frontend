import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/modify_contract.dart';
import 'package:ojakgyo/src/pages/main_page.dart';
import 'package:ojakgyo/src/services/user_data.dart';

class WriteContractPage extends StatefulWidget {
  const WriteContractPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<WriteContractPage> createState() => _WriteContractPageState();
}

class _WriteContractPageState extends State<WriteContractPage> {
  TextEditingController tranContractController = TextEditingController(
      text:
          '(1) 거래 계약은 판매자와 구매자가 상호 합의하여 체결하는 것으로 합니다.\n(2) 판매자는 물품의 소유권을 보유하고 있으며, 구매자는 해당 물품을 구매하고자 합니다.\n(3) 판매자는 구매자에게 물품을 인도하며, 구매자는 물품 대금을 지불합니다.');
  TextEditingController indemnificationLiabilityController = TextEditingController(
      text:
          '(1) 판매자는 물품을 인도하기 전, 물품의 하자나 손상 여부를 확인하여야 합니다.\n(2) 구매자는 물품 수령 후, 물품에 대한 하자나 손상 여부를 확인하여야 합니다.\n(3) 물품의 소유권이 구매자에게 이전되기 전까지 발생하는 모든 손실, 손해, 멸실 또는 파손 등의 책임은 판매자가 부담합니다.\n(4) 물품의 소유권이 구매자에게 이전된 후 발생하는 모든 손실, 손해, 멸실 또는 파손 등의 책임은 구매자가 부담합니다.');
  TextEditingController etcController = TextEditingController(
      text:
          '(1) 이 계약서에 명시되지 않은 사항에 대해서는 상호 합의하여 정합니다.\n(2) 이 계약서는 양 당사자가 본 계약서 내용을 충분히 이해하고 서명함으로써 효력이 발생합니다.\n(3) 이 계약서는 전자 문서로서도 유효하며, 이 경우에는 양 당사자가 전자 서명함으로써 효력이 발생합니다.\n(4) 본 계약서는 복사본으로도 효력이 있습니다.');

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
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '판매자',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('성명 : 김철수'),
                        Text('연락처 : 010-1234-5678'),
                        Text('은행 : 농협'),
                        Text('계좌번호 : 32114341434143'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '구매자',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('성명 : 박영희'),
                        Text('연락처 : 010-9876-5432'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 물품의 정보'),
              const Text('물품명 : Apple airpod Pro 2세대 2023년형'),
              const Text('상태 : 중고 (사용 기간 6개월, 상태 양호)'),
              const Text('거래 금액: 1,200,000원'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 조건'),
              const Text('(1) 거래 일시: 범위(사물함에 보관할 수 있는 범위)'),
              const Text('(2) 거래 장소: 사물함 위치'),
              const Text('(3) 결제 방법: 계좌이체'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 계약'),
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
                controller: tranContractController,
              ),
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
              const Row(
                children: [
                  Text('김철수'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('(인)'),
                ],
              ),
              const Text('일자 : 2023년 8월 17일'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '구매자'),
              const Row(
                children: [
                  Text('박영희'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('(인)'),
                ],
              ),
              const Text('일자 : 2023년 8월 17일'),
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(user: widget.user),
                                      ),
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
