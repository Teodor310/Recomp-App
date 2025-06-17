import 'package:flutter/material.dart';
import 'dart:math';

import 'package:recomp_ai/data/constants.dart';

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
    print("Screen height: $screenHeight");

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CustomPaint(
                size: const Size(200, 200),
                painter: CircleProgressPainter(percentage: percentage * 100),
                child: Container(
                  alignment: Alignment.bottomRight,
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      '$displayPercentage %',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nutrients Indicator",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: widgitsColor,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text('x/250', style: TextStyle(fontSize: 15)),
                      LinearProgressIndicator(
                        value: percentage,
                        color: Color(0xFFE56571),
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      Text("Proteins", style: TextStyle(fontSize: 17)),
                      SizedBox(height: 20),
                      Text('x/340', style: TextStyle(fontSize: 15)),
                      LinearProgressIndicator(
                        value: percentage,
                        color: Color(0xFF59FFC4),
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      Text("Carbs", style: TextStyle(fontSize: 17)),
                      SizedBox(height: 20),
                      Text('x/118', style: TextStyle(fontSize: 15)),
                      LinearProgressIndicator(
                        value: percentage,
                        color: Color(0xFFFFA072),
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(60.0),
                      ),

                      Text("Fats", style: TextStyle(fontSize: 17)),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changePercentage,
                    child: const Text("edit progress"),
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

class CircleProgressPainter extends CustomPainter {
  final double percentage;

  CircleProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 25.0;
    // final radius = (size.width / 2) - strokeWidth / 2;
    final radius = size.width * 0.6;
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
