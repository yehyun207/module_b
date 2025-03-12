import 'package:flutter/material.dart';
import 'package:module_b/presentation/screens/download_screen.dart';
import 'package:module_b/presentation/screens/profile_screen.dart';
import 'package:module_b/presentation/screens/search_screen.dart';
import 'package:module_b/presentation/screens/up_coming_screen.dart';
import '../screens/home_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
    const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    UpComingScreen(),
    DownloadScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: '공개예정'),
          BottomNavigationBarItem(icon: Icon(Icons.download_outlined), label: '다운로드'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: '프로필'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
