import 'package:flutter/material.dart';
import 'package:module_b/common/color.dart';

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('공개예정',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white
        ),),
      ),
    );
  }
}
