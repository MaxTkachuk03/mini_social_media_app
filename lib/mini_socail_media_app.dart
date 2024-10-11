import 'package:flutter/material.dart';

class MiniSocialMediaApp extends StatelessWidget {
  const MiniSocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
