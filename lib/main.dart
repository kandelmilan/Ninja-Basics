import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/ExamApp/LogoLanding.dart';
import 'package:flutter_test_app/ExamApp/girl.dart';
import 'package:flutter_test_app/ExamApp/level.dart';
import 'package:flutter_test_app/demo.dart';
import 'package:flutter_test_app/ExamApp/analysis.dart';
import 'package:flutter_test_app/pages/landing_page.dart';
import 'package:flutter_test_app/pages/productDisplay.dart';
import 'pages/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Level());
  }
}


// open -a Simulator   
// flutter devices   
// flutter run   

// this is used to run in the vs code 