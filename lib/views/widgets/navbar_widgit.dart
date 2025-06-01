import 'package:flutter/material.dart';
import 'package:recomp_ai/data/notifiers.dart';
import 'package:recomp_ai/data/constants.dart';

class NavbarWidgit extends StatefulWidget {
  const NavbarWidgit({super.key});

  @override
  State<NavbarWidgit> createState() => _NavbarWidgitState();
}

class _NavbarWidgitState extends State<NavbarWidgit> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        // when another item is selected, we need to rebuild the navbar to highlight the item
        return SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 82),
                painter: NavBarPainter(),
              ),
              Positioned(
                bottom: 43,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: primaryColor,
                  onPressed: () {
                    selectedPageNotifier.value = 2;
                  },
                  child: Icon(Icons.food_bank),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // auto layout
                  children: [
                    _navItem(Icons.scale, "Scale", 0, selectedPage),
                    _navItem(Icons.home, "Home", 1, selectedPage),
                    SizedBox(width: 56),

                    _navItem(Icons.book, "Journal", 3, selectedPage),
                    _navItem(Icons.settings, "Settings", 4, selectedPage),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _navItem(IconData icon, String label, int index, int selectedIndex) {
  final isSelected = selectedIndex == index;
  return GestureDetector(
    onTap: () => selectedPageNotifier.value = index,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? Colors.black : Colors.grey),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.black : Colors.blueGrey,
          ),
        ),
      ],
    ),
  );
}

class NavBarPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, size.width, size.height),
    //   Paint()..color = Colors.red,
    // );
    double width = size.width;

    print("Screen width: $width");
    final paint = Paint();
    paint.color = widgitsColor;
    paint.style = PaintingStyle.fill;
    // paint.shadowColor = Colors.black.withOpacity(0.1);
    final path = Path();
    final centerX = size.width / 2;
    path.moveTo(0, 0);
    path.lineTo(centerX - 75, 0);

    // Curve down into the dip
    path.quadraticBezierTo(
      centerX - (75 + 37.5) / 2,
      0,
      centerX - 75 + 37.5,
      28,
    );

    // Arc forming the main circular dip
    path.arcToPoint(
      Offset(centerX + 37.5, 28),
      radius: const Radius.circular(43),
      clockwise: false,
    );
    path.quadraticBezierTo(centerX + (75 + 37.5) / 2, 0, centerX + 75, 0);
    // Curve back up from the dip
    // path.quadraticBezierTo(centerX + 35, 0, centerX + 45, 0);

    // Complete the top edge to the right
    path.lineTo(size.width, 0);

    // Draw the rest of the rectangle
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Optional shadow for depth
    //canvas.drawShadow(path, Colors.black, 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
