import 'package:flutter/material.dart';
import 'package:module_b/common/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'HOME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(children: [Center(child: Text('test'))]),
    );
  }
}
