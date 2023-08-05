import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';

class RegisterTranPage extends StatefulWidget {
  const RegisterTranPage({super.key});

  @override
  State<RegisterTranPage> createState() => _AppState();
}

class _AppState extends State<RegisterTranPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavBar(),
      backgroundColor: Colors.white,
      body: Text('거래 등록 페이지'),
    );
  }
}
