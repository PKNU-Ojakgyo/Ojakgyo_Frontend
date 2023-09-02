import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/text_input.dart';
import 'package:ojakgyo/widgets/duplicate_btn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                const MainTitle(mainTitle: '회원가입'),
                const Line(),
                const SubTitle(subTitle: '아이디 입력'),
                Row(
                  children: [
                    Expanded(
                      flex: 24,
                      child: TextInput(
                        textType: '아이디',
                        hintText: '이메일을 입력하세요.',
                        isDefault: false,
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 11,
                      child: DuplicateBtn(
                        title: '중복확인',
                        onPressed: () {
                          print('클릭');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SubTitle(subTitle: '비밀번호 입력'),
                TextInput(
                  textType: '비밀번호',
                  hintText: '영문, 숫자 조합으로 12자 이상',
                  isDefault: false,
                  controller: passwordController,
                ),
                TextInput(
                  textType: '비밀번호 재확인',
                  hintText: '비밀번호를 다시 입력하세요.',
                  isDefault: false,
                  controller: rePasswordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SubTitle(subTitle: '이름 입력'),
                TextInput(
                  textType: '이름',
                  hintText: '실명을 입력하세요.(반드시 실명을 입력)',
                  isDefault: false,
                  controller: nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SubTitle(subTitle: '전화번호 입력'),
                Row(
                  children: [
                    Expanded(
                      flex: 24,
                      child: TextInput(
                        textType: '전화번호',
                        hintText: '전화번호를 입력하세요.',
                        isDefault: false,
                        controller: phoneNumberController,
                        textInputType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 11,
                      child: DuplicateBtn(
                        title: '중복확인',
                        onPressed: () {
                          print('클릭');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
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
      ),
    );
  }
}
