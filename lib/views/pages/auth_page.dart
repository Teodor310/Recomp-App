import 'package:flutter/material.dart';
import 'package:recomp_ai/views/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recomp_ai/views/widget_tree.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user is logged in
          if (snapshot.hasData) {
            return WidgetTree();
          }
          // if user is not logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
