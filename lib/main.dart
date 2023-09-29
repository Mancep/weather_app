import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: HomeScreen.nameRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
        tabBarTheme: TabBarTheme(
          splashFactory: NoSplash.splashFactory,
        ),
      ),
    );
  }
}
