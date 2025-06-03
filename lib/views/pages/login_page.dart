import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recomp_ai/views/widgets/log_button.dart';
import 'package:recomp_ai/views/widgets/log_textfield.dart';
import 'package:recomp_ai/views/widgets/log_squaretile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  // showErrorMessage popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Login Error'),
            content: Text(message),
          ),
    );
  }

  // Sign in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      barrierDismissible: false, // prevent dismissing by tapping outside
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context); // close loading dialog on success
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // close loading dialog on failure

      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Incorrect password. Please try again.');
      } else {
        showErrorMessage('Login failed. ${e.message}');
      }
    } catch (e) {
      Navigator.pop(context); // close loading dialog on unexpected error
      showErrorMessage('An unexpected error occurred.');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // makes sure UI doesn't overflow
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                SvgPicture.asset(
                  'assets/images/login.svg',
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 50),

                // welcome message
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(height: 25),

                // username field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // sign in button or loader
                MyButton(onTap: signUserIn),

                const SizedBox(height: 50),

                // or continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // social buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(imagePath: 'assets/images/google.png'),
                    SizedBox(width: 25),
                    SquareTile(imagePath: 'assets/images/apple.png'),
                  ],
                ),

                const SizedBox(height: 10),

                // register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
