import 'package:flutter/material.dart';
import 'package:ojakgyo/src/services/login_post.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/manage_member_btn.dart';
import 'package:ojakgyo/widgets/login_input.dart';
import 'package:ojakgyo/src/pages/main_page.dart';
import 'package:ojakgyo/src/services/auth_token_get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final LoginPost _loginPost = LoginPost();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Object errorMessage = '';
  late String authToken;

  void submit(BuildContext context) async {
    String userName = idController.text; // 아이디
    String password = passwordController.text; // 비밀번호

    try {
      Map<String, dynamic> headers =
          await widget._loginPost.loginPost(userName, password);
      authToken = headers['Authorization'];
      AuthTokenGet.setToken(authToken);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage(authToken: authToken)),
      );
    } catch (e) {
      setState(() {
        errorMessage = e;
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
              height: 100,
              child: Column(
                children: [
                  Text(
                    errorMessage.toString(),
                    style: const TextStyle(color: Colors.red),
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
