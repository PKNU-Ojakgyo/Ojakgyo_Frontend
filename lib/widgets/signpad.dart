import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignPad extends StatefulWidget {
  const SignPad({super.key});

  @override
  State<SignPad> createState() => _SignPadState();
}

class _SignPadState extends State<SignPad> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: SfSignaturePad(
          backgroundColor: Colors.green,
          minimumStrokeWidth: 4.0,
          maximumStrokeWidth: 4.0,
        ),
      ),
    );
  }
}
