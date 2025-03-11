import 'package:flutter/material.dart';
import 'package:module_b/presentation/providers/launch_provider.dart';

import '../../common/color.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      launchProvider.addListener(updateScreen);
      launchProvider.startAnimation(context);
    });
  }

  @override
  void dispose() {
    launchProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          AnimatedSlide(
            offset: Offset(0  , launchProvider.isStartAppBarAnimation ? 0 : -1),
            duration: Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 26),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(18),
                ),
              ),
              child: Image.asset(
                'assets/images/skills.png'
              ),
            ),
          ),
          Spacer(flex: 1),
          AnimatedOpacity(
            opacity: launchProvider.isStartLogoAnimation ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scaleY: 0.8,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width-40,
                    height: MediaQuery.sizeOf(context).width-40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff363A3E),
                          Color(0xff363A3E),
                          Color(0xff363A3E),
                          Color(0xff363A3E),
                        ]
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/showtime_logo.png',
                  width: MediaQuery.sizeOf(context).width/2,
                  height: MediaQuery.sizeOf(context).width/2,
                )
              ],
            )
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}
