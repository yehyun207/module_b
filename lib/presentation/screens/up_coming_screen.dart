import 'package:flutter/material.dart';
import 'package:module_b/common/color.dart';

import '../providers/main_provider.dart';

class UpComingScreen extends StatefulWidget {
  const UpComingScreen({super.key});

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            '공개예정',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: backgroundColor,
        body: GridView.builder(
          itemCount: mainProvider.topRatedMovieList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (MediaQuery.sizeOf(context).width * 0.28) /
                (((MediaQuery.sizeOf(context).width * 0.28) * 1.2) + 100),
          ),
          itemBuilder: (context, index) {
            return Column(children: [
              Image.network(
                'https://image.tmdb.org/t/p/original/${mainProvider.topRatedMovieList[index].poster_path}',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${mainProvider.topRatedMovieList[index].release_date.replaceAll('-', '.')} 예정',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              )
            ]);
          },
        ));
  }
}
