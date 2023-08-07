import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
    required this.mainTitle,
  }) : super(key: key);

  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              mainTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }
}
