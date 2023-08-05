import 'package:flutter/material.dart';

class InquiryBtn extends StatelessWidget {
  const InquiryBtn({
    Key? key,
    required this.btnName,
  }) : super(key: key);

  final String btnName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {print('click')},
      child: Text(
        btnName,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
