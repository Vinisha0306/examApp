import 'package:examapp/views/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:examapp/utils/MyRoutes.dart';
import 'views/screens/DetailPage.dart';
import 'views/screens/CartPage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.DetailPage: (context) => const DetailPage(),
        MyRoutes.CartPage: (context) => CartPage(),
      },
    );
  }
}
