import 'package:flutter/material.dart';
import 'package:mini_social_media_app/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onPressed});

  final void Function() onPressed;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person_rounded,
                size: 80.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              // app name
              const Text(
                "M I N I M A L",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              // email textfield
              MyTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),
              const SizedBox(height: 10),
              // password textfield
              MyTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),
              const SizedBox(height: 10),
              // forgor password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: 'Login',
                onTap: () {},
              ),
              const SizedBox(height: 25),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'Register here',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
