import 'package:flutter/material.dart';
import 'package:ojakgyo/src/pages/main_page.dart';

class BackNavBar extends StatelessWidget implements PreferredSizeWidget {
  const BackNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF23225C),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
