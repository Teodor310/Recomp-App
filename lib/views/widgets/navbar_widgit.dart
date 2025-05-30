import 'package:flutter/material.dart';
import 'package:recomp_ai/data/notifiers.dart';

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
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.book), label: "Journal"),
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.food_bank), label: "Input"),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          onDestinationSelected: (value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage, // highlight selected icon
        );
      },
    );
  }
}
