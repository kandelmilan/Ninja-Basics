import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/ExamApp/examLanding.dart';
import 'package:flutter_test_app/ExamApp/LogoLanding.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoLanding(),
    );
  }
}


// open -a Simulator   
// flutter devices   
// flutter run   

// this is used to run in the vs code 