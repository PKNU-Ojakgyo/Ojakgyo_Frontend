import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.textType,
  }) : super(key: key);

  final String textType;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        obscureText: widget.textType == '비밀번호' ? true : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9), // 또는 다른 적합한 색상
            ),
          ),
          hoverColor: Colors.transparent, // 마우스 호버 효과 제거
          labelText: widget.textType,
        ),
      ),
    );
  }
}
