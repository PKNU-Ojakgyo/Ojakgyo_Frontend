import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ojakgyo/src/pages/main_page.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String jsonString = await rootBundle.loadString('lib/src/testdata/user.json');
  Map<String, dynamic> user = json.decode(jsonString);

  print('ID: ${user["id"]}');
  print('Name: ${user["name"]}');
  print('Password: ${user["password"]}');
  print('Phone: ${user["phone"]}');

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
