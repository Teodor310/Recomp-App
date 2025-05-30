import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percentage = 0;

  void changePercentage() {
    setState(() {
      percentage >= 1.0 ? percentage = 0 : percentage = percentage;
      percentage += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("This is Home page"),
          Container(
            child: CircularProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          ),
          ElevatedButton(
            onPressed: changePercentage,
            child: Text("edit circle"),
          ),
        ],
      ),
    );
  }
}
