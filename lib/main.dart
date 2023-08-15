import 'package:flutter/material.dart';
// import 'package:ojakgyo/src/pages/main_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ojakgyo/src/services/user_data.dart';
// import 'package:ojakgyo/src/pages/start_page.dart';
import 'package:ojakgyo/src/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String jsonString = await rootBundle.loadString('lib/src/testdata/user.json');
  Map<String, dynamic> userJson = json.decode(jsonString);

  User user = User.fromJson(userJson);

  runApp(App(user: user));
}

class App extends StatefulWidget {
  const App({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      // home: StartPage(),
      // home: MainPage(
      //   user: widget.user,
      // ),
    );
  }
}
