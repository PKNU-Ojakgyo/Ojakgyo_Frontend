import 'package:flutter/material.dart';

class InquiryLockerDialog extends StatefulWidget {
  const InquiryLockerDialog({super.key});

  @override
  State<InquiryLockerDialog> createState() => _InquiryLockerDialogState();
}

class _InquiryLockerDialogState extends State<InquiryLockerDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 630,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: const [
              Text(
                "락커 조회하기",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
