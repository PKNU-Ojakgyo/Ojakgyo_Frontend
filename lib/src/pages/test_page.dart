import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/signpad.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TestPage> createState() => _AppState();
}

class _AppState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            Container(
              child: const SignPad(),
            ),
          ],
        ),
      ),
    );
  }
}
