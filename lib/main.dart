import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/list_card.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
                ListCard(
                    tranState: '거래중',
                    tranDate: '2023.08.03 14:10',
                    tranPerson: '후추동생',
                    tranItem: '그리니즈',
                    tranPrice: '4,000원'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
