import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/ExamApp/LogoLanding.dart';
import 'package:flutter_test_app/demo.dart';
import 'package:flutter_test_app/pages/landing_page.dart';
import 'pages/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoLanding(),
    );
  }
}
