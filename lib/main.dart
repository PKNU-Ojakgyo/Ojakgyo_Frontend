import 'package:flutter/material.dart';
import 'package:ojakgyo/src/pages/main_page.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // String jsonString = await rootBundle.loadString('lib/src/testdata/user.json');
  // Map<String, dynamic> user = json.decode(jsonString);

  // runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(
        userName: '손성아',
      ),
    );
  }
}
