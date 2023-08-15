import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/manage_member_btn.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 110,
                width: 230,
              ),
              const SizedBox(
                height: 180,
              ),
              ManageMemberBtn(
                btnName: '로그인',
                onPressed: () {
                  print('로그인');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ManageMemberBtn(
                btnName: '회원가입',
                onPressed: () {
                  print('회원가입');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
