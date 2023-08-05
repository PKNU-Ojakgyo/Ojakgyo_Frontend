import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/register_btn.dart';

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
          ],
        ),
      ),
    );
  }
}
