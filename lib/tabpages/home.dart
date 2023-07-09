import 'package:flutter/material.dart';

class home_tab extends StatefulWidget {
  const home_tab({super.key});

  @override
  State<home_tab> createState() => _home_tabState();
}

class _home_tabState extends State<home_tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home"),
      ),
    );
  }
}