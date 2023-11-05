import 'package:flutter/material.dart';
// import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/login_post.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/manage_member_btn.dart';
import 'package:ojakgyo/widgets/login_input.dart';
import 'package:ojakgyo/src/pages/main_page.dart';
// import 'package:ojakgyo/src/services/auth_token_get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginPost _loginPost = LoginPost();
  Object errorMessage = '';
  bool isError = false;

  void submit(BuildContext context) async {
    String userName = idController.text; // 아이디
    String password = passwordController.text; // 비밀번호

    try {
      await _loginPost.loginPost(userName, password);

      setState(() {
        isError = false;
      });

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = '회원정보가 일치하지 않습니다.';
        isError = true;
      });
    }
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
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: Column(
                children: [
                  Text(
                    errorMessage.toString(),
                    style: isError
                        ? const TextStyle(color: Colors.red)
                        : const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ManageMemberBtn(
              btnName: '로그인',
              onPressed: () {
                submit(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
