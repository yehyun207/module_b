import 'package:flutter/material.dart';
import 'package:module_b/common/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          '검색',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
