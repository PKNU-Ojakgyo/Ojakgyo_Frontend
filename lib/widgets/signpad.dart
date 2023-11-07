import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:ojakgyo/src/pages/main_page.dart';

class SignPad extends StatefulWidget {
  const SignPad({Key? key}) : super(key: key);

  @override
  State<SignPad> createState() => _SignPadState();
}

class _SignPadState extends State<SignPad> {
  final GlobalKey<SfSignaturePadState> _signaturePadGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 400,
        height: 290,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: Color.fromARGB(221, 53, 53, 53),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '서명을 해주세요.',
                  style: TextStyle(
                      color: Color.fromARGB(221, 53, 53, 53), fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SfSignaturePad(
              key: _signaturePadGlobalKey,
              backgroundColor: const Color(0xFFD9D9D9),
              minimumStrokeWidth: 4.0,
              maximumStrokeWidth: 4.0,
            ),
          ],
        ),
      ),
      actions: [
        RegisterBtn(
          btnName: '재시도',
          onPressed: () async {
            _signaturePadGlobalKey.currentState!.clear();
          },
          isModal: true,
        ),
        RegisterBtn(
          btnName: '확인',
          onPressed: () async {
            // 이미지 파일로 받아서 Encode
            // final signatureImage =
            //     await _signaturePadGlobalKey.currentState!.toImage();
            // final signatureBytes =
            //     await signatureImage.toByteData(format: ui.ImageByteFormat.png);
            // final signatureBase64 =
            //     base64Encode(signatureBytes!.buffer.asUint8List());

            if (!mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );

            // 서버에서 받아올 때 Decode 테스트
            // final signatureBytes_result = base64Decode(signatureBase64);
          },
          isModal: true,
        ),
      ],
    );
  }
}
