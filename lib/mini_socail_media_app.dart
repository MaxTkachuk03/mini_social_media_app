import 'package:flutter/material.dart';
import 'package:mini_social_media_app/auth/auth.dart';
import 'package:mini_social_media_app/pages/home/home_page.dart';
import 'package:mini_social_media_app/pages/profile/profile_page.dart';
import 'package:mini_social_media_app/pages/users/users_page.dart';
import 'package:mini_social_media_app/theme/theme.dart';

class MiniSocialMediaApp extends StatelessWidget {
  const MiniSocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/users_page': (context) => const UsersPage(),
      },
    );
  }
}
