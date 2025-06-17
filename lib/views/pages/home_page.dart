import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percentage = 0;

  void changePercentage() {
    setState(() {
      if (percentage >= 1.0) {
        percentage = 0;
      }
      percentage += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayPercentage = (percentage * 100).clamp(0, 100).round();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is Home page"),
            const SizedBox(height: 20),
            CustomPaint(
              size: const Size(200, 200),
              painter: CircleProgressPainter(percentage: percentage * 100),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    '$displayPercentage %',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changePercentage,
              child: const Text("edit circle"),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double percentage;

  CircleProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 20.0;
    final radius = (size.width / 2) - strokeWidth / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final startAngle = -97.5 * pi / 180;
    final sweepAngle = 2 * pi * (percentage / 100);

    final backgroundPaint =
        Paint()
          ..color = Colors.grey.shade300
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final foregroundPaint =
        Paint()
          ..color = const Color(0xFF8FE1D7)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
