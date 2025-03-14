import 'package:flutter/material.dart';
import '../../common/color.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/empty_profile_card.dart';
import '../providers/main_provider.dart';
import '../providers/select_profile_provider.dart';
import 'create_profile_screen.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectProfileProvider.addListener(updateScreen);
      selectProfileProvider.loadProfiles();
    });
  }

  @override
  void dispose() {
    selectProfileProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '시청할 프로필을 선택하세요.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(flex: 10),
            selectProfileProvider.profiles.isEmpty
                ? EmptyProfileCard()
                : _ProfilesList(),
            Spacer(flex: 15),
            Center(
              child: GestureDetector(
                onTap: () async{
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateProfileScreen()),
                  );
                  selectProfileProvider.loadProfiles();
                },
                child: Column(
                  children: [
                    Icon(Icons.add_circle_outline,
                        color: Colors.white, size: 60),
                    SizedBox(height: 6),
                    Text(
                      '프로필 추가',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }

  Widget _ProfilesList() {
    return Center(
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        children: selectProfileProvider.profiles
            .map((profile) => GestureDetector(
          onTap: () async {
            mainProvider.setSelectedProfile(profile);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => CustomBottomNavigationBar()),
            );
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.white),
              color: profile.backgroundColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              profile.profileName[0],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
