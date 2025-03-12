import 'package:flutter/material.dart';
import 'package:module_b/presentation/screens/launch_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repositories/shared_pref_repository.dart';

late final SharedPrefRepository sharedPrefRepository;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  sharedPrefRepository = SharedPrefRepository(await SharedPreferences.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaunchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

