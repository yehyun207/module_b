import 'package:flutter/material.dart';
import 'package:module_b/common/color.dart';
import 'package:module_b/presentation/providers/main_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
      mainProvider.loadGenreList();
    });
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Image.asset(
            'assets/images/showtime_logo.png',
          ),
          actions: [
            SizedBox(
              width: size.width - 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mainProvider.genreList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      mainProvider.genreList[index].name,
                      style: TextStyle(
                        color: Colors.white, fontSize: 16
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      backgroundColor: backgroundColor, ,
    );
  }
}
