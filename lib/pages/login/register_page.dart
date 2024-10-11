import 'package:flutter/material.dart';
import 'package:mini_social_media_app/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onPressed});

  final void Function() onPressed;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              const Spacer(
                flex: 2,
              ),
              //const SizedBox(height: 25),
              // app name
              const Text(
                "M I N I M A L",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(flex: 5),
              //const SizedBox(height: 50),
              // username
              MyTextField(
                controller: usernameController,
                obscureText: false,
                hintText: 'Username',
              ),
              const Spacer(),
              //const SizedBox(height: 10),
              // email textfield
              MyTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Email',
              ),
              const Spacer(),
              // password textfield
              MyTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),
              const Spacer(),
              MyTextField(
                controller: confirmPasswordController,
                obscureText: true,
                hintText: 'Confrim Password',
              ),
              const Spacer(flex: 3),

              // sign in button
              MyButton(
                text: 'Register',
                onTap: () {},
              ),
              const Spacer(flex: 2),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'Login here',
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
