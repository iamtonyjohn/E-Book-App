
// ignore_for_file: unused_import

import 'package:ebook/Config/Themes.dart';
import 'package:ebook/Pages/SplacePage/SplacePage1.dart';
import 'package:ebook/Pages/WelcomePage/WelcomePage.dart';
import 'package:ebook/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() 
async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Book',
      theme: lightTheme,
    // home: const WelcomePage(),
     home:const SplacePage1(),
  );
  }
}


