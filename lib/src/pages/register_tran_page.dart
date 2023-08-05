import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/widgets/text_input.dart';
import 'package:ojakgyo/widgets/inquiry_btn.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';

class RegisterTranPage extends StatefulWidget {
  const RegisterTranPage({super.key});

  @override
  State<RegisterTranPage> createState() => _AppState();
}

class _AppState extends State<RegisterTranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: const [
            RegisterBtn(btnName: '등록하기'),
            TextInput(
              textType: '비밀번호',
            ),
            TextInput(
              textType: '아이디',
            ),
            InquiryBtn(btnName: '락커 조회하기'),
            MainTitle(
              mainTitle: '거래 등록',
            ),
            SubTitle(
              subTitle: '안녕하세요',
            ),
          ],
        ),
      ),
    );
  }
}
