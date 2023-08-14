import 'package:flutter/material.dart';

class InquiryBtn extends StatelessWidget {
  const InquiryBtn({
    Key? key,
    required this.btnName,
    required this.returnWidget,
  }) : super(key: key);

  final String btnName;
  final Widget returnWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return returnWidget;
                });
          },
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
