import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),

      child: Column(
        children: [
          Text("This is Settings"),
          ElevatedButton(onPressed: () {}, child: Text("Klick me please")),
        ],
      ),
    );
  }
}
