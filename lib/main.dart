import 'package:flutter/material.dart';
import 'package:password_manager/constants/theme/theme.dart';
import 'package:password_manager/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive
  //   ..initFlutter()
  //   ..registerAdapter(PasswordModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: KThemeData.darkThemeData,
      home: const HomePage(),
    );
  }
}
