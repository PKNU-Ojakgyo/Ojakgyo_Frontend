import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:ojakgyo/src/pages/main_page.dart';
import 'package:ojakgyo/src/services/signature_post.dart';

class SignPad extends StatefulWidget {
  const SignPad({
    Key? key,
    required this.isSeller,
    required this.contractId,
  }) : super(key: key);

  final bool isSeller;
  final int contractId;

  @override
  State<SignPad> createState() => _SignPadState();
}

class _SignPadState extends State<SignPad> {
  final GlobalKey<SfSignaturePadState> _signaturePadGlobalKey = GlobalKey();
  final SignaturePost _signaturePost = SignaturePost();

  Future<String> sendSign() async {
    final signatureImage = await _signaturePadGlobalKey.currentState!.toImage();
    final signatureBytes =
        await signatureImage.toByteData(format: ui.ImageByteFormat.png);
    final signatureBase64 = base64Encode(signatureBytes!.buffer.asUint8List());

    try {
      String signAt = await _signaturePost.signaturePost(
          isSeller: widget.isSeller,
          signature: signatureBase64,
          contractId: widget.contractId);

      return signAt;
    } catch (e) {
      throw Exception(e);
    }
  }

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
              backgroundColor: Colors.transparent,
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
            String signAt = await sendSign();
            print(signAt);

            if (!mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          },
          isModal: true,
        ),
      ],
    );
  }
}
