import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/inquiry_btn.dart';
import 'package:ojakgyo/widgets/text_input.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/src/services/user_data.dart';

class RegisterTranPage extends StatefulWidget {
  const RegisterTranPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<RegisterTranPage> createState() => _AppState();
}

class _AppState extends State<RegisterTranPage> {
  bool? _isChecked = false;
  final List<String> banks = [
    '카카오뱅크',
    '국민은행',
    '기업은행',
    '농협은행',
    '신한은행',
    '우리은행',
    '하나은행',
    '부산은행'
  ];
  String? selectedBank = '카카오뱅크';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              const MainTitle(mainTitle: '거래 등록'),
              const Line(),
              const SubTitle(subTitle: '락커 정보 입력'),
              const TextInput(
                textType: '락커 ID',
                hintText: '거래를 진행할 락커의 ID를 입력하세요.',
              ),
              const TextInput(
                textType: '락커 주소',
                hintText: '거래를 진행할 락커의 주소를 입력하세요.',
              ),
              const InquiryBtn(btnName: '락커 조회하기'),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 등록자 정보 입력'),
              const TextInput(
                textType: '거래 등록자 이름',
                hintText: '거래 등록자의 이름을 입력하세요.',
              ),
              const TextInput(
                textType: '거래 등록자 전화번호',
                hintText: '거래 등록자의 전화번호를 입력하세요.',
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24.0,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked = value;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('판매자'),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 24.0,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked = value;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('구매자'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 정보 입력'),
              Row(
                children: [
                  DropdownButton(
                    value: selectedBank,
                    items: banks.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBank = value;
                      });
                    },
                  ),
                ],
              ),
              const TextInput(
                textType: '거래 금액',
                hintText: '거래할 물품의 금액을 입력하세요.',
              ),
              const TextInput(
                textType: '거래 물품',
                hintText: '거래할 물품의 상품명을 입력하세요.',
              ),
              const TextInput(
                textType: '물품 상태',
                hintText: '거래할 물품의 상태를 간단하게 기재하세요.',
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 대상자 정보 입력'),
              const TextInput(
                textType: '거래 대상자 이름',
                hintText: '거래 대상자의 이름을 입력하세요.',
              ),
              const InquiryBtn(btnName: '거래 대상자 조회'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  RegisterBtn(btnName: '등록하기'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 70,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
