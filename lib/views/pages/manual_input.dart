import 'package:flutter/material.dart';

class ManualInputPage extends StatefulWidget {
  const ManualInputPage({super.key});

  @override
  State<ManualInputPage> createState() => _ManualInputPageState();
}

class _ManualInputPageState extends State<ManualInputPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [Text("This is manual input screen")]),
    );
  }
}
