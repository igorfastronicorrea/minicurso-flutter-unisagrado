import 'package:cryptoapp/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
