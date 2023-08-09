import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.textType,
    required this.hintText,
    required this.isDefault,
    required this.controller,
    this.defaultValue = '',
  }) : super(key: key);

  final String textType;
  final String hintText;
  final bool isDefault;
  final TextEditingController controller;
  final String defaultValue;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        style: TextStyle(
          color: widget.isDefault
              ? const Color.fromARGB(255, 77, 77, 77)
              : Colors.black,
        ),
        enabled: !widget.isDefault,
        controller: widget.isDefault
            ? TextEditingController(text: widget.defaultValue)
            : widget.controller, // 초기값 설정
        decoration: InputDecoration(
          hintText: widget.hintText,
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
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9),
            ),
          ),
        ),
      ),
    );
  }
}
