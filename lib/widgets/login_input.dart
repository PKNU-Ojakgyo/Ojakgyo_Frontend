import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFD8E8E9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
