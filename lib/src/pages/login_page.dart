import 'package:flutter/material.dart';
import 'package:ojakgyo/src/services/login_callback.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/manage_member_btn.dart';
import 'package:ojakgyo/widgets/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void submitLogin() {
    String userName = idController.text;
    String password = passwordController.text;

    LoginCallback.loginCallback(userName, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BackNavBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 110,
              width: 230,
            ),
            const SizedBox(
              height: 55,
            ),
            const Text(
              '로그인',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            LoginInput(
              hintText: '아이디를 입력하세요.',
              isPassword: false,
              controller: idController,
            ),
            const SizedBox(
              height: 15,
            ),
            LoginInput(
              hintText: '비밀번호를 입력하세요.',
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 40,
            ),
            ManageMemberBtn(
              btnName: '로그인',
              onPressed: () {
                submitLogin();
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '아이디 찾기 | 비밀번호 찾기',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
