import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Image.asset('assets/images/bg.jpg')]);
  }
}
