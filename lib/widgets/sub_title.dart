import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
