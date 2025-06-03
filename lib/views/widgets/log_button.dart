import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.tealAccent.shade100, // Light teal color
          borderRadius: BorderRadius.circular(50), // Pill shape
        ),
        child: const Center(
          child: Text(
            "Log in",
            style: TextStyle(
              color: Colors.black, // Black text
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
