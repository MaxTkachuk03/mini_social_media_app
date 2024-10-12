import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media_app/helper/helper_function.dart';
import 'package:mini_social_media_app/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  void register() async {
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator());

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);

      displayMessageToUser('Password don\'t match!!!', context);
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          Navigator.pop(context);
          displayMessageToUser(e.code, context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
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
                    onTap: () => register(),
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
                        onPressed: widget.onPressed,
                        child: Text(
                          'Login here',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
