import 'package:flutter/material.dart';

class EmptyProfileCard extends StatelessWidget {
  const EmptyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Color(0xff232935),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          '등록된 프로필이 없습니다.\n프로필 추가 후 이용가능 합니다.',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
