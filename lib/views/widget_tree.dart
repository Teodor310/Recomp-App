import 'package:flutter/material.dart';
import 'package:recomp_ai/data/notifiers.dart';
import 'package:recomp_ai/views/pages/home_page.dart';
import 'package:recomp_ai/views/pages/journal.dart';
import 'package:recomp_ai/views/pages/manual_input.dart';
import 'package:recomp_ai/views/pages/settings.dart';
import 'package:recomp_ai/views/widgets/navbar_widgit.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

List<Widget> screens = [
  ManualInputPage(),
  HomePage(),
  JournalPage(),
  SettingsPage(),
];

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recomp AI")),
      body:
      //Image.asset('assets/images/bg.jpg'),
      ValueListenableBuilder(
        valueListenable: selectedPageNotifier,

        builder: (context, selectedPage, child) {
          return screens.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidgit(),
    );
  }
}
