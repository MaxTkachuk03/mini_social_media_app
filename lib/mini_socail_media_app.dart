import 'package:flutter/material.dart';
import 'package:mini_social_media_app/auth/login_or_register.dart';
import 'package:mini_social_media_app/pages/pages.dart';
import 'package:mini_social_media_app/theme/theme.dart';

class MiniSocialMediaApp extends StatelessWidget {
  const MiniSocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
