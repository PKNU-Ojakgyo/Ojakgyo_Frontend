import 'package:flutter/material.dart';

class InquiryBtn extends StatelessWidget {
  const InquiryBtn({
    Key? key,
    required this.btnName,
  }) : super(key: key);

  final String btnName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          ),
          onPressed: () => {print('click')},
          child: Column(
            children: [
              Text(
                btnName,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
